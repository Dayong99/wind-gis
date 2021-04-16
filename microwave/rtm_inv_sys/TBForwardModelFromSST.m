function [TB_m] = TBForwardModelFromSST(SST_param)

%输出参数：TB_m 得出亮温结果
%输入参数：SST_param（包括海表面温度，盐度，入射角度等参数)

% 主参数(海表面温度)
% SST_param.SST
% %% 辅助参数定义
% % 频率
% SST_param.freq
% % 海洋盐度
% SST_param.SSS
% % 海表10米波高风速
% SST_param.wind_speed
% %大气液态水含量
% SST_param.liquid
% %大气水汽含量
% SST_param.vapor
% % 观测入射角
% SST_param.theta
% %真实风向相对于辐射计观测方向的夹角
% SST_param.phi

f=SST_param.freq; %频率
sal=SST_param.SSS; %盐度
Ts=SST_param.SST; %海面温度
ssws=SST_param.wind_speed; %海面风速
phir=SST_param.phi; %海面相对风向
V=SST_param.vapor; %大气水汽含量
L=SST_param.liquid; %大气液态水含量
sita=SST_param.theta; %观测入射角

[ tran, tbdn, tbup ] = compute_atm_model ( sita, V, L, Ts, f); %计算大气透过率、下行亮温、上行亮温
[ tbsurf ]=compute_surf_tb_model(f, sita, Ts, sal, ssws, phir, tran, tbdn); %计算海面发射亮温

TB_v=tbsurf(1)+tran.*tbup; %垂直极化亮温
TB_h=tbsurf(2)+tran.*tbup; %水平极化亮温

TB_m(1) = TB_v;
TB_m(2) = TB_h;

TB_m = TB_m'; %转置为列向量

end

