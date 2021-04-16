function [ aharm ] = compute_aharm_phir_model( ifreq,sst,wind )
% ifreqÊÇÆµÂÊ

load('bcoef.mat');

nstoke=4;

if ifreq==4
	disp('ifreq oob in compute_aharm_phir_model, pgm stopped');
	return
end

[ xmea ] = compute_ws_poly_model ( wind );

[ sst_fac(1) ] = compute_sst_fac_model(ifreq,1,sst);
[ sst_fac(2) ] = compute_sst_fac_model(ifreq,2,sst);

sst_fac(3:4)=0.5.*(sst_fac(1)+sst_fac(2));

for istoke=1:nstoke
	aharm(1,istoke)=sst_fac(istoke).*dot(xmea,bcoef(:,1,istoke,ifreq));
	aharm(2,istoke)=sst_fac(istoke).*dot(xmea,bcoef(:,2,istoke,ifreq));
end

for iharm=1:2
	h1=0.5.*(aharm(iharm,1)+aharm(iharm,2));
    h2=      aharm(iharm,1)-aharm(iharm,2);
    aharm(iharm,1)=h1;
    aharm(iharm,2)=h2;
end

end