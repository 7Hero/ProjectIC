function varargout = homeproject(varargin)
% HOMEPROJECT MATLAB code for homeproject.fig
%      HOMEPROJECT, by itself, creates a new HOMEPROJECT or raises the existing
%      singleton*.
%
%      H = HOMEPROJECT returns the handle to a new HOMEPROJECT or the handle to
%      the existing singleton*.
%
%      HOMEPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEPROJECT.M with the given input arguments.
%
%      HOMEPROJECT('Property','Value',...) creates a new HOMEPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before homeproject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to homeproject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help homeproject

% Last Modified by GUIDE v2.5 09-Jun-2020 18:47:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @homeproject_OpeningFcn, ...
                   'gui_OutputFcn',  @homeproject_OutputFcn, ...
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
end
% End initialization code - DO NOT EDIT


% --- Executes just before homeproject is made visible.
function homeproject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to homeproject (see VARARGIN)

% Choose default command line output for homeproject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes homeproject wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = homeproject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_on.
function button_on_Callback(hObject, eventdata, handles)
i = 3;
input = str2num(get(handles.nivel,'String'))
Inputs = [0 0 input 0 0]
Outputs = [0 0 0 0 0]

 while(1)
     outputs(i) = DAQ_Read_SIM(Inputs,Outputs)
     error(i) = Inputs(i)- outputs(i)
     control = error
 
 end
  i=i+1
end

% --- Executes on button press in button_off.
function button_off_Callback(hObject, eventdata, handles)
% hObject    handle to button_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end

function nivel_Callback(hObject, eventdata, handles)
% hObject    handle to nivel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nivel as text
%        str2double(get(hObject,'String')) returns contents of nivel as a double

end
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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
end

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
end



function nivel = DAQ_Read_SIM(In,Out)

nivel =1.682*Out(2) - 0.7486*Out(1)+0.002027*In(2)+0.04146*In(1);

end
