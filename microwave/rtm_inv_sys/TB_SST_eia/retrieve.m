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

% Last Modified by GUIDE v2.5 20-Jul-2020 20:24:54

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
[filename,pathname]=uigetfile('.mat','选择输入亮温');
fpath1=[pathname filename];




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath2
[filename,pathname]=uigetfile('.mat','选择输入亮温');
fpath2=[pathname filename];




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath3
[filename,pathname]=uigetfile('.mat','选择输入亮温');
fpath3=[pathname filename];



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath4
[filename,pathname]=uigetfile('.mat','选择输入亮温');
fpath4=[pathname filename];




% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath5
[filename,pathname]=uigetfile('.mat','选择输入亮温');
fpath5=[pathname filename];




% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath6
[filename,pathname]=uigetfile('.mat','选择输入亮温');
fpath6=[pathname filename];




% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath7
[filename,pathname]=uigetfile('.mat','选择输入亮温');
fpath7=[pathname filename];




% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath8
[filename,pathname]=uigetfile('.mat','选择输入亮温');
fpath8=[pathname filename];



% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath9
[filename,pathname]=uigetfile('.mat','选择输入亮温');
fpath9=[pathname filename];



% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath10
[filename,pathname]=uigetfile('.mat','选择输入亮温');
fpath10=[pathname filename];



% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 根据入射角范围划分数据
global fpath1
global fpath2
global fpath3
global fpath4
global fpath5
global fpath6
global fpath7
global fpath8
global fpath9
global fpath10
global fpath11
global fpath12
load (fpath1);
load (fpath2);
load (fpath3);
load (fpath4);
load (fpath5);
load (fpath6);
load (fpath7);
load (fpath8);
load (fpath9);
load (fpath10);
load (fpath11);
load (fpath12);

eia= sita(1,:);
L=length(sita);
max_eia = max(eia);
min_eia = min(eia);
for i=1:floor(max_eia)
    a = find(eia<=max_eia-i+1 & eia > max_eia-i);
    eval(['sita', num2str(i), '=', 'a;']);
    clear a
    % save(['kchange',num2str(n),'.mat'],['k',num2str(n)]);
end
 a = find(eia<=max_eia-i & eia > 0);
 eval(['sita', num2str(i+1), '=', 'a;']);
 clear a
 
 %% 根据划分的数据继续划分训练集和测试集
 %% 划分训练集
 
 for i=1: floor(max_eia)+1
     long(i)=  eval(['length' '(' 'sita',num2str(i) ');']);
 end
 for i = 1:floor(max_eia)+1
 eval(['Train' num2str(i) '=' '[' 'ones(L*length(1:2:long' '(' num2str(i) ')' ')' ',' '1),'... 
        'reshape' '(' 'tb1v(:,sita' num2str(i) '(1:2:long' '(' num2str(i) ')' ')),' 'L*' 'length' '(1:2:long' '(' num2str(i) ')' '),1)' ',' 'reshape' '(tb1h(:,sita' num2str(i) '(1:2:long' '(' num2str(i) '))),L*' 'length' '(1:2:long(' num2str(i) ')),1),'...
        'reshape' '(' 'tb2v(:,sita' num2str(i) '(1:2:long' '(' num2str(i) ')' ')),' 'L*' 'length' '(1:2:long' '(' num2str(i) ')' '),1)' ',' 'reshape' '(tb2h(:,sita' num2str(i) '(1:2:long' '(' num2str(i) '))),L*' 'length' '(1:2:long(' num2str(i) ')),1),' ...
        'reshape' '(' '-log(290-tb3v(:,sita' num2str(i) '(1:2:long(' num2str(i) ')))),L*length(1:2:long(' num2str(i) ')),1),' 'reshape' '(-log(290-tb3h(:,sita' num2str(i) '(1:2:long(' num2str(i) ')))),L*length(1:2:long(' num2str(i) ')),1),'...
        'reshape' '(' '-log(290-tb4v(:,sita' num2str(i) '(1:2:long(' num2str(i) ')))),L*length(1:2:long(' num2str(i) ')),1),' 'reshape' '(-log(290-tb4h(:,sita' num2str(i) '(1:2:long(' num2str(i) ')))),L*length(1:2:long(' num2str(i) ')),1),'...
        'reshape' '(' '-log(290-tb5v(:,sita' num2str(i) '(1:2:long(' num2str(i) ')))),L*length(1:2:long(' num2str(i) ')),1),' 'reshape' '(-log(290-tb5h(:,sita' num2str(i) '(1:2:long(' num2str(i) ')))),L*length(1:2:long(' num2str(i) ')),1)' '];' ] );
 
 eval(['Train_SST' num2str(i) '=' 'reshape' '(sst(:,sita' num2str(i) '(1:2:long(' num2str(i) '))),L*' 'length' '(1:2:long(' num2str(i) ')),1);']);
 end
 
 %% 回归得到回归系数
 for i = 1:floor(max_eia)+1
[b(:,i)]=eval(['regress' '(' 'Train_SST' num2str(i) ',' 'Train' num2str(i) ');']);
 end

