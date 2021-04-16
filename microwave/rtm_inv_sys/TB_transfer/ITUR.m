function [kaz]=ITUR(R,f,sita,beta,cbh)
% ka：衰减系数单位 dB/km，需要换算成1/km，R：降雨率单位 mm/h， f：频率，单位GHz，
% sita：仰角，单位°，beta：极化角，线性偏振为90度，圆偏振为45°。
%% 系数矩阵
% 计算k的系数 h极化
akh=[-5.3398, -0.35351, -0.23789, -0.94158];
bkh=[-0.10008, 1.2697, 0.86036, 0.64552];
ckh=[1.13098, 0.454 0.15354, 0.16817];
mkh=-0.18961;
ckhh=0.71147;
% v极化
akv=[-3.80595, -3.44965, -0.39902, 0.50167];
bkv=[0.56934, -0.22911, 0.73042, 1.07319];
ckv=[0.81061, 0.51059, 0.11899, 0.27195];
mkv=-0.16398;
ckvv=0.63297;
%计算阿尔法的系数 h极化
afh=[-0.14318, 0.29591, 0.32177, -5.3761, 16.1721];
bfh=[1.82442, 0.77564, 0.63773, -0.96230, -3.2998];
cfh=[-0.55187, 0.19822, 0.13164, 1.47828, 3.43990];
mfh=0.67849;
cfhh=-1.95537;
% v极化
afv=[-0.07771, 0.56727, -0.20238, -48.2991, 48.5833];
bfv=[2.33840, 0.95545, 1.14520, 0.791669, 0.791459];
cfv=[-0.76284, 0.54039, 0.26809, 0.116226, 0.116479];
mfv=-0.053739;
cfvv=0.83433;
%% 计算过程
for i=1:4
lkh(i)=akh(i)*exp(-((log10(f)-bkh(i))./ckh(i)).^2);
lkv(i)=akv(i)*exp(-((log10(f)-bkv(i))./ckv(i)).^2);
end
for i=1:5
  arfh(i)=afh(i)*exp(-((log10(f)-bfh(i))./cfh(i)).^2); 
  arfv(i)=afv(i)*exp(-((log10(f)-bfv(i))./cfv(i)).^2);
end
kh=10.^(sum(lkh)+mkh*log10(f)+ckhh);
kv=10.^(sum(lkv)+mkv*log10(f)+ckvv);
arfhh=sum(arfh)+mfh*log10(f)+cfhh;
arfvv=sum(arfv)+mfv*log10(f)+cfvv;
%% 计算k和arf
k=(kh+kv+(kh-kv)*cosd(sita)*cosd(sita)*cosd(2*beta))./2;
arf=(kh*arfhh+kv*arfvv+(kh*arfhh-kv*arfvv)*cosd(sita)*cosd(sita)*cosd(2*beta))./(2*k);
ka=k*R.^arf;
kaz=(ka./4.343).*cbh;


