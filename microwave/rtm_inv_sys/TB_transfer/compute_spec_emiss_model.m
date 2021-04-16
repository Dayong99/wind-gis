function [ em0 ]= compute_spec_emiss_model ( freq,tht,sst,salinity )
                    %计算平静海面的发射率（两种极化方式）
% freq是频率，tht是入射角
% 璁＄畻骞抽潤娴烽潰鍙戝皠鐜?

f0 = 17.97510;

[e0s,e1s,e2s,n1s,n2s,sig] = compute_dielectric_model (sst,salinity);
%参考comepute_dielectric_model
costht=cosd(tht);%cos（tht）
sinsqtht=1.0-costht.*costht;% sin（tht）的平方

permit = (e0s - e1s)./(1.0 - j.*(freq./n1s)) + (e1s - e2s)./(1.0 - j.*(freq./n2s)) + e2s + j.*sig.*f0./freq;
%这里最后一个公式和中间的符号与论文不一样。
permit = conj(permit);%求共轭
esqrt=sqrt(permit-sinsqtht);
rh=(costht-esqrt)./(costht+esqrt);
rv=(permit.*costht-esqrt)./(permit.*costht+esqrt);

em0(1)  =1.0-rv.*conj(rv);
em0(2)  =1.0-rh.*conj(rh);%算出两种极化条件下的发射率。

end