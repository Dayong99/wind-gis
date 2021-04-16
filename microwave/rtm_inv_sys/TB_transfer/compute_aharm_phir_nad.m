function [ amp ] = compute_aharm_phir_nad ( ifreq,freq,sst,wind )
% nad表示卫星天底方向，freq是频率
qfreq=freq;

if qfreq > 37
	qfreq=37;
end
%为什么在37这里分界
if freq<3
	amp_10_nad=0.2 ./290.0;
else
	amp_10_nad=2.0 .*(1.0 - 0.9 .*log10(30.0 ./qfreq)) ./290.0;
end
% 2-38，多了一个0.9
ywind=wind;

if wind < 0
	ywind= 0;
end

if wind > 15 
	ywind=15;
end
%为什么在风速15这里分开
amp=amp_10_nad.*ywind.*(ywind - ywind.^2./22.5)./55.5556;% 2-36
%amp=A2 2-35
[ sst_fac ] = compute_sst_fac_model(ifreq,0,sst );

amp=amp.*sst_fac;

end