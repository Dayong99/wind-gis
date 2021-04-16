function [emiss_0,emiss_wind,emiss_phi,emiss_tot,eharm]=compute_rough_emiss_model(freq,tht,sst,wind,phir,sal)
% function [emiss_tot]=compute_rough_emiss_model(freq,tht,sst,wind,phir,sal)
%�Ա����ֱ��ǣ�Ƶ�ʡ�����ǡ������¶ȡ����١������ζ�
%������ֱ��ǣ�ƽ�����淢���ʡ����������������������ܵķ����ʡ���������eharm
nstoke = 4;
phirsv = 1.0e30;
thtref = 55.2;%�ο������

xexp =[4.0,1.5];%��ֱ������ˮƽ������ȡֵ
xexp_phir=reshape([2.0,2.0,1.0,4.0,1.0,4.0,2.0,2.0], [2,4]);

freq0 =[ 6.8,  10.7,  18.7,  23.8,  37.0, 85.5 ];%ʲô��˼�����Ժ������¶�Ƶ�ʵ������ԣ�

xphir=phir;%����
xsal=sal;%�ζ�

if freq<6.5  
	disp( 'pgm stopped, freq too small in oob in compute_rough_emiss_model');%ʲô��˼
	return
end

qtht=tht;%�����

if qtht>65 
	qtht=65.0;%������Ǵ���65��ʱ���۲ⲻ������
end

[em0]=compute_spec_emiss_model(freq,tht,sst,xsal);%����ƽ�����淢����

ifreq1=1;%�����ʲô��˼��ifreql

if freq>freq0(2) 
	ifreq1=2;
end

if freq>freq0(3) 
	ifreq1=3;
end

if freq>freq0(5) 
	ifreq1=5;
end

if ifreq1~=3
	ifreq2=ifreq1+1;%ifreq2��ʲô��˼
else
	ifreq2=ifreq1+2;
end

wt=(freq-freq0(ifreq1))./(freq0(ifreq2)-freq0(ifreq1));

if freq>freq0(ifreq2) 
	wt=1;
end

% isotropic wind-induced emissivity

[emiss1]=compute_emiss_wind_model(ifreq1,sst,wind);
[emiss2]=compute_emiss_wind_model(ifreq2,sst,wind);

xemiss=(1-wt).*emiss1 + wt.*emiss2;

enad=0.5.*(xemiss(1)+xemiss(2));

for ipol=1:2
	if tht<=thtref
		xemiss(ipol)=enad         + (xemiss(ipol)-enad).*( tht/thtref).^xexp(ipol);
	else
		xemiss(ipol)=xemiss(ipol) + (xemiss(ipol)-enad).*(qtht-thtref).*xexp(ipol)./thtref;
	end
end

[aharm1]=compute_aharm_phir_model(ifreq1,sst,wind);
[aharm2]=compute_aharm_phir_model(ifreq2,sst,wind);

aharm=(1-wt).*aharm1 + wt.*aharm2;

[amp1]=compute_aharm_phir_nad(ifreq1,freq0(ifreq1),sst,wind);
[amp2]=compute_aharm_phir_nad(ifreq2,freq0(ifreq2),sst,wind);

amp=(1-wt).*amp1 + wt.*amp2;

anad(1:2,1:4)=0;
anad(2,2)=  amp;
anad(2,3)= -amp;

for istoke=1:nstoke
	for iharm=1:2
		if tht<=thtref
			aharm(iharm,istoke)= anad(iharm,istoke) +(aharm(iharm,istoke)-anad(iharm,istoke)).* (tht/thtref).^xexp_phir(iharm,istoke);
		else
			aharm(iharm,istoke)=aharm(iharm,istoke) +(aharm(iharm,istoke)-anad(iharm,istoke)).*(qtht-thtref).*xexp_phir(iharm,istoke)./thtref;
		end
	end
end

for iharm=1:2
	h1=aharm(iharm,1) + 0.5.*aharm(iharm,2);
	h2=aharm(iharm,1) - 0.5.*aharm(iharm,2);
	aharm(iharm,1)=h1;
	aharm(iharm,2)=h2;
end

if abs(xphir-phirsv)>0.01
	phirsv=xphir;
	cos1phi=cosd(  xphir);
    cos2phi=cosd(2.*xphir);
    sin1phi=sind(  xphir);
    sin2phi=sind(2.*xphir);
end

xemiss_phi(1:2)=aharm(1,1:2).*cos1phi + aharm(2,1:2).*cos2phi;%P=v��hʱ�ķ�������ķ�����
xemiss_phi(3:4)=aharm(1,3:4).*sin1phi + aharm(2,3:4).*sin2phi;%P=s3��s4ʱ�ķ�������ķ�����
xemiss_phi(4) = -xemiss_phi(4);

xemiss_tot = em0 + xemiss  + xemiss_phi(1:2);%�ܷ�����
emiss_tot  = xemiss_tot;%�ܷ�����

emiss_0   =em0;%ƽ������ķ�����
emiss_wind=xemiss;%������ɵķ����ʵ�����
emiss_phi =xemiss_phi;%������ɵķ����ʵ�����

eharm=aharm;
eharm(:,4)=-aharm(:,4);

if wind<=3.0
	eharm(1:2,1:4)=0.0;
end

end
