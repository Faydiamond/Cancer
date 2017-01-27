function varargout = Higado(varargin)
% HIGADO MATLAB code for Higado.fig
%      HIGADO, by itself, creates a new HIGADO or raises the existing
%      singleton*.
%
%      H = HIGADO returns the handle to a new HIGADO or the handle to
%      the existing singleton*.
%
%      HIGADO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HIGADO.M with the given input arguments.
%
%      HIGADO('Property','Value',...) creates a new HIGADO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Higado_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Higado_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Higado

% Last Modified by GUIDE v2.5 22-Oct-2015 20:33:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Higado_OpeningFcn, ...
                   'gui_OutputFcn',  @Higado_OutputFcn, ...
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


% --- Executes just before Higado is made visible.
function Higado_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Higado (see VARARGIN)

% Choose default command line output for Higado
%primer  audio
[y,Fs] = audioread('Audio 1.wav');     %utlizo la  funcion  [y,Fs]  para  luego asignar un .wav
sound(y,Fs);                           %asigno el contenido del .wav
handles.output = hObject;              %establezco la salida  para que  retorne el respectivo audio
%%
guidata(hObject, handles);
%%
%declaracion  de  variables  de  tipo   global:
global I;
global II;
global III;
global media;
global dilatacion;
global et1;
global et2;
global I1;
global I2;
global Db;
global bw;
global J;
global A2;
global  A3;
%%
%asignacion   a  las  variables  creadas  anteriormente
I=imread ('cancer.jpg');
II = rgb2gray(I);
es = strel('disk',5);
III = imerode (II,es);
whos('III*')
media=(mean2(III));
dilatacion=im2bw (I);
et1=strel ('disk',5);                   %elemento  estructural
I1=imerode(II,et1);
et2=strel ('square',20);
I2=imerode (dilatacion,et1);
Db=edge (II);
bw=im2bw(II);
J=adapthisteq(II);
A2=adapthisteq(II,'clipLimit',0.05);
A3=adapthisteq(II,'numtiles',[30 30],'clipLimit',0.01);
%%
function varargout = Higado_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes during object creation, after setting all properties.
% hObject    handle to Logo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate Logo


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
function axes3_CreateFcn(hObject, eventdata, handles)

 global I;                  %declaro   la  variable I de tipo global
 I=imread ('cancer.jpg');   %le  asigno a  i   la  imagen respectiva
 imshow (I);                %muestra  la  imagen  que  permanecera  en el axes
 %%
function Menu_Callback(hObject, eventdata, handles)

function Menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in Menu1.
function Menu1_Callback(hObject, eventdata, handles)

% hObject    handle to Menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Menu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Menu1
% --- Executes during object creation, after setting all properties.
function Menu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on selection change in MiListaa.
function MiListaa_Callback(hObject, eventdata, handles)
% hObject    handle to MiListaa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns MiListaa contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MiListaa
% --- Executes during object creation, after setting all properties.
function MiListaa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MiListaa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%%
%boton  borrar:
set(handles.text3,'string',' ');            %borro  la  etiqueta
cla(handles.axes4,'reset');                 %reseteo  el axes  cuatro   donde  se  muestran  los filtros aplicados
%%
function MiLista_Callback(hObject, eventdata, handles)
%%
set(handles.axes4,'Visible','on');                                          %SE HACE  VISIBLE  EL  AXES
axes(handles.axes4);                                                        %dentro del axes  cuatro  se  establecen las imagenes  con  sus  respectivos  filtros
%%
%llamo  a  mis  variables  la  cuales  ya  tienen  su  respectiva
%asignacion
global II;
global III;
global  dilatacion;
global I1;
global I2;
global  bw;
global Db;
global J;
global A2;
global A3;
[x,map] = gray2ind(II,16);
%%

