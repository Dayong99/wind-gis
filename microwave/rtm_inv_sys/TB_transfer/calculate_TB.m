function varargout = retrieve(varargin)
% RETRIEVE MATLAB code for retrieve.fig
%      RETRIEVE, by itself, creates a new RETRIEVE or raises the existing
%      singleton*.
%
%      H = RETRIEVE returns the handle to a new RETRIEVE or the handle to
%      the existing singleton*.
%
%      RETRIEVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RETRIEVE.M with the given input arguments.
%
%      RETRIEVE('Property','Value',...) creates a new RETRIEVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before retrieve_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to retrieve_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help retrieve

% Last Modified by GUIDE v2.5 20-Aug-2020 13:25:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @retrieve_OpeningFcn, ...
                   'gui_OutputFcn',  @retrieve_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before retrieve is made visible.
function retrieve_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to retrieve (see VARARGIN)

% Choose default command line output for retrieve
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes retrieve wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = retrieve_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath1
[filename,pathname]=uigetfile('.mat','选择输入海面温度');
fpath1=[pathname filename];




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath2
[filename,pathname]=uigetfile('.mat','选择输入海面风速');
fpath2=[pathname filename];


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath3
[filename,pathname]=uigetfile('.mat','选择输入海面风向');
fpath3=[pathname filename];


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath4
[filename,pathname]=uigetfile('.mat','选择输入海水盐度');
fpath4=[pathname filename];


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath5
[filename,pathname]=uigetfile('.mat','选择输入水汽含量');
fpath5=[pathname filename];


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath6
[filename,pathname]=uigetfile('.mat','选择输入液态水含量');
fpath6=[pathname filename];


% --- Executes on button press in pushbutton12.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath7
[filename,pathname]=uigetfile('.mat','选择经纬度');
fpath7=[pathname filename];

guidata(hObject,handles);


% --- Executes on button press in pushbutton13.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath8
[filename,pathname]=uigetfile('.mat','选择入射角');
fpath8=[pathname filename];


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 声明变量
global fpath1
global fpath2
global fpath3
global fpath4
global fpath5
global fpath6
global fpath7
global fpath8
load (fpath1);
load (fpath2);
load (fpath3);
load (fpath4);
load (fpath5);
load (fpath6);
load (fpath7);
load (fpath8);

 for i=1:length(sst(:,1))
     for j=1:length(sita(1,:))
     [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(6.9,V(i,j) ,L(i,j) ,sst(i,j),sita(j),0,0);
     end
 end
 
 for i=1:length(sst(:,1))           
     for j=1:length(sita(1,:))
         [tbsurf]=compute_surf_tb_model(6.9,sita(j),sst(i,j),sal(i,j),ssws(i,j),phir(i,j),tran(i,j),tbdn(i,j));                    
         a(:,j,i)=tbsurf(1:2);                    
     end    
 end
 
 for i=1:length(sst(:,1))
     TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
     TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:); 
 end  

% global lon
% global lat1
% global long
% global lat
% global sst
% lon=145:0.01:155;
% lat1=30:0.01:40;
load mycolor

axes(handles.axes8);
pcolor(lon,lat1,tb1v);hold on
shading interp
hc=colorbar;
% set(gca,'Clim',[13 23]);%调整colorbar的范围
colormap(mymap);
load coast
plot(long,lat,'k','lineWidth',1.5);hold on
%选择显示区域
xy=[145,155,30,40];
axis(xy);
xlabel('经度','fontsize',10,'fontweight','bold','color','k');
ylabel('纬度','fontsize',10,'fontweight','bold','color','k');
title({'6.9GHz垂直极化亮温'},'fontsize',10,'fontweight','bold','color','k');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(handles.axes9);
pcolor(lon,lat1,tb1h);hold on

shading interp
hc=colorbar;
% set(gca,'Clim',[13 23]);%调整colorbar的范
colormap(mymap);
load coast
plot(long,lat,'k','lineWidth',1.5);hold on
%选择显示区域
xy=[145,155,30,40];
axis(xy);
xlabel('经度','fontsize',10,'fontweight','bold','color','k');
ylabel('纬度','fontsize',10,'fontweight','bold','color','k');
title({'6.9GHz水平极化亮温'},'fontsize',10,'fontweight','bold','color','k');
 





