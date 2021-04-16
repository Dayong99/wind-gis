function [ tcos_eff ]= compute_tcos_eff_model ( freq )

tcos = 2.73 ;
teff = 63.0 ;
h = 6.6260755e-34 ;%普朗克常量
k = 1.380658e-23 ;%玻尔兹曼常数
a = h./k ;

x = a.*freq.*1.e9 ;
b1 = x./(exp(x./tcos)-1) ;
b2 = x./(exp(x./teff)-1) ;
tcos_eff = b1-b2+teff ;

end