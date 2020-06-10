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

% Last Modified by GUIDE v2.5 10-Jun-2020 19:46:58

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
input = str2num(get(handles.nivel,'String'));
DataIn=[0 0 0 0 0 0];
DataOut=[0 0 0 0 0 0]; 
DataIn_teo=[0 0 0 0 0 0];
DataOut_teo=[0 0 0 0 0 0]; 
n=0 ;
n_teo = 0;
nivel=[];
nivel_teo = [];
FirstData = [];
error=[]; 
error_teo=[];
control =[];
control_teo =[];
i=1;
 while(1)
     tic
     FirstData(i)=input;

     n = DAQ_Read_SIM(DataIn,DataOut,handles);
     nivel(i) = n
     
     n_teo = DAQ_Read_SIM_teoretic(DataIn_teo,DataOut_teo,handles);
     nivel_teo(i) = n_teo
     
     
     error(i) = FirstData(i) - nivel(i);
     error_teo(i) = FirstData(i) - nivel_teo(i);
      
     id= get(handles.selecion,'value'); 

       switch id 
         case 1 
                break ;
         case 2 
                control (i) = error(i)*5; 
                control_teo(i) = error_teo(i);
                
         case 3  
             if i == 1  
              control(i)=13.263*error(i);
              control_teo(i) = 13.263*error_teo(i);
             else 
               control (i) = 13.263*error(i) - 10.2125 *error(i-1); 
               control_teo (i) = 13.263* error_teo(i) - 10.2125* error_teo(i-1) ;
             end 
              if control (i) > 100 
                  control (i) = 100; 
             end 
             if control (i) <= 0 
                  control (i) = 0; 
             end  
              if control_teo (i) > 100 
                  control_teo (i) = 100; 
             end 
             if control_teo (i) <= 0 
                  control_teo (i) = 0; 
             end
            case 4
             if i == 1
               control(i) = 58.223*error(i);
               control_teo(i) = 58.223*error_teo(i);
             end
             if i == 2 
               control(i)=58.223*error(i)-20.378*error(i-1);
               control_teo(i)=58.223*error_teo(i)-20.378*error_teo(i-1);
             end
             if i > 2
                 control(i)=58.223*error(i)-20.378*error(i-1)-4.3667*error(i-2)+control_teo(i-1);
                 control_teo(i)=58.223*error_teo(i)-20.378*error_teo(i-1)-4.3667*error_teo(i-2)+control_teo(i-1);
             end 
             if control (i) > 1000 
                  control (i) = 2000; 
             end 
             if control (i) <= 0 
                  control (i) = 70; 
             end 
             if control_teo (i) > 1000 
                  control_teo (i) = 2000; 
             end 
             if control_teo (i) <= 0 
                  control_teo (i) = 70; 
             end 
           case 5
                 error_teo(i)= 0;
                  nivel_teo(i)= 0;
                  control_teo(i)=0;
               if(nivel(i)>60)
                    control(i)=0;
                end
                if(nivel(i)<40)
                    control(i)=100;
                end
                if(nivel(i)<60 && i>1 && error(i)<error(i-1))
                    control(i)=100;
                end
                if(nivel(i)>40 && i>1 && error(i)>error(i-1))
                    control(i)=0;
                end
               
       end
    
    draw_graphs( i,error,nivel,control,handles)
    draw_graphs_teo(i,error_teo,nivel_teo,control_teo,handles)
    draw_bacuri( nivel,handles,i)
       DataOut(1)=nivel(i);
       DataIn(1)=control(i); 
       DataOut_teo(1)=nivel_teo(i);
       DataIn_teo(1)=control_teo(i);
            if i > 1
                
                 DataOut(5)=DataOut(4);
                 DataOut(4)=DataOut(3); 
                 DataOut(3)=DataOut(2);
                 DataOut(2)=DataOut(1);
                 
                 DataIn(6)= DataIn(5);
                 DataIn(5)= DataIn(4);
                 DataIn(4)= DataIn(3);
                 DataIn(3)= DataIn(2);
                 DataIn(2)= DataIn(1);
                 
                 
                 DataOut_teo(5)=DataOut_teo(4);
                 DataOut_teo(4)=DataOut_teo(3); 
                 DataOut_teo(3)=DataOut_teo(2);
                 DataOut_teo(2)=DataOut_teo(1);
                 
                 DataIn_teo(6)= DataIn_teo(5);
                 DataIn_teo(5)= DataIn_teo(4);
                 DataIn_teo(4)= DataIn_teo(3);
                 DataIn_teo(3)= DataIn_teo(2);
                 DataIn_teo(2)= DataIn_teo(1);
                  
               end
     
    
     pause(1-toc)
     i=i+1;
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


% --- Executes on selection change in selecion.
function selecion_Callback(hObject, eventdata, handles)
% hObject    handle to selecion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns selecion contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selecion
 id= get(handles.selecion,'value'); 
     
      switch id
          case 1
              set (handles.sistema,'String','You didnt select anything'); 
          
          case 2
              set (handles.sistema,'String','Without Controller');
            
              
          case 3 
              set (handles.sistema,'String','PD controller');
          case 4 
              set (handles.sistema,'String','PID controller');
          case 5 
              set (handles.sistema,'String','FEEDBACK RELAY');
         
         
              
        
                   
                     
   

     
      end 

% --- Executes during object creation, after setting all properties.
function selecion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selecion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sistema_Callback(hObject, eventdata, handles)
% hObject    handle to sistema (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sistema as text
%        str2double(get(hObject,'String')) returns contents of sistema as a double


% --- Executes during object creation, after setting all properties.
function sistema_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sistema (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
