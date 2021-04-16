%%% 输入参数：
%%% TB_meas
%%% 输出参数：
%%% costfunc: cost function value at end of convergence
%%% pseudoHessian: pseudoHessian matrix
%%% mTB: model brightness temperatures at end of convergence process
%%% niter: number of iterations

function [retrieval_results,error] = iterativeScheme_czw(TB_meas, f_g, sigma, SST_param)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 反演参数设置 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N_meas = 2*length(SST_param.theta);
first_guess = f_g;
prior = 286.7;
sigma_prior = 11.9;
faraRot = 5*ones(N_meas,1);
geomRot = 350*ones(N_meas,1);
sigma_meas = sigma*ones(N_meas,1);
% sigma_meas = 0.5.*randn(N_meas,1);
% sigma_meas = 1.4+2.0*rand(N_meas,1); % 测量不确定度取为1.4K~3.4K之间的随机数
sig_mod_target = [0.5 0 0 0;
                  0 0.5 0 0;
                  0 0 0.1 0;
                  0 0 0 0.1];
N_retrievedParam = 1;  % 反演参数的个数，当前模式：SSS,SST,UN10，VN10，TEC
N=N_meas + N_retrievedParam;
Tg_it_max = 200;  % Maximum number of iterations allowed
Tg_lambda_dia_max = 1000;
delta_Chi = 0.001; % Chi variance ratio for convergence test 1
delta_Sig = 0.01; % Parameter variation ratio for  convergence test 2
delta_p = [0.01]; % SSS increment to compute the derivatives

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initialization %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% insert priors of adjusted parameters
X_data = [TB_meas ; prior]; % Data and prior parameter vector

% variance-covariance matrix ,uncertainty from the measurements
sigma2_meas = sigma_meas.^2;

% uncertainty of the model
% sig_mod_ant1 = zeros(N_meas,1);
for i=1:N_meas
    sig_mod_ant = computeErrorModel_czw(sig_mod_target,faraRot(i),geomRot(i));
    sig_mod_ant1(i,1) = sig_mod_ant(1);
end

C0 = zeros(N,N);
for i=1:N_meas
    C0(i,i) = sigma2_meas(i)+sig_mod_ant1(i) * sig_mod_ant1(i);
end

% set diagonal elements of C0 with square of uncertainties on priors
sigma2_prior = sigma_prior.^2;
i1=N_meas+1;
for i=1:N_retrievedParam
    C0(i1,i1)=sigma2_prior(i);
    i1=i1+1;
end

% compute inverse of var-covar matrix
C0_inv = inv(C0);

% first computation of model brightness temperatures with first guesses
% make a copy of full list of geophysical parameters
% p_tot = geophysical_para;

% make copies of the adjusted geophysical parameters
p = first_guess;
para = p;

% update geophysical parameters according to the dependencies between them
% updateParameters(configHandle, gp->geophyParamValue, gp);
SST_param.SST = p;

% call the forward model
% computeForwardModelContributions(configHandle, meas, -1);
[TB_mod] = TBForwardModelFromSST(SST_param);


% insert the measurement value in X_mod 
% insert first guess of adjuted parameters
X_mod_data = [TB_mod; p];

% compute initial cost function
chi2 = computeCostFunction_czw(X_data, X_mod_data, C0_inv);

% keep a copy of the model brightness temperatures in A_mod_ref for partial derivative computation
A_mod_ref = X_mod_data;

% initalise chan: must compute partial derivatives
chan = 1;  % TRUE

% initialise the Marquardt damping factor
kd = 0.1;
lamda_Init = 0.001;
lamda_Dia = kd * lamda_Init;

% initialize F to zero and then add ones at the bottom of F
F_data = zeros(N , N_retrievedParam);
j=1;
for i=(N_meas+1):N
    F_data(i,j) = 1;
    j=j+1;
end

