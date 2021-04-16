function varargout = rtm_sys(varargin)
% RTM_SYS MATLAB code for rtm_sys.fig
%      RTM_SYS, by itself, creates a new RTM_SYS or raises the existing
%      singleton*.
%
%      H = RTM_SYS returns the handle to a new RTM_SYS or the handle to
%      the existing singleton*.
%
%      RTM_SYS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RTM_SYS.M with the given input arguments.
%
%      RTM_SYS('Property','Value',...) creates a new RTM_SYS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rtm_sys_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rtm_sys_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rtm_sys

% Last Modified by GUIDE v2.5 20-Jul-2020 17:12:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rtm_sys_OpeningFcn, ...
                   'gui_OutputFcn',  @rtm_sys_OutputFcn, ...
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


% --- Executes just before rtm_sys is made visible.
function rtm_sys_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rtm_sys (see VARARGIN)

% Choose default command line output for rtm_sys
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rtm_sys wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rtm_sys_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

f=str2double(get(handles.edit4,'string'));
sita=str2double(get(handles.edit15,'string'));
sal=str2double(get(handles.edit16,'string'));
Ts=str2double(get(handles.edit18,'string'));
V=str2double(get(handles.edit20,'string'));
L=str2double(get(handles.edit21,'string'));
ssw=str2double(get(handles.edit19,'string'));
sswd=str2double(get(handles.edit17,'string'));