%% 划分测试集
for i = 1:floor(max_eia)+1
 eval(['Test' num2str(i) '=' '[' 'ones(L*length(2:2:long' '(' num2str(i) ')' ')' ',' '1),'... 
        'reshape' '(' 'tb1v(:,sita' num2str(i) '(2:2:long' '(' num2str(i) ')' ')),' 'L*' 'length' '(2:2:long' '(' num2str(i) ')' '),1)' ',' 'reshape' '(tb1h(:,sita' num2str(i) '(2:2:long' '(' num2str(i) '))),L*' 'length' '(2:2:long(' num2str(i) ')),1),'...
        'reshape' '(' 'tb2v(:,sita' num2str(i) '(2:2:long' '(' num2str(i) ')' ')),' 'L*' 'length' '(2:2:long' '(' num2str(i) ')' '),1)' ',' 'reshape' '(tb2h(:,sita' num2str(i) '(2:2:long' '(' num2str(i) '))),L*' 'length' '(2:2:long(' num2str(i) ')),1),' ...
        'reshape' '(' '-log(290-tb3v(:,sita' num2str(i) '(2:2:long(' num2str(i) ')))),L*length(2:2:long(' num2str(i) ')),1),' 'reshape' '(-log(290-tb3h(:,sita' num2str(i) '(2:2:long(' num2str(i) ')))),L*length(2:2:long(' num2str(i) ')),1),'...
        'reshape' '(' '-log(290-tb4v(:,sita' num2str(i) '(2:2:long(' num2str(i) ')))),L*length(2:2:long(' num2str(i) ')),1),' 'reshape' '(-log(290-tb4h(:,sita' num2str(i) '(2:2:long(' num2str(i) ')))),L*length(2:2:long(' num2str(i) ')),1),'...
        'reshape' '(' '-log(290-tb5v(:,sita' num2str(i) '(2:2:long(' num2str(i) ')))),L*length(2:2:long(' num2str(i) ')),1),' 'reshape' '(-log(290-tb5h(:,sita' num2str(i) '(2:2:long(' num2str(i) ')))),L*length(2:2:long(' num2str(i) ')),1)' '];' ] );
 
 eval(['Test_SST' num2str(i) '=' 'reshape' '(sst(:,sita' num2str(i) '(2:2:long(' num2str(i) '))),L*' 'length' '(2:2:long(' num2str(i) ')),1);']);
end
 
%% 计算海面温度的反演值
%  测试集
for i=1:floor(max_eia)+1
    
    eval(['Test_SST_R' num2str(i) '=' 'Test' num2str(i) '*' 'b(:,' num2str(i) ');']);
    
end
% 训练集
for i=1:floor(max_eia)+1
    
    eval(['Train_SST_R' num2str(i) '=' 'Train' num2str(i) '*' 'b(:,' num2str(i) ');']);
    
end
%% 还原图形
for i=1:floor(max_eia)+1
    eval(['Train_SST_R_R' num2str(i) '=' 'reshape' '(Train_SST_R' num2str(i) ',L,' 'length(Train_SST_R' num2str(i) ')' './' 'L' ');']);
    eval(['Test_SST_R_R' num2str(i) '=' 'reshape' '(Test_SST_R' num2str(i) ',L,' 'length(Test_SST_R' num2str(i) ')' './' 'L' ');']);
end
   
for i=1:floor(max_eia)+1
    eval(['Train_SST_R_R_R' num2str(i) '=' '[' 'Train_SST_R_R' num2str(i) ';' 'sita' num2str(i) '(' '1:2:long' '(' num2str(i) ')' ')' '];'])
    eval(['Test_SST_R_R_R' num2str(i) '=' '[' 'Test_SST_R_R' num2str(i) ';' 'sita' num2str(i)   '(' '2:2:long' '(' num2str(i) ')' ')' '];'])
end 
    SST_retrieval=[];
for i=1:floor(max_eia)+1
    eval(['SST_retrieval =' '[ SST_retrieval,' 'Train_SST_R_R_R'  num2str(i) ',' 'Test_SST_R_R_R' num2str(i) '];']);
end

[a , b] = sort(SST_retrieval(end,:));
for i=1:length(b)
    SST_retrieval_end (:,i) =  SST_retrieval(:,b(i));
end
 
 SST_retrieval_end (end,:)=[];
  
 

global lon
global lat1
global long
global lat
global sst
lon=145:0.01:155;
lat1=30:0.01:40;
load mycolor

axes(handles.axes8);
pcolor(lon,lat1,sst);hold on
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
title({'海面温度真值'},'fontsize',10,'fontweight','bold','color','k');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(handles.axes9);
pcolor(lon,lat1,SST_retrieval_end);hold on

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
title({'海面温度反演值'},'fontsize',10,'fontweight','bold','color','k');
 



% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath11
[filename,pathname]=uigetfile('.mat','选择入射角');
fpath11=[pathname filename];

guidata(hObject,handles);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpath12
[filename,pathname]=uigetfile('.mat','选择海面温度真实值');
fpath12=[pathname filename];


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes on mouse press over axes background.
function axes4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
