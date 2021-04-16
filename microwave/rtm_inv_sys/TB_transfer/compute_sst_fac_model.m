function [ sst_fac ] = compute_sst_fac_model(ifreq,ipol,sst)

ipol=(1+ipol);

rcoef(:,1,1)=[6.4666598E-04  1.8792389E-05 -7.1416878E-07];  
rcoef(:,2,1)=[5.4727186E-04  1.5199827E-05 -5.8219865E-07];  
rcoef(:,3,1)=[7.2313659E-04  2.0790892E-05 -7.8597145E-07];
rcoef(:,1,2)=[-1.8288196E-05 4.2427095E-05 -1.1764782E-06];
rcoef(:,2,2)=[8.6090358E-06  3.4348988E-05 -9.2879088E-07];
rcoef(:,3,2)=[-7.8551720E-06 4.7148875E-05 -1.3168459E-06];
rcoef(:,1,3)=[-1.8124707E-03 6.8363704E-05 -1.5595884E-06];
rcoef(:,2,3)=[-1.4230687E-03 5.3501099E-05 -1.1226591E-06];
rcoef(:,3,3)=[-2.0108195E-03 7.7432378E-05 -1.8330112E-06];
rcoef(:,1,4)=[-2.7608373E-03 7.3859519E-05 -1.6057228E-06];
rcoef(:,2,4)=[-2.1540450E-03 5.6079884E-05 -1.0885609E-06];
rcoef(:,3,4)=[-3.0903204E-03 8.5101470E-05 -1.9480626E-06];
rcoef(:,1,5)=[-4.3196524E-03 7.1496688E-05 -1.5087929E-06];
rcoef(:,2,5)=[-3.2755875E-03 4.9546485E-05 -8.9587598E-07];
rcoef(:,3,5)=[-4.9328911E-03 8.6898879E-05 -1.9658560E-06];
rcoef(:,1,6)=[-5.1350161E-03 3.2329197E-05 -1.0306418E-06];
rcoef(:,2,6)=[-3.5066912E-03 1.4070249E-05 -4.9284745E-07];
rcoef(:,3,6)=[-6.2693316E-03 5.0972507E-05 -1.4970617E-06];

xmea(1)= sst-20;
xmea(2)=xmea(1).*xmea(1);
xmea(3)=xmea(1).*xmea(2);

sst_fac=1 + dot(rcoef(:,ipol,ifreq),xmea);

end