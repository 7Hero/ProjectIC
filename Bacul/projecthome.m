function varargout = projecthome(varargin)
% PROJECTHOME MATLAB code for projecthome.fig
%      PROJECTHOME, by itself, creates a new PROJECTHOME or raises the existing
%      singleton*.
%
%      H = PROJECTHOME returns the handle to a new PROJECTHOME or the handle to
%      the existing singleton*.
%
%      PROJECTHOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTHOME.M with the given input arguments.
%
%      PROJECTHOME('Property','Value',...) creates a new PROJECTHOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projecthome_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projecthome_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projecthome

% Last Modified by GUIDE v2.5 09-Jun-2020 19:18:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projecthome_OpeningFcn, ...
                   'gui_OutputFcn',  @projecthome_OutputFcn, ...
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


% --- Executes just before projecthome is made visible.
function projecthome_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projecthome (see VARARGIN)

% Choose default command line output for projecthome
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes projecthome wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = projecthome_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_on.
function button_on_Callback(hObject, eventdata, handles)
global stop;
stop= 0;
i = 3;
input = str2num(get(handles.nivel,'String'));
Inputs = [0 0 input];
Inputs1 = [ 0 0 input];
Outputs = [0 0 0 ];
Outputs1 = [0 0 0];
error= [];
error1 = [];
iesire=[];
iesire1 = [];
control = [];
k = 0;
err=[];
err1= [];
 while(1)
     tic
     Outputs(i) = DAQ_Read_SIM(Inputs,Outputs);
     Outputs1(i) = DAQ_Read_SIM_teoretic(Inputs1,Outputs1);
     error(i) = input- Outputs(i);
     error1(i) = input - Outputs1(i);
     
   %case 1;
     control(i) = error(i);
   
   %case 2;
     
     
     
     
     
     
     
     
     
     
     err=[err,error(3)];
     iesire = [iesire,Outputs(3)];
     draw_graphs(err,Inputs(3),iesire,handles,k);
     draw_bacuri(Outputs(3),handles);
     
     
     Inputs(1) = Inputs(2);
     Inputs(2) = Inputs(3);
     Inputs(3) = error(i);
     
     
     Outputs(1) = Outputs(2);
     Outputs(2) = Outputs(3);
   
     
     err1=[err1,error1(3)];
     iesire1 = [iesire1,Outputs1(3)];
     draw_graphs_1(err1,Inputs1(3),iesire1,handles,k)
     
     Inputs1(1) = Inputs1(2);
     Inputs1(2) = Inputs1(3);
     Inputs1(3) = error1(i);
     
     
     Outputs1(1) = Outputs1(2);
     Outputs1(2) = Outputs1(3);
     k=k+1;
     pause(1-toc)
     
      if stop == 1
                    
                    cla(handles.axes7,'reset')   
                    cla(handles.graf_real,'reset')
             break;        
      end
     
     
 end
 
 
 
 
 
 
 

% --- Executes on button press in button_off.
function button_off_Callback(hObject, eventdata, handles)
% hObject    handle to button_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stop; 
stop = 1;


function nivel_Callback(hObject, eventdata, handles)
% hObject    handle to nivel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nivel as text
%        str2double(get(hObject,'String')) returns contents of nivel as a double


% --- Executes during object creation, after setting all properties.
function nivel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nivel (see GCBO)
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


