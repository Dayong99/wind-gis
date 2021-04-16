function [ xmea ] = compute_ws_poly_model ( wind )

wcut =20.0;

x=wind;

if x < 0
	x = 0;
end
   
xmea(1)=x;

if x <= wcut
	xmea(2)=xmea(1).*x;
	xmea(3)=xmea(2).*x;
	xmea(4)=xmea(3).*x;
	xmea(5)=xmea(4).*x;
else
	dif=x-wcut;
	xmea(2)=2.*dif.*wcut + wcut.^2;
	xmea(3)=3.*dif.*wcut.^2 + wcut.^3;
	xmea(4)=4.*dif.*wcut.^3 + wcut.^4;
	xmea(5)=5.*dif.*wcut.^4 + wcut.^5;
end

end