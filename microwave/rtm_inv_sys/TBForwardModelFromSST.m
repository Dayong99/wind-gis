function [TB_m] = TBForwardModelFromSST(SST_param)

%���������TB_m �ó����½��
%���������SST_param�������������¶ȣ��ζȣ�����ǶȵȲ���)

% ������(�������¶�)
% SST_param.SST
% %% ������������
% % Ƶ��
% SST_param.freq
% % �����ζ�
% SST_param.SSS
% % ����10�ײ��߷���
% SST_param.wind_speed
% %����Һ̬ˮ����
% SST_param.liquid
% %����ˮ������
% SST_param.vapor
% % �۲������
% SST_param.theta
% %��ʵ��������ڷ���ƹ۲ⷽ��ļн�
% SST_param.phi

f=SST_param.freq; %Ƶ��
sal=SST_param.SSS; %�ζ�
Ts=SST_param.SST; %�����¶�
ssws=SST_param.wind_speed; %�������
phir=SST_param.phi; %������Է���
V=SST_param.vapor; %����ˮ������
L=SST_param.liquid; %����Һ̬ˮ����
sita=SST_param.theta; %�۲������

[ tran, tbdn, tbup ] = compute_atm_model ( sita, V, L, Ts, f); %�������͸���ʡ��������¡���������
[ tbsurf ]=compute_surf_tb_model(f, sita, Ts, sal, ssws, phir, tran, tbdn); %���㺣�淢������

TB_v=tbsurf(1)+tran.*tbup; %��ֱ��������
TB_h=tbsurf(2)+tran.*tbup; %ˮƽ��������

TB_m(1) = TB_v;
TB_m(2) = TB_h;

TB_m = TB_m'; %ת��Ϊ������

end