switch get(handles.popupmenu2,'value')
    case 1
        tran=0.9999;
        tbup=0.0;
        tbdn=0.0;
        switch get(handles.popupmenu1,'value')
            case 1
                sita=0:65;
                for i=1:length(sita)
                    [ tbsurf ]=compute_surf_tb_model(f, sita(i), Ts, sal, ssw, sswd, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(sita(1:65),TB_v(2:66)-TB_v(1:65),'-','LineWidth',2)
                title('垂直极化')
                xlabel('入射角(deg)')
                xlim([0 64])
                ylabel('敏感系数(K/psu)')
                
                axes(handles.axes2);
                plot(sita(1:65),TB_h(2:66)-TB_h(1:65),'-','LineWidth',2)
                title('水平极化')
                xlabel('入射角(deg)')
                xlim([0 64])
                ylabel('敏感系数(K/deg)')
            case 2
                sal=0:40;
                for i=1:length(sal)
                    [ tbsurf ]=compute_surf_tb_model(f, sita, Ts, sal(i), ssw, sswd, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(sal(1:40),TB_v(2:41)-TB_v(1:40),'-','LineWidth',2)
                title('垂直极化')
                xlabel('海水盐度(psu)')
                xlim([0 39])
                ylabel('敏感系数(K/psu)')
                
                axes(handles.axes2);
                plot(sal(1:40),TB_h(2:41)-TB_h(1:40),'-','LineWidth',2)
                title('水平极化')
                xlabel('海水盐度(psu)')
                xlim([0 39])
                ylabel('敏感系数(K/psu)')
            case 3
                Ts=273:313;
                for i=1:length(Ts)
                    [ tbsurf ]=compute_surf_tb_model(f, sita, Ts(i), sal, ssw, sswd, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(Ts(1:40),TB_v(2:41)-TB_v(1:40),'-','LineWidth',2)
                title('垂直极化')
                xlabel('海面温度(K)')
                xlim([273 312])
                ylabel('敏感系数(K/K)')
                
                axes(handles.axes2);
                plot(Ts(1:40),TB_h(2:41)-TB_h(1:40),'-','LineWidth',2)
                title('水平极化')
                xlabel('海面温度(K)')
                xlim([273 312])
                ylabel('敏感系数(K/K)')
            case 4
                ssw=0:40;
                for i=1:length(ssw)
                    [ tbsurf ]=compute_surf_tb_model(f, sita, Ts, sal, ssw(i), sswd, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(ssw(1:40),TB_v(2:41)-TB_v(1:40),'-','LineWidth',2)
                title('垂直极化')
                xlabel('海面风速(m/s)')
                xlim([0 39])
                ylabel('敏感系数(K/ms^-^1)')
                
                axes(handles.axes2);
                plot(ssw(1:40),TB_h(2:41)-TB_h(1:40),'-','LineWidth',2)
                title('水平极化')
                xlabel('海面风速(m/s)')
                xlim([0 39])
                ylabel('敏感系数(K/ms^-^1)')
            case 5
                sswd=0:360;
                for i=1:length(sswd)
                    [ tbsurf ]=compute_surf_tb_model(f, sita, Ts, sal, ssw, sswd(i), tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(sswd(1:360),TB_v(2:361)-TB_v(1:360),'-','LineWidth',2)
                title('垂直极化')
                xlabel('海面风向(deg)')
                xlim([0 359])
                ylabel('敏感系数(K/deg)')
                
                axes(handles.axes2);
                plot(sswd(1:360),TB_h(2:361)-TB_h(1:360),'-','LineWidth',2)
                title('水平极化')
                xlabel('海面风向(deg)')
                xlim([0 359])
                ylabel('敏感系数(K/deg)')
            case 6
                disp('未考虑大气作用');
            case 7
                disp('未考虑大气作用');
        end
        
    case 2
        switch get(handles.popupmenu1,'value')
            case 1
                sita=0:65;
                for i=1:length(sita)
                    [ tran, tbdn, tbup ] = compute_atm_model ( sita(i), V, L, Ts, f);
                    [ tbsurf ]=compute_surf_tb_model(f, sita(i), Ts, sal, ssw, sswd, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(sita(1:65),TB_v(2:66)-TB_v(1:65),'-','LineWidth',2)
                title('垂直极化')
                xlabel('入射角(deg)')
                xlim([0 64])
                ylabel('敏感系数(K/psu)')
                
                axes(handles.axes2);
                plot(sita(1:65),TB_h(2:66)-TB_h(1:65),'-','LineWidth',2)
                title('水平极化')
                xlabel('入射角(deg)')
                xlim([0 64])
                ylabel('敏感系数(K/deg)')
            case 2
                sal=0:40;
                for i=1:length(sal)
                    [ tran, tbdn, tbup ] = compute_atm_model ( sita, V, L, Ts, f);
                    [ tbsurf ]=compute_surf_tb_model(f, sita, Ts, sal(i), ssw, sswd, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(sal(1:40),TB_v(2:41)-TB_v(1:40),'-','LineWidth',2)
                title('垂直极化')
                xlabel('海水盐度(psu)')
                xlim([0 39])
                ylabel('敏感系数(K/psu)')
                
                axes(handles.axes2);
                plot(sal(1:40),TB_h(2:41)-TB_h(1:40),'-','LineWidth',2)
                title('水平极化')
                xlabel('海水盐度(psu)')
                xlim([0 39])
                ylabel('敏感系数(K/psu)')
            case 3
                Ts=273:313;
                for i=1:length(Ts)
                    [ tran, tbdn, tbup ] = compute_atm_model ( sita, V, L, Ts(i), f);
                    [ tbsurf ]=compute_surf_tb_model(f, sita, Ts(i), sal, ssw, sswd, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(Ts(1:40),TB_v(2:41)-TB_v(1:40),'-','LineWidth',2)
                title('垂直极化')
                xlabel('海面温度(K)')
                xlim([273 312])
                ylabel('敏感系数(K/K)')
                
                axes(handles.axes2);
                plot(Ts(1:40),TB_h(2:41)-TB_h(1:40),'-','LineWidth',2)
                title('水平极化')
                xlabel('海面温度(K)')
                xlim([273 312])
                ylabel('敏感系数(K/K)')
            case 4
                ssw=0:40;
                for i=1:length(ssw)
                    [ tran, tbdn, tbup ] = compute_atm_model ( sita, V, L, Ts, f);
                    [ tbsurf ]=compute_surf_tb_model(f, sita, Ts, sal, ssw(i), sswd, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(ssw(1:20),TB_v(2:41)-TB_v(1:40),'-','LineWidth',2)
                title('垂直极化')
                xlabel('海面风速(m/s)')
                xlim([0 39])
                ylabel('敏感系数(K/ms^-^1)')
                
                axes(handles.axes2);
                plot(ssw(1:40),TB_h(2:41)-TB_h(1:40),'-','LineWidth',2)
                title('水平极化')
                xlabel('海面风速(m/s)')
                xlim([0 39])
                ylabel('敏感系数(K/ms^-^1)')
            case 5
                sswd=0:360;
                for i=1:length(sswd)
                    [ tran, tbdn, tbup ] = compute_atm_model ( sita, V, L, Ts, f);
                    [ tbsurf ]=compute_surf_tb_model(f, sita, Ts, sal, ssw, sswd(i), tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(sswd(1:360),TB_v(2:361)-TB_v(1:360),'-','LineWidth',2)
                title('垂直极化')
                xlabel('海面风向(deg)')
                xlim([0 359])
                ylabel('敏感系数(K/deg)')
                
                axes(handles.axes2);
                plot(sswd(1:360),TB_h(2:361)-TB_h(1:360),'-','LineWidth',2)
                title('水平极化')
                xlabel('海面风向(deg)')
                xlim([0 359])
                ylabel('敏感系数(K/deg)')
            case 6
                V=0:60;
                for i=1:length(V)
                    [ tran, tbdn, tbup ] = compute_atm_model ( sita, V(i), L, Ts, f);
                    [ tbsurf ]=compute_surf_tb_model(f, sita, Ts, sal, ssw, sswd, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(V(1:60),TB_v(2:61)-TB_v(1:60),'-','LineWidth',2)
                title('垂直极化')
                xlabel('大气水汽含量(mm)')
                xlim([0 59])
                ylabel('敏感系数(K/mm)')
                
                axes(handles.axes2);
                plot(V(1:60),TB_h(2:61)-TB_h(1:60),'-','LineWidth',2)
                title('水平极化')
                xlabel('大气水汽含量(mm)')
                xlim([0 59])
                ylabel('敏感系数(K/mm)')
            case 7
                L=0:0.01:0.2;
                for i=1:length(L)
                    [ tran, tbdn, tbup ] = compute_atm_model ( sita, V, L(i), Ts, f);
                    [ tbsurf ]=compute_surf_tb_model(f, sita, Ts, sal, ssw, sswd, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes1);
                plot(L(1:20),TB_v(2:21)-TB_v(1:20),'-','LineWidth',2)
                title('垂直极化')
                xlabel('云液态水含量(mm)')
                xlim([0 0.19])
                ylabel('敏感系数(10^2K/mm)')
                
                axes(handles.axes2);
                plot(L(1:20),TB_h(2:21)-TB_h(1:20),'-','LineWidth',2)
                title('水平极化')
                xlabel('云液态水含量(mm)')
                xlim([0 0.19])
                ylabel('敏感系数(10^2K/mm)')
        end
end

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=str2double(get(handles.edit5,'string'));
sita=str2double(get(handles.edit1,'string'));
sal=str2double(get(handles.edit2,'string'));
Ts=str2double(get(handles.edit3,'string'));
V=str2double(get(handles.edit6,'string'));
L=str2double(get(handles.edit7,'string'));
ssws=str2double(get(handles.edit13,'string'));
phir=str2double(get(handles.edit14,'string'));

switch get(handles.popupmenu3,'value')
    case 1
        tran=0.9999;
        tbup=0.0;
        tbdn=0.0;
        switch get(handles.popupmenu4,'value')
            case 1
                sita=0:65;
                for i=1:length(sita)
                    [ tbsurf ]=compute_surf_tb_model(f, sita(i), Ts, sal, ssws, phir, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes3);
                plot(sita,TB_v,'-','LineWidth',2)
                title('垂直极化')
                xlabel('入射角(deg)')
                xlim([0 65])
                ylabel('亮温(K)')
                
                axes(handles.axes4);
                plot(sita,TB_h,'-','LineWidth',2)
                title('水平极化')
                xlabel('入射角(deg)')
                xlim([0 65])
                ylabel('亮温(K)')
            case 2
                 %%
                sita=0:65;
                sal=0:40;
                for i=1:length(sal)
                    for j=1:66
                    [tbsurf]=compute_surf_tb_model(f,sita(j),Ts,sal(i),ssws,phir,tran,tbdn);
                    a(:,j,i)=tbsurf(1:2);
                    end
                end
                for i=1:length(sal)
                TB_v(i,:)=a(1,:,i).*tran+tbup;
                TB_h(i,:)=a(2,:,i).*tran+tbup;
                end
                axes(handles.axes3);
%                 plot(Ts,TB_v,'-','LineWidth',2)
%                 title('垂直极化')
%                 xlabel('海面温度(K)')
%                 xlim([273 313])
%                 ylabel('亮温(K)')
                pcolor(0:40,0:65,TB_v');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 220]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 40],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:10:40]) %设置x坐标轴刻度位置
                xlabel('海面盐度/ psu','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('垂直极化','fontsize',10,'fontweight','bold','color','k')
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes4);
                 pcolor(0:40,0:65,TB_h');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 160]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 40],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:10:40]) %设置x坐标轴刻度位置
                xlabel('海面盐度/ psu','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('水平极化','fontsize',10,'fontweight','bold','color','k')
            case 3
                 %%
                sita=0:65;
                Ts=273:313;
                for i=1:length(Ts)
                    for j=1:66
                    [tbsurf]=compute_surf_tb_model(f,sita(j),Ts(i),sal,ssws,phir,tran,tbdn);
                    a(:,j,i)=tbsurf(1:2);
                    end
                end
                for i=1:length(Ts)
                TB_v(i,:)=a(1,:,i).*tran+tbup;
                TB_h(i,:)=a(2,:,i).*tran+tbup;
                end
                axes(handles.axes3);
%                 plot(Ts,TB_v,'-','LineWidth',2)
%                 title('垂直极化')
%                 xlabel('海面温度(K)')
%                 xlim([273 313])
%                 ylabel('亮温(K)')
                pcolor(273:313,0:65,TB_v');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 220]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[273 313],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[273:10:313]) %设置x坐标轴刻度位置
                xlabel('海面温度/ K','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('垂直极化','fontsize',10,'fontweight','bold','color','k')
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes4);
                 pcolor(273:313,0:65,TB_h');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 160]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[273 313],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[273:10:313]) %设置x坐标轴刻度位置
                xlabel('海面温度/ K','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('水平极化','fontsize',10,'fontweight','bold','color','k')
            case 4
              
                 %%
                sita=0:65;
                ssws=0:40;
                for i=1:length(ssws)
                    for j=1:66
                    [tbsurf]=compute_surf_tb_model(f,sita(j),Ts,sal,ssws(i),phir,tran,tbdn);
                    a(:,j,i)=tbsurf(1:2);
                    end
                end
                for i=1:length(ssws)
                TB_v(i,:)=a(1,:,i).*tran+tbup;
                TB_h(i,:)=a(2,:,i).*tran+tbup;
                end
                axes(handles.axes3);
%                 plot(Ts,TB_v,'-','LineWidth',2)
%                 title('垂直极化')
%                 xlabel('海面温度(K)')
%                 xlim([273 313])
%                 ylabel('亮温(K)')
                pcolor(0:40,0:65,TB_v');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 220]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 40],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:10:40]) %设置x坐标轴刻度位置
                xlabel('海面风速/ m/s','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('垂直极化','fontsize',10,'fontweight','bold','color','k')
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes4);
                 pcolor(0:40,0:65,TB_h');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 160]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 40],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:10:40]) %设置x坐标轴刻度位置
                xlabel('海面风速/ m/s','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('水平极化','fontsize',10,'fontweight','bold','color','k')
            case 5
                  %%
                sita=0:65;
                phir=0:10:360;
              
                for i=1:length(phir)
                    for j=1:66
                    [tbsurf]=compute_surf_tb_model(f,sita(j),Ts,sal,ssws,phir(i),tran,tbdn);
                    a(:,j,i)=tbsurf(1:2);
                    end
                end
                for i=1:length(phir)
                TB_v(i,:)=a(1,:,i).*tran+tbup;
                TB_h(i,:)=a(2,:,i).*tran+tbup;
                end
                axes(handles.axes3);
%                 plot(Ts,TB_v,'-','LineWidth',2)
%                 title('垂直极化')
%                 xlabel('海面温度(K)')
%                 xlim([273 313])
%                 ylabel('亮温(K)')
                pcolor(0:36,0:65,TB_v');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 220]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 40],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:60:360]) %设置x坐标轴刻度位置
                set(gca,'xticklabel',{'0°','60°','120°','180°','240°','300°','360°'}) ;
                xlabel('海面风向/ m/s','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('垂直极化','fontsize',10,'fontweight','bold','color','k')
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes4);
                 pcolor(0:36,0:65,TB_h');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 160]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 36],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:6:36]) %设置x坐标轴刻度位置
                set(gca,'xticklabel',{'0°','60°','120°','180°','240°','300°','360°'}) ;
                xlabel('海面风向/ m/s','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('水平极化','fontsize',10,'fontweight','bold','color','k')
            case 6
                disp('未考虑大气作用');
            case 7
                disp('未考虑大气作用');
        end
        
    case 2
        switch get(handles.popupmenu4,'value')
            case 1
                sita=0:65;
                for i=1:length(sita)
                    [tbup, tbdn, tran] = AMSR_TB (f, V, L, Ts, sita(i), 0, 0);
                 
                    [ tbsurf ]=compute_surf_tb_model(f, sita(i), Ts, sal, ssws, phir, tran, tbdn);
                    TB_v(i)=tran.*tbsurf(1)+tbup;
                    TB_h(i)=tran.*tbsurf(2)+tbup;
                end
                axes(handles.axes3);
                plot(sita,TB_v,'-','LineWidth',2)
                title('垂直极化')
                xlabel('入射角(deg)')
                xlim([0 65])
                ylabel('亮温(K)')
                
                axes(handles.axes4);
                plot(sita,TB_h,'-','LineWidth',2)
                title('水平极化')
                xlabel('入射角(deg)')
                xlim([0 65])
                ylabel('亮温(K)')
            case 2
                 %%
                sita=0:65;
                sal=0:40;
                for i=1:length(sal)
                    for j=1:66
                    [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(f,V ,L ,Ts,sita(j),0,0);
                    end
                end
                for i=1:length(sal)
                    for j=1:66
                    [tbsurf]=compute_surf_tb_model(f,sita(j),Ts,sal(i),ssws,phir,tran(i,j),tbdn(i,j));
                    a(:,j,i)=tbsurf(1:2);
                    end
                end
                for i=1:length(sal)
                TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
                TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:);
                end
                axes(handles.axes3);
%                 plot(Ts,TB_v,'-','LineWidth',2)
%                 title('垂直极化')
%                 xlabel('海面温度(K)')
%                 xlim([273 313])
%                 ylabel('亮温(K)')
                pcolor(0:40,0:65,TB_v');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 220]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 40],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:10:40]) %设置x坐标轴刻度位置
                xlabel('海面盐度/ psu','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('垂直极化','fontsize',10,'fontweight','bold','color','k')
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes4);
                 pcolor(0:40,0:65,TB_h');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 160]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 40],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:10:40]) %设置x坐标轴刻度位置
                xlabel('海面盐度/ psu','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('水平极化','fontsize',10,'fontweight','bold','color','k')
            case 3
                %%
                sita=0:65;
                Ts=273:313;
                for i=1:length(Ts)
                    for j=1:66
                    [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(f,V ,L ,Ts(i),sita(j),0,0);
                    end
                end
                for i=1:length(Ts)
                    for j=1:66
                    [tbsurf]=compute_surf_tb_model(f,sita(j),Ts(i),sal,ssws,phir,tran(i,j),tbdn(i,j));
                    a(:,j,i)=tbsurf(1:2);
                    end
                end
                for i=1:length(Ts)
                TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
                TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:);
                end
                axes(handles.axes3);
%                 plot(Ts,TB_v,'-','LineWidth',2)
%                 title('垂直极化')
%                 xlabel('海面温度(K)')
%                 xlim([273 313])
%                 ylabel('亮温(K)')
                pcolor(273:313,0:65,TB_v');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 220]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[273 313],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[273:10:313]) %设置x坐标轴刻度位置
                xlabel('海面温度/ K','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('垂直极化','fontsize',10,'fontweight','bold','color','k')
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes4);
                 pcolor(273:313,0:65,TB_h');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 160]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[273 313],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[273:10:313]) %设置x坐标轴刻度位置
                xlabel('海面温度/ K','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('水平极化','fontsize',10,'fontweight','bold','color','k')
               
            case 4
              %%
                sita=0:65;
                ssws=0:40;
                for i=1:length(ssws)
                    for j=1:66
                    [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(f,V ,L ,Ts,sita(j),0,0);
                    end
                end
                for i=1:length(ssws)
                    for j=1:66
                    [tbsurf]=compute_surf_tb_model(f,sita(j),Ts,sal,ssws(i),phir,tran(i,j),tbdn(i,j));
                    a(:,j,i)=tbsurf(1:2);
                    end
                end
                for i=1:length(ssws)
                TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
                TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:);
                end
                axes(handles.axes3);
%                 plot(Ts,TB_v,'-','LineWidth',2)
%                 title('垂直极化')
%                 xlabel('海面温度(K)')
%                 xlim([273 313])
%                 ylabel('亮温(K)')
                pcolor(0:40,0:65,TB_v');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 220]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 40],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:10:40]) %设置x坐标轴刻度位置
                xlabel('海面风速/ m/s','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('垂直极化','fontsize',10,'fontweight','bold','color','k')
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes4);
                 pcolor(0:40,0:65,TB_h');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 160]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 40],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:10:40]) %设置x坐标轴刻度位置
                xlabel('海面风速/ m/s','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('水平极化','fontsize',10,'fontweight','bold','color','k')
            case 5
              %%
                sita=0:65;
                phir=0:10:360;
                for i=1:length(phir)
                    for j=1:66
                    [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(f,V ,L ,Ts,sita(j),0,0);
                    end
                end
                for i=1:length(phir)
                    for j=1:66
                    [tbsurf]=compute_surf_tb_model(f,sita(j),Ts,sal,ssws,phir(i),tran(i,j),tbdn(i,j));
                    a(:,j,i)=tbsurf(1:2);
                    end
                end
                for i=1:length(phir)
                TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
                TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:);
                end
                axes(handles.axes3);
%                 plot(Ts,TB_v,'-','LineWidth',2)
%                 title('垂直极化')
%                 xlabel('海面温度(K)')
%                 xlim([273 313])
%                 ylabel('亮温(K)')
                pcolor(0:36,0:65,TB_v');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 220]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 40],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:60:360]) %设置x坐标轴刻度位置
                set(gca,'xticklabel',{'0°','60°','120°','180°','240°','300°','360°'}) ;
                xlabel('海面风向/ m/s','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('垂直极化','fontsize',10,'fontweight','bold','color','k')
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes4);
                 pcolor(0:36,0:65,TB_h');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 160]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 36],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:6:36]) %设置x坐标轴刻度位置
                set(gca,'xticklabel',{'0°','60°','120°','180°','240°','300°','360°'}) ;
                xlabel('海面风向/ m/s','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('水平极化','fontsize',10,'fontweight','bold','color','k')
            case 6
                 %%
                sita=0:65;
                V=0:2:60;
                for i=1:length(V)
                    for j=1:66
                    [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(f,V(i) ,L ,Ts,sita(j),0,0);
                    end
                end
                for i=1:length(V)
                    for j=1:66
                    [tbsurf]=compute_surf_tb_model(f,sita(j),Ts,sal,ssws,phir,tran(i,j),tbdn(i,j));
                    a(:,j,i)=tbsurf(1:2);
                    end
                end
                for i=1:length(V)
                TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
                TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:);
                end
                axes(handles.axes3);
%                 plot(Ts,TB_v,'-','LineWidth',2)
%                 title('垂直极化')
%                 xlabel('海面温度(K)')
%                 xlim([273 313])
%                 ylabel('亮温(K)')
                pcolor(0:30,0:65,TB_v');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 220]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 30],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:5:30]) %设置x坐标轴刻度位置
                set(gca,'xticklabel',{'0','10','20','30','40','50','60'}) ;
                xlabel('水汽含量/ mm','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('垂直极化','fontsize',10,'fontweight','bold','color','k')
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes4);
                 pcolor(0:30,0:65,TB_h');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 160]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 30],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:5:30]) %设置x坐标轴刻度位置
                 set(gca,'xticklabel',{'0','10','20','30','40','50','60'}) ;
                xlabel('水汽含量/ mm','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('水平极化','fontsize',10,'fontweight','bold','color','k')
            case 7
                    %%
                sita=0:65;
                 L=0:0.01:0.2;
                for i=1:length(L)
                    for j=1:66
                    [tbup(i,j),tbdn(i,j),tran(i,j)]=AMSR_TB(f,V ,L(i) ,Ts,sita(j),0,0);
                    end
                end
                for i=1:length(L)
                    for j=1:66
                    [tbsurf]=compute_surf_tb_model(f,sita(j),Ts,sal,ssws,phir,tran(i,j),tbdn(i,j));
                    a(:,j,i)=tbsurf(1:2);
                    end
                end
                for i=1:length(L)
                TB_v(i,:)=a(1,:,i).*tran(i,:)+tbup(i,:);
                TB_h(i,:)=a(2,:,i).*tran(i,:)+tbup(i,:);
                end
                axes(handles.axes3);
%                 plot(Ts,TB_v,'-','LineWidth',2)
%                 title('垂直极化')
%                 xlabel('海面温度(K)')
%                 xlim([273 313])
%                 ylabel('亮温(K)')
                pcolor(0:20,0:65,TB_v');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 220]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 20],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:5:20]) %设置x坐标轴刻度位置
                set(gca,'xticklabel',{'0','0.05','0.1','0.15','0.2'}) ;
                xlabel('液态水含量/ mm','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('垂直极化','fontsize',10,'fontweight','bold','color','k')
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes4);
                 pcolor(0:20,0:65,TB_h');
                shading interp
                hc=colorbar;
                colormap(jet);
                set(gca,'Clim',[100 160]);%调整colorbar的范围
                %set(hc,'YTick',[0:0.1:0.8])%调整colorbar的刻度
                %调整colorbar的刻度显示
                %set(hc,'YTickLabel',{'0.3','0.6', '0.9'})
                set(hc,'fontweight','Bold','fontsize',10,'linewi',1)%调整colorbar的字体
                 %设置colorbar的名字
                set(get(hc,'title'),'string','亮温/ K','fontsize',8,'fontweight','bold','color','k');
              % 设置坐标轴
                set(gca,'xlim',[0 20],'ylim',[0 65])%设置刻度的起点
                set(gca,'Alim',[0 1]);%设置刻度的起点
                set(gca,'ytick',[0:5:65]) %设置y坐标轴刻度位置
                set(gca,'xtick',[0:5:20]) %设置x坐标轴刻度位置
                set(gca,'xticklabel',{'0','0.05','0.1','0.15','0.2'}) ;
                xlabel('液态水含量/ mm','fontsize',10,'fontweight','bold','color','k');
                ylabel('入射角/ °','fontsize',10,'fontweight','bold','color','k')
                title('水平极化','fontsize',10,'fontweight','bold','color','k')
        end
end


function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double
input=get(hObject,'string');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