% --- Executes during object creation, after setting all properties.

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 声明变量
global fpath1
global fpath2
global fpath3
global fpath4
global fpath5
global fpath6
global fpath7
global fpath8
load (fpath1);
load (fpath2);
load (fpath3);
load (fpath4);
load (fpath5);
load (fpath6);
load (fpath7);
load (fpath8);

 for i=1:length(sst(:,1))
     for j=1:length(sita(1,:))
     [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(10.65,V(i,j) ,L(i,j) ,sst(i,j),sita(j),0,0);
     end
 end
 
 for i=1:length(sst(:,1))           
     for j=1:length(sita(1,:))
         [tbsurf]=compute_surf_tb_model(10.65,sita(j),sst(i,j),sal(i,j),ssws(i,j),phir(i,j),tran(i,j),tbdn(i,j));                    
         a(:,j,i)=tbsurf(1:2);                    
     end    
 end
 
 for i=1:length(sst(:,1))
     TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
     TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:); 
 end  

% global lon
% global lat1
% global long
% global lat
% global sst
% lon=145:0.01:155;
% lat1=30:0.01:40;
load mycolor

axes(handles.axes8);
pcolor(lon,lat1,tb2v);hold on
shading interp
hc=colorbar;
set(gca,'Clim',[13 23]);%调整colorbar的范围
colormap(mymap);
load coast
plot(long,lat,'k','lineWidth',1.5);hold on
%选择显示区域
xy=[145,155,30,40];
axis(xy);
xlabel('经度','fontsize',10,'fontweight','bold','color','k');
ylabel('纬度','fontsize',10,'fontweight','bold','color','k');
title({'10.65GHz垂直极化亮温'},'fontsize',10,'fontweight','bold','color','k');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(handles.axes9);
pcolor(lon,lat1,tb2h);hold on

shading interp
hc=colorbar;
set(gca,'Clim',[13 23]);%调整colorbar的范
colormap(mymap);
load coast
plot(long,lat,'k','lineWidth',1.5);hold on
%选择显示区域
xy=[145,155,30,40];
axis(xy);
xlabel('经度','fontsize',10,'fontweight','bold','color','k');
ylabel('纬度','fontsize',10,'fontweight','bold','color','k');
title({'10.65GHz水平极化亮温'},'fontsize',10,'fontweight','bold','color','k');


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 声明变量
global fpath1
global fpath2
global fpath3
global fpath4
global fpath5
global fpath6
global fpath7
global fpath8
load (fpath1);
load (fpath2);
load (fpath3);
load (fpath4);
load (fpath5);
load (fpath6);
load (fpath7);
load (fpath8);

 for i=1:length(sst(:,1))
     for j=1:length(sita(1,:))
     [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(18.7,V(i,j) ,L(i,j) ,sst(i,j),sita(j),0,0);
     end
 end
 
 for i=1:length(sst(:,1))           
     for j=1:length(sita(1,:))
         [tbsurf]=compute_surf_tb_model(18.7,sita(j),sst(i,j),sal(i,j),ssws(i,j),phir(i,j),tran(i,j),tbdn(i,j));                    
         a(:,j,i)=tbsurf(1:2);                    
     end    
 end
 
 for i=1:length(sst(:,1))
     TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
     TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:); 
 end  

% global lon
% global lat1
% global long
% global lat
% global sst
% lon=145:0.01:155;
% lat1=30:0.01:40;
load mycolor

axes(handles.axes8);
pcolor(lon,lat1,tb3v);hold on
shading interp
hc=colorbar;
set(gca,'Clim',[13 23]);%调整colorbar的范围
colormap(mymap);
load coast
plot(long,lat,'k','lineWidth',1.5);hold on
%选择显示区域
xy=[145,155,30,40];
axis(xy);
xlabel('经度','fontsize',10,'fontweight','bold','color','k');
ylabel('纬度','fontsize',10,'fontweight','bold','color','k');
title({'18.7GHz垂直极化亮温'},'fontsize',10,'fontweight','bold','color','k');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(handles.axes9);
pcolor(lon,lat1,tb3h);hold on

