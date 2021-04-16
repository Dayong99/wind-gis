function [ xscat ] = compute_scatterm_model ( freq,tht,wind,opacty )

if freq < 1 | freq > 200
	disp( 'freq oob in compute_scatterm_model, pgm stopped');
	return
end
if tht < 0 | tht > 90 
	disp( 'tht  oob in compute_scatterm_model, pgm stopped');
	return
end
if wind < 0 | wind > 100 
	disp( 'wind oob in compute_scatterm_model, pgm stopped');
	return
end
if opacty < 0
	disp( 'opacty oob in compute_scatterm_model, pgm stopped');%这语句什么意思
	return
end

load('scatterm.mat');

xlog_freq=log10(freq);

brief=tht;

if brief>89.99 
	brief=89.99;
end

i1=uint8(fix(1+brief));
i2=uint8(fix(i1+1));
a1=double(i1)-brief;
a2=1-a1;

brief=wind;

if brief>24.99 
	brief=24.99;
end

j1=uint8(fix(1+brief));
j2=uint8(fix(j1+1));
b1=double(j1)-brief;
b2=1-b1;

brief=xlog_freq./0.2;

if brief>11.99
	brief=11.99;
end

k1=uint8(fix(1+brief));
k2=uint8(fix(k1+1));
c1=double(k1)-brief;
c2=1-c1;

brief=opacty./0.025;

if brief>48.99 
	brief=48.99;
end

l1=uint8(fix(1+brief));
l2=uint8(fix(l1+1));
d1=double(l1)-brief;
d2=1-d1;

xscat1= ...
    a1.*b1.*(c1.*scatterm(i1,l1,j1,k1,:)+c2.*scatterm(i1,l1,j1,k2,:))+ ...
    a1.*b2.*(c1.*scatterm(i1,l1,j2,k1,:)+c2.*scatterm(i1,l1,j2,k2,:))+ ...
    a2.*b1.*(c1.*scatterm(i2,l1,j1,k1,:)+c2.*scatterm(i2,l1,j1,k2,:))+ ...
    a2.*b2.*(c1.*scatterm(i2,l1,j2,k1,:)+c2.*scatterm(i2,l1,j2,k2,:));

xscat2= ...
    a1.*b1.*(c1.*scatterm(i1,l2,j1,k1,:)+c2.*scatterm(i1,l2,j1,k2,:))+ ...
    a1.*b2.*(c1.*scatterm(i1,l2,j2,k1,:)+c2.*scatterm(i1,l2,j2,k2,:))+ ...
    a2.*b1.*(c1.*scatterm(i2,l2,j1,k1,:)+c2.*scatterm(i2,l2,j1,k2,:))+ ...
    a2.*b2.*(c1.*scatterm(i2,l2,j2,k1,:)+c2.*scatterm(i2,l2,j2,k2,:));
    
xscat=d1.*xscat1 + d2.*xscat2;

end