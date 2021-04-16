% function [e0,ewind,omega,edirstokes,eharm,tbscat,tbsurf]=compute_surf_tb_model(freq,tht,surtep,sal,ssws,phir,tran,tbdw)
function [tbsurf]=compute_surf_tb_model(freq,tht,surtep,sal,ssws,phir,tran,tbdw)%���㺣������
%freq��Ƶ�ʣ�tht������ǣ�surtep�Ǻ����¶�k��sal���ζȣ�ssws���٣�phir����tran͸���ʣ�tbdw�����з�������
sst=surtep-273.15;

xssws=ssws;
xphir=phir;
xsal=sal;

[xtc]=compute_tcos_eff_model(freq);%���ú��������������ʲô��˼
% xtc=2.73;

[xe0,xewind,xestokes,xemisstot,xeharm]=compute_rough_emiss_model(freq,tht,sst,xssws,xphir,xsal);
%���ú����е��Ա������������һ����
e0=xe0;
ewind=xewind;
edirstokes=xestokes;
emisstot=xemisstot;
eharm=xeharm;%�����ʲô


costht=cosd(tht);%cosd�������������ǵ�λ�ǡ�
path=1.00035./sqrt(costht.*costht+7.001225e-4);

opacty=-log(tran)./path;%͸����tran

[xscat]=compute_scatterm_model(freq,tht,xssws,opacty);%���ú������������û���ҵ������ｨ����

xomega(1:2) = xscat(1:2) ./(tbdw + tran.*xtc - xtc);
xetot(1:4) = [xe0(1),xe0(2),0.0,0.0] + [xewind(1),xewind(2),0.0,0.0] + xestokes(1:4);

if xetot(1:2)>=1.0
	xetot(1:2)=1.0;
end

if xetot(1:2)<=0.0
	xetot(1:2)=0.0;
end

xrtot(1:2) = 1.0-xetot(1:2);

xrtot(3:4) =    -xetot(3:4);

xomegabar = (xomega(1).*xrtot(1) + xomega(2).*xrtot(2))./(xrtot(1)+xrtot(2));

xtbscat(1:2) = ((1.0+xomega(1:2)).*(tbdw+tran.*xtc) - xomega(1:2).*xtc) .* xrtot(1:2);
xtbscat(3:4) = ((1.0+xomegabar ) .*(tbdw+tran.*xtc) - xomegabar  .*xtc) .* xrtot(3:4);

tbscat = xtbscat;
tbsurf = xetot.*surtep + xtbscat;
omega = xomega;
etot=xetot;
end