%%%%%%%%%%%%%%% The loop of the iterative retrieval scheme %%%%%%%%%%%%%%%%
for nit = 1:Tg_it_max
    
    % computation of partial derivatives
    if chan
        % Partial derivatives are computed if parameters to be adjusted
        % have been modified
        
        %%%% update geophysical parameters
        SST_param.SST = para + delta_p;  % geo_data(1)=SSS
 
        for jp = 1:N_retrievedParam
            
            % run forward model
            % computeForwardModelContributions(configHandle, meas,
            % iterConf->retrievParamId[jp]);
            [TB_mod] = TBForwardModelFromSST(SST_param);

            i1=1;
            for i=1:N_meas
                F_data(i1,jp) = (TB_mod(i1)-A_mod_ref(i1))/delta_p(1);
                i1=i1+1;     
            end
        end          
            % computePseudoHessian(&F, &C0inv, /* inputs */
            % /* outputs */&Ft, &M);
            [M,Ft] = computePseudoHessian_czw(F_data, C0_inv);
    end
    
    % compute length of Step
    % computeLengthOfStep(&M, &C0inv, &Ft, &X, &X_mod, lamdaDia, &dp);
    dp_data = computeLengthOfStep_czw(M, C0_inv, Ft, X_data, X_mod_data, lamda_Dia);
    
    % the step: update adjusted parameters
    for i = 1:N_retrievedParam
        p(i) = para(i) + dp_data(i);
    end
    % copy new parameters
    %%% updateParameters
    SST_param.SST = p;
   
    % compute model brightness temperatures
    % computeForwardModelContributions(configHandle, meas, -1)
    [TB_mod] = TBForwardModelFromSST(SST_param);

    % insert updated parameter values
    X_mod_data = [TB_mod;p];
    
    % compute new chi2
    % computeCostFunction(&X, &X_mod, &C0inv, /* inputs */
                % /* outputs */&chi2New);
    chi2New = computeCostFunction_czw(X_data, X_mod_data, C0_inv);
    
    % compare the new cost function value to the old one
    chi2_0=chi2;
    if chi2New < chi2
        % decrease Marquardt increment
        lamda_Dia = lamda_Dia * kd;
        % update parameter values
        for i = 1:N_retrievedParam
            para(i)=p(i);
        end
        % update reference of cost function
        chi2=chi2New;
        % Partial derivative must be computed during next iteration
        chan=1;
        % update model brightness temperatures
        for i=1:N_meas
            A_mod_ref(i) = X_mod_data(i);
        end
        
    else   % cost function increases
        % increase Marquardt increment
        lamda_Dia = lamda_Dia / kd;
        % partial derivatives do not need to be computed again
        chan=0;
        %%% step back
        % update X_mod with old values of the forward model and old values
        % of the parameters
        for i=1:N_meas
            X_mod_data_1(i,1)=A_mod_ref(i);
        end
        % update X_mod with old values of the parameters
        X_mod_data = [X_mod_data_1 ; para];
       
        % check if Marquardt increment is not too large
        if lamda_Dia > Tg_lambda_dia_max
            % disp('Marquardt increment is too large,exit from convergence loop');
            break; % exit from convergence loop
        end    
    end
    chi2NewMinuschi2_0=chi2New - chi2_0;
    
    %%% convergence Test: exist if cost function is stable and parameter 
    %%% increment is small
    % compute largest increment of parameters
    maxRelatIncParam = abs(dp_data(1))/sigma_meas(1);
    for i=1:N_retrievedParam
        if(abs(dp_data(i)/sigma_meas(i)) > maxRelatIncParam)
            maxRelatIncParam = abs(dp_data(i))/sigma_meas(i);
        end
    end
    if((abs(chi2NewMinuschi2_0/chi2) < delta_Chi) && ...
            maxRelatIncParam < delta_Sig)
        % exit from retrieval loop
        %disp('exit from retrieval loop');
        break;
    end
end

%disp('Convergence Process over!');
% % set the number of iteration
% niter = nit;

% store adjusted parameters
retrieval_results = SST_param.SST;

%%%%%%%%%%%%%%%%%%%%%%% Estimation of parameter errors%%%%%%%%%%%%%%%%%%%%%
% compute theoretical uncertainties on parameters
% compute inverse of M using Cholesky decomposition. Put result in Minv
M_inv = inv(M);
for i=1:N_retrievedParam
    error(i) = sqrt(M_inv(i));
end