n=get(hObject,'Value');             %obtengo  el  clicc del usuario
bus=get(hObject,'String');          %obtengo la opcion elegida
switch n
   case 1
     
    cla(handles.axes4,'reset')                                                                      %reseteo el axes4
    set(handles.text3,'string',' ')                                                                 %borro  la  etiqueta 
    warndlg('POR  FAVOR   SELECCIONE   CUALQUIER   OTRO  ELEMENTO  DE  LA  LISTA ','notificacion'); %mensaje  de alerta  para  el usuario

    case 2
        
    [y,Fs] = audioread('Audio 2.wav');                                                              %utlizo la  funcion  [y,Fs]  para  luego leer  un .wav
    sound(y,Fs);                                                                                    %asigno el contenido del .wav
    handles.output = hObject;                                                                       %%establezco la salida  para que  retorne el respectivo audio
    imshow (II);                                                                                    %muestra   la  correpondiente  imagen
    set(handles.text3,'string','HAS  ELEGIDO  LA  OPCION  ESCALA  DE  GRISES');                     %notificacion mediante  una  etiqueta
    
     case 3 
    [y,Fs] = audioread('Audio 3.wav');                                                              %utlizo la  funcion  [y,Fs]  para  luego leer  un .wav
    sound(y,Fs);                                                                                    %asigno el contenido del .wav
    handles.output = hObject;                                                                       %establezco la salida  para que  retorne el respectivo audio
    imshow (III);                                                                                   %muestra   la  correpondiente  imagen
    set(handles.text3,'string','HAS  SELECCIONADO  LA  OPCIÓN  DIVIDIR IMAGEN');                    %notificacion mediante  una  etiqueta

     case 4
   
    [y,Fs] = audioread('Audio 4.wav');                                                              %utlizo la  funcion  [y,Fs]  para  luego leer  un .wav
    sound(y,Fs);                                                                                    %asigno el contenido del .wav
    handles.output = hObject;                                                                       %muestra   la  correpondiente  imagen
    image(I1, 'Parent', handles.axes4);                                                             %establezco la salida  para que  retorne el respectivo audio
    set(handles.text3,'string','HAS  SELECCIONADO  LA  OPCION  MEDIA');                             %notificacion mediante  una  etiqueta
     
    case 5
        
    [y,Fs] = audioread('Audio 5.wav');                                                              %utlizo la  funcion  [y,Fs]  para  luego leer  un .wav
    sound(y,Fs);                                                                                    %asigno el contenido del .wav
    handles.output = hObject;                                                                       %establezco la salida  para que  retorne el respectivo audio
    imshow (dilatacion);                                                                            %muestra   la  correpondiente  imagen
    set(handles.text3,'string','HAS  SELECCIONADO  LA  OPCION  DILATACION');                        %notificacion mediante  una  etiqueta

    case 6
    [y,Fs] = audioread('Audio 6.wav');                                                             %utlizo la  funcion  [y,Fs]  para  luego leer  un .wav
    sound(y,Fs);                                                                                   %asigno el contenido del .wav
    handles.output = hObject;                                                                      %establezco la salida  para que  retorne el respectivo audio
    imshow (I1);                                                                                   %muestra   la  correpondiente  imagen
    set(handles.text3,'string','HAS  SELECCIONADO  LA  OPCION  ELEMENTO ESTRUCTURAL  DE LA IMAGEN');%notificacion mediante  una  etiqueta
   
    case 7
        
    [y,Fs] = audioread('Audio 7.wav');                                                             %utlizo la  funcion  [y,Fs]  para  luego leer  un .wav
    sound(y,Fs);                                                                                   %asigno el contenido del .wav
    handles.output = hObject;                                                                      %establezco la salida  para que  retorne el respectivo audio
    imshow (I2);                                                                                   %muestra   la  correpondiente  imagen
    set(handles.text3,'string','HAS  SELECCIONADO  LA  OPCION  APERTURA');                         %notificacion mediante  una  etiqueta
    
    case 8
        
    [y,Fs] = audioread('Audio 8.wav');                                                             %utlizo la  funcion  [y,Fs]  para  luego leer  un .wav
    sound(y,Fs);                                                                                   %asigno el contenido del .wav
    handles.output = hObject;                                                                      %establezco la salida  para que  retorne el respectivo audio
    imshow(bw);                                                                                    %muestra   la  correpondiente  imagen
    set(handles.text3,'string','HAS  SELECCIONADO  LA  OPCION  IMAGEN  EN  BLANCO  Y NEGRO');      %notificacion mediante  una  etiqueta
                
    case 9
             
    imshow(J);                                                                                     %muestra   la  correpondiente  imagen
    set(handles.text3,'string','HAS  SELECCIONADO  LA  OPCION  ECUALIZACIÓN');                     %notificacion mediante  una  etiqueta

    case 10
               
    imshow(A3);                                                                                   %muestra   la  correpondiente  imagen
    set(handles.text3,'string','HAS  SELECCIONADO  LA  OPCION  ADAPTATIVA  CON CONTRASTE');       %notificacion mediante  una  etiqueta
              
    case 11
       
    imshow(A2);                                                                                    %muestra   la  correpondiente  imagen
    set(handles.text3,'string','HAS  SELECCIONADO  LA  OPCION  ADAPTATIVA  CON CONTRASTE LIMITADO'); %notificacion mediante  una  etiqueta
         
    case 12
       
    imshow(x,map);                                                                                  %muestra   la  correpondiente  imagen
     
    set(handles.text3,'string','HAS  SELECCIONADO  LA  OPCION  ADAPTATIVA  CON CONTRASTE INDEXADA'); %notificacion mediante  una  etiqueta
              
end

%%

function MiLista_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MiLista (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton3_Callback(hObject, eventdata, handles)
%%
%llamo  a  mis  variables  la  cuales  ya  tienen  su  respectiva
%asignacion
global I;
global II;
global III;
global  dilatacion;
global I1;
global bw;
global I2;
global J;
global A3;
%%
%las   ploteo  en  una  nueva  ventana
figure 
subplot(3,3,1);imshow(I);
title('Imagen Original');
subplot(3,3,2);imshow(bw);
title('blanco y negro');
subplot(3,3,3);imshow(II);
title('escala  de  grises');
subplot(3,3,4);imshow(dilatacion);
title('dilatacion');
subplot(3,3,5);imshow(III);
title('dividir  imagen');
subplot(3,3,6);imshow(I1);
title('elemento  estructural  ');
subplot(3,3,7);imshow(I2);
title('apertura');
subplot(3,3,8);imshow(J);
title('ecualización');
subplot(3,3,9);imshow(A3);
title('contraste');
%%
[y,Fs] = audioread('Audio 10.wav');                 %utlizo la  funcion  [y,Fs]  para  luego leer  un .wav
sound(y,Fs);                                        %asigno el contenido del .wav
handles.output = hObject;                           %establezco la salida  para que  retorne el respectivo audio
%%