shading interp
hc=colorbar;
set(gca,'Clim',[13 23]);%调整colorbar的范
colormap(mymap);
load coast
plot(long,lat,'k','lineWidth',1.5);hold on
%选择显示区域
xy=[145,155,30,40];
axis(xy);
xlabel('经度','fontsize',10,'fontweight','bold','color','k');
ylabel('纬度','fontsize',10,'fontweight','bold','color','k');
title({'18.7GHz水平极化亮温'},'fontsize',10,'fontweight','bold','color','k');


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 声明变量
global fpath1
global fpath2
global fpath3
global fpath4
global fpath5
global fpath6
global fpath7
global fpath8
load (fpath1);
load (fpath2);
load (fpath3);
load (fpath4);
load (fpath5);
load (fpath6);
load (fpath7);
load (fpath8);

 for i=1:length(sst(:,1))
     for j=1:length(sita(1,:))
     [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(23.8,V(i,j) ,L(i,j) ,sst(i,j),sita(j),0,0);
     end
 end
 
 for i=1:length(sst(:,1))           
     for j=1:length(sita(1,:))
         [tbsurf]=compute_surf_tb_model(23.8,sita(j),sst(i,j),sal(i,j),ssws(i,j),phir(i,j),tran(i,j),tbdn(i,j));                    
         a(:,j,i)=tbsurf(1:2);                    
     end    
 end
 
 for i=1:length(sst(:,1))
     TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
     TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:); 
 end  

% global lon
% global lat1
% global long
% global lat
% global sst
% lon=145:0.01:155;
% lat1=30:0.01:40;
load mycolor

axes(handles.axes8);
pcolor(lon,lat1,tb4v);hold on
shading interp
hc=colorbar;
set(gca,'Clim',[13 23]);%调整colorbar的范围
colormap(mymap);
load coast
plot(long,lat,'k','lineWidth',1.5);hold on
%选择显示区域
xy=[145,155,30,40];
axis(xy);
xlabel('经度','fontsize',10,'fontweight','bold','color','k');
ylabel('纬度','fontsize',10,'fontweight','bold','color','k');
title({'23.8GHz垂直极化亮温'},'fontsize',10,'fontweight','bold','color','k');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(handles.axes9);
pcolor(lon,lat1,tb4h);hold on

shading interp
hc=colorbar;
set(gca,'Clim',[13 23]);%调整colorbar的范
colormap(mymap);
load coast
plot(long,lat,'k','lineWidth',1.5);hold on
%选择显示区域
xy=[145,155,30,40];
axis(xy);
xlabel('经度','fontsize',10,'fontweight','bold','color','k');
ylabel('纬度','fontsize',10,'fontweight','bold','color','k');
title({'23.8GHz水平极化亮温'},'fontsize',10,'fontweight','bold','color','k');


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 声明变量
global fpath1
global fpath2
global fpath3
global fpath4
global fpath5
global fpath6
global fpath7
global fpath8
load (fpath1);
load (fpath2);
load (fpath3);
load (fpath4);
load (fpath5);
load (fpath6);
load (fpath7);
load (fpath8);

 for i=1:length(sst(:,1))
     for j=1:length(sita(1,:))
     [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(36.5,V(i,j) ,L(i,j) ,sst(i,j),sita(j),0,0);
     end
 end
 
 for i=1:length(sst(:,1))           
     for j=1:length(sita(1,:))
         [tbsurf]=compute_surf_tb_model(36.5,sita(j),sst(i,j),sal(i,j),ssws(i,j),phir(i,j),tran(i,j),tbdn(i,j));                    
         a(:,j,i)=tbsurf(1:2);                    
     end    
 end
 
 for i=1:length(sst(:,1))
     TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
     TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:); 
 end  

% global lon
% global lat1
% global long
% global lat
% global sst
% lon=145:0.01:155;
% lat1=30:0.01:40;
load mycolor

axes(handles.axes8);
pcolor(lon,lat1,tb5v);hold on
shading interp
hc=colorbar;
set(gca,'Clim',[13 23]);%调整colorbar的范围
colormap(mymap);
load coast
plot(long,lat,'k','lineWidth',1.5);hold on
%选择显示区域
xy=[145,155,30,40];
axis(xy);
xlabel('经度','fontsize',10,'fontweight','bold','color','k');
ylabel('纬度','fontsize',10,'fontweight','bold','color','k');
title({'36.5GHz垂直极化亮温'},'fontsize',10,'fontweight','bold','color','k');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(handles.axes9);
pcolor(lon,lat1,tb5h);hold on

shading interp
hc=colorbar;
set(gca,'Clim',[13 23]);%调整colorbar的范
colormap(mymap);
load coast
plot(long,lat,'k','lineWidth',1.5);hold on
%选择显示区域
xy=[145,155,30,40];
axis(xy);
xlabel('经度','fontsize',10,'fontweight','bold','color','k');
ylabel('纬度','fontsize',10,'fontweight','bold','color','k');
title({'36.5GHz水平极化亮温'},'fontsize',10,'fontweight','bold','color','k');


% --- Executes on button press in pushbutton5.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
