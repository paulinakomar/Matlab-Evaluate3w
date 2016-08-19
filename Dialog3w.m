function varargout = Dialog3w(varargin)
% DIALOG3W MATLAB code for Dialog3w.fig
%      DIALOG3W, by itself, creates a new DIALOG3W or raises the existing
%      singleton*.
%
%      H = DIALOG3W returns the handle to a new DIALOG3W or the handle to
%      the existing singleton*.
%
%      DIALOG3W('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIALOG3W.M with the given input arguments.
%
%      DIALOG3W('Property','Value',...) creates a new DIALOG3W or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Dialog3w_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Dialog3w_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Dialog3w

% Last modified v2.0 Feb-2014
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Dialog3w_OpeningFcn, ...
                   'gui_OutputFcn',  @Dialog3w_OutputFcn, ...
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

% --- Executes just before Dialog3w is made visible.
function Dialog3w_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

%% Load configuration file
        [num, txt, raw] = xlsread('ConfigurationFile.xlsx');
            set(handles.text3, 'String', txt(2,2));
            set(handles.edit1, 'String', txt(3,2)); % set sample name
            set(handles.edit2, 'String', txt(7,2)); % set applied power during 3w measurement
            set(handles.edit4, 'String', raw(10,2)); % set length of the heater
            set(handles.edit3, 'String', raw(11,2)); % set half width of the heater
            set(handles.edit10, 'String', raw(9,2)); % set thickness of the superlattice
            set(handles.edit9, 'String', raw(12,2)); % set number of points taken to calculate the mean temperature oscillations

%% Select working directory
function pushbutton1_Callback(hObject, eventdata, handles)
    
        if isempty(get(handles.text3, 'String'))
            pathname = uigetdir();
            set(handles.text3, 'String', pathname);
        elseif isequal(get(handles.text3, 'String'), '0')
            pathname = uigetdir();
            set(handles.text3, 'String', pathname)
        else            
            StartDir = char(get(handles.text3, 'String'));
            pathname = uigetdir(StartDir);
            set(handles.text3, 'String', pathname);
        end
    
        
%% Give the sample name
function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give the applied power during 3w measurement
function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give length of the heater
function edit4_Callback(hObject, eventdata, handles)
function edit4_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give half width of the heater
function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give thickness of the superlattice
function edit10_Callback(hObject, eventdata, handles)
function edit10_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give number of points taken to calculate the mean temperature oscillations
function edit9_Callback(hObject, eventdata, handles)
function edit9_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

   
% --- Outputs from this function are returned to the command line.
function varargout = Dialog3w_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

       

 %% Save files in .pdf and/or .png
% .pdf
function checkbox2_Callback(hObject, eventdata, handles)
    
% .png
function checkbox3_Callback(hObject, eventdata, handles)
    get(handles.checkbox3,'Value')


 %% Set resolution of .png file
function edit15_Callback(hObject, eventdata, handles)
function edit15_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% new/old Pt100
function checkbox4_Callback(hObject, eventdata, handles)
    

%% EVALUATE button - starts function 'Evaluation of 3w results'
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
    folder = get(handles.text3, 'String');
    power = get(handles.edit2, 'String');
    name = get(handles.edit1, 'String');
    l = str2double(get(handles.edit4,'String'));
    b = str2double(get(handles.edit3,'String'));
    thickness = str2double(get(handles.edit10,'String'));
    n = str2double(get(handles.edit9,'String'));
    
    save_pdf = get(handles.checkbox2,'Value');
    save_png = get(handles.checkbox3,'Value');
    resolution = str2double(get(handles.edit15,'String'));
    
%     if isempty(get(handles.text18, 'String'))
        dRdT_path = sprintf('%s\\%s_dRdT.dat', folder, name{1});
%     else
%         dRdT_path = get(handles.text18, 'String');
%     end
    
    
%     if isempty(get(handles.text19, 'String'))
        VIP_path = sprintf('%s\\%s_%s_VIP.dat', folder, name{1}, power{1});
%     else
%         VIP_path = get(handles.text19, 'String');
%     end

    
%     if isempty(get(handles.text20, 'String'))
        U3w_path = sprintf('%s\\%s_%s_U3w.dat', folder, name{1}, power{1});
%     else
%         U3w_path = get(handles.text20, 'String');
%     end
    
    
        EvaluationOf3wResults_gui(dRdT_path, VIP_path, U3w_path,...
                                  folder, name{1}, power{1}, l, b, thickness, n, ...
                                  save_pdf, save_png, resolution);




% --- Executes on button press in pushbutton20.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit23_Callback(hObject, eventdata, handles)
function edit23_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function edit22_Callback(hObject, eventdata, handles)
function edit22_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% menu bar
% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
    % --------------------------------------------------------------------
    function ClearPathsNames_Callback(hObject, eventdata, handles)
        set(handles.text3, 'String', '');
        set(handles.edit1, 'String', '');
        set(handles.edit2, 'String', '');
        set(handles.edit10, 'String', '');
        set(handles.edit4, 'String', '');
        set(handles.edit3, 'String', '');
        set(handles.edit9, 'String', '');
        
    % --------------------------------------------------------------------
    function ConfFile_Callback(hObject, eventdata, handles)
        % --------------------------------------------------------------------
        function LoadConfFile_Callback(hObject, eventdata, handles)
        [ConfFileName ConfFilePath Index] = uigetfile({'*.xls; *.xlsx'}, 'File Selector');
                if Index == 0, return; end
        [num, txt, raw] = xlsread(sprintf('%s%s', ConfFilePath, ConfFileName));
            set(handles.text3, 'String', txt(2,2));
            set(handles.edit1, 'String', txt(3,2)); % set sample name
            set(handles.edit2, 'String', txt(7,2)); % set applied power during 3w measurement
            set(handles.edit4, 'String', raw(10,2)); % set length of the heater
            set(handles.edit3, 'String', raw(11,2)); % set half width of the heater
            set(handles.edit10, 'String', raw(9,2)); % set thickness of the superlattice
            set(handles.edit9, 'String', raw(12,2)); % set number of points taken to calculate the mean temperature oscillations
            
    % --------------------------------------------------------------------
    function GenTemplateConfFile_Callback(hObject, eventdata, handles)
        Temp = {'HeaterWidth:';...
            'Starting directory';...
            'Name of sample series';...
            'Number of images per sample';...
            'Number of points to be selected in order to measure the width';...
            'EnterData:';...
            'Power applied during 3w measurement';...
            'CalculateThermalConductivity:';...
            'Thickness of the superlattice';...
            'Length of the heater';...
            'Half width of the heater';...
            'Number of points taken to calculations'};
        [FileName, Path, Index] = uiputfile({'*.xlsx'}, 'Save as...');
            if Index == 0, return; end
        xlswrite(sprintf('%s\\%s', Path, FileName), Temp);



% --------------------------------------------------------------------
function Menu_Callback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
    function HeaterWidth_Callback(hObject, eventdata, handles)
        [h,figure] = gcbo;
        HeaterWidth();
        close(figure);

    % --------------------------------------------------------------------
    function EnterData_Callback(hObject, eventdata, handles)
        [h,figure] = gcbo;
        EnterData();
        close(figure);
    
    % --------------------------------------------------------------------
    function Exit_Callback(hObject, eventdata, handles)
        close(gcbf);


% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
    function About_Callback(hObject, eventdata, handles)
        winopen('Help.pdf');

    % --------------------------------------------------------------------
    function Affiliations_Callback(hObject, eventdata, handles)
        message = {'Created by Paulina Holuj'; 'holuj@uni-mainz.de, paulina.holuj@gmail.com'; 'University of Mainz'; 'Institute of Physics';...
            'AG Klaui, http://www.klaeui-lab.physik.uni-mainz.de/'; '2014'};
        icon = importdata('JGU_Mainz_logo_crop.png');
        h = msgbox(message, 'Affiliations', 'custom', icon.cdata, jet(size(icon.cdata,2)));
