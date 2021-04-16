function [ em0 ]= compute_spec_emiss_model ( freq,tht,sst,salinity )
                    %����ƽ������ķ����ʣ����ּ�����ʽ��
% freq��Ƶ�ʣ�tht�������
% 计算平静海面发射�?

f0 = 17.97510;

[e0s,e1s,e2s,n1s,n2s,sig] = compute_dielectric_model (sst,salinity);
%�ο�comepute_dielectric_model
costht=cosd(tht);%cos��tht��
sinsqtht=1.0-costht.*costht;% sin��tht����ƽ��

permit = (e0s - e1s)./(1.0 - j.*(freq./n1s)) + (e1s - e2s)./(1.0 - j.*(freq./n2s)) + e2s + j.*sig.*f0./freq;
%�������һ����ʽ���м�ķ��������Ĳ�һ����
permit = conj(permit);%����
esqrt=sqrt(permit-sinsqtht);
rh=(costht-esqrt)./(costht+esqrt);
rv=(permit.*costht-esqrt)./(permit.*costht+esqrt);

em0(1)  =1.0-rv.*conj(rv);
em0(2)  =1.0-rh.*conj(rh);%������ּ��������µķ����ʡ�

end