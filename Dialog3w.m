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

% v1
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


% --- Executes on button press in pushbutton1.
%% Select working directory
function pushbutton1_Callback(hObject, eventdata, handles)
    pathname = uigetdir('\\fs01\holuj$\Dokumente\Results\3Omega\SL-TH');
    set(handles.text3, 'String', pathname)
    
%% Give the sample name
function edit1_Callback(hObject, eventdata, handles)
    % name = get(handles.edit1,'String');

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give the applied power during 3w measurement
function edit2_Callback(hObject, eventdata, handles)
    % power = get(handles.edit2,'String')

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give length of the heater
function edit4_Callback(hObject, eventdata, handles)
    % l = str2double(get(handles.edit4,'String'));

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give half width of the heater
function edit3_Callback(hObject, eventdata, handles)
    % b = str2double(get(handles.edit3,'String'));

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give thickness of the superlattice
function edit10_Callback(hObject, eventdata, handles)
    % thickness = str2double(get(handles.edit10,'String'));

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give number of points taken to calculate the mean temperature oscillations
function edit9_Callback(hObject, eventdata, handles)
    % n = str2double(get(handles.edit9,'String'));

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

   
% --- Outputs from this function are returned to the command line.
function varargout = Dialog3w_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%% Editable table
    set(handles.uitable1,...
        'ColumnEditable', [true true true true true true true true]);
    set(handles.uitable2,...
        'ColumnEditable', [false true true true true]);
    set(handles.uitable4,...
        'ColumnEditable', [false true true true true]);

function uitable1_CellEditCallback(hObject, eventdata, handles)
%     dRdT_data = get(handles.uitable1, 'Value');
%     dRdT_data = str2double(get(handles.uitable1,'Value'));
    dRdT_data = str2double(get(handles.uitable1,'Value'));
function uitable1_CreateFcn(hObject, eventdata, handles)

function uitable2_CellEditCallback(hObject, eventdata, handles)
%     VIP_data = get(handles.uitable2, 'Value');
    VIP_data = str2double(get(handles.uitable2,'Value'));
function uitable2_CreateFcn(hObject, eventdata, handles)
    
function uitable4_CellEditCallback(hObject, eventdata, handles)
%     U3w_data = get(handles.uitable4, 'Value');
    U3w_data = str2double(get(handles.uitable3,'Value'));
function uitable4_CreateFcn(hObject, eventdata, handles)

    
%% load or enter data
    %% load dRdT data
    function pushbutton10_Callback(hObject, eventdata, handles)
        [FileName_dRdT dRdT_path] = uigetfile({'*dRdT_measured.dat'}, 'File Selector', '\\fs01\holuj$\Dokumente\Results\3Omega\SL-TH');
        dRdT_path = sprintf('%s%s', dRdT_path, FileName_dRdT);
        set(handles.text18, 'String', dRdT_path);
            dRdT_data_fromFile = importdata(dRdT_path);
                dRdT_size = size(dRdT_data_fromFile.textdata);
                dRdT_cela(1,1:dRdT_size(2)) = cellstr(dRdT_data_fromFile.textdata);
                dRdT_cela(2:9,1:dRdT_size(2)) = num2cell(dRdT_data_fromFile.data);
                                
                if dRdT_size(2) < 8
                    dRdT_cela(1:9,dRdT_size(2)+1:8) = cellstr('');
                end
                
                set(handles.uitable1, 'Data', dRdT_cela);
                
    %% save dRdT data
    function pushbutton14_Callback(hObject, eventdata, handles) %save button
        dRdT_data(1:9, 1:8) = get(handles.uitable1, 'Data');
%         xlswrite(sprintf('%s\\%s_dRdT_measured.xlsx', get(handles.text3, 'String'), get(handles.edit1, 'String')), dRdT_data);
        dRdTMeasured_path = sprintf('%s\\%s_dRdT_measured.dat', get(handles.text3, 'String'), get(handles.edit1, 'String'));
        cell2csv(dRdTMeasured_path , dRdT_data, '\t');
            dRdT_path = dRdT_VtoR(dRdTMeasured_path); % recalculate data from V do R


    %% load Voltage/Current/Pixel data
    function pushbutton11_Callback(hObject, eventdata, handles)
        [FileName_VIP VIP_path] = uigetfile({'*VIP.dat'}, 'File Selector', '\\fs01\holuj$\Dokumente\Results\3Omega\SL-TH');
        VIP_path = sprintf('%s%s', VIP_path, FileName_VIP);
        set(handles.text19, 'String', VIP_path);
            VIP_data_fromFile = importdata(VIP_path);
                VIP_size = size(VIP_data_fromFile.textdata);
                VIP_size_data = size(VIP_data_fromFile.data);
                VIP_cela(1:VIP_size(1),1:VIP_size(2)) = cellstr(VIP_data_fromFile.textdata);
                VIP_cela(2:VIP_size_data(1)+1,2:VIP_size_data(2)+1) = num2cell(VIP_data_fromFile.data);
                
                if VIP_size(2) < 5
                    VIP_cela(1:VIP_size(1),VIP_size(2)+1:5) = cellstr('');
                end
                
                if VIP_size_data(1) < 4
                    VIP_cela(VIP_size_data(1)+2:5,2:5) = cellstr('');
                end

                set(handles.uitable2, 'Data', VIP_cela);
    %% save Voltage/Current/Pixel data
    function pushbutton16_Callback(hObject, eventdata, handles) %Save button
        VIP_data(1:5,1:5) = get(handles.uitable2, 'Data');
%         xlswrite(sprintf('%s\\%s_VIP_test.xlsx', get(handles.text3, 'String'), get(handles.edit1, 'String')), VIP_data);
        VIP_path = sprintf('%s\\%s_%s_VIP.dat', get(handles.text3, 'String'), get(handles.edit1, 'String'), get(handles.edit2, 'String'));
        cell2csv(VIP_path, VIP_data, '\t');


    %% load U3w data
    function pushbutton12_Callback(hObject, eventdata, handles)
        [FileName_U3w U3w_path] = uigetfile({'*U3w.dat'}, 'File Selector', '\\fs01\holuj$\Dokumente\Results\3Omega\SL-TH');
        U3w_path = sprintf('%s%s', U3w_path, FileName_U3w);
        set(handles.text20, 'String', U3w_path);   
            U3w_data_fromFile = importdata(U3w_path);
                U3w_sizec = size(U3w_data_fromFile.textdata);
                U3w_sizer = size(U3w_data_fromFile.data);
                U3w_cela(1,1:U3w_sizec(2)) = cellstr(U3w_data_fromFile.textdata);
                U3w_cela(2:U3w_sizer(1)+1,1:U3w_sizec(2)) = num2cell(U3w_data_fromFile.data);
                
                if U3w_sizec(2) < 5
                    U3w_cela(1:U3w_sizer(1)+1,U3w_sizec(2)+1:5) = cellstr('');
                else
                end
                
                set(handles.uitable4, 'Data', U3w_cela);

    %% save U3w data
    function pushbutton15_Callback(hObject, eventdata, handles) %Save button
        U3w_data = get(handles.uitable4, 'Data');
%         xlswrite(sprintf('%s\\%s_U3w_test.xlsx', get(handles.text3, 'String'), get(handles.edit1, 'String')), U3w_data);
        U3w_path = sprintf('%s\\%s_%s_U3w.dat', get(handles.text3, 'String'), get(handles.edit1, 'String'), get(handles.edit2, 'String'));
        cell2csv(U3w_path, U3w_data, '\t');

        

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
        dRdT_path = sprintf('%s\\%s_dRdT.dat', folder, name);
%     else
%         dRdT_path = get(handles.text18, 'String');
%     end
    
    
%     if isempty(get(handles.text19, 'String'))
        VIP_path = sprintf('%s\\%s_%s_VIP.dat', folder, name, power);
%     else
%         VIP_path = get(handles.text19, 'String');
%     end

    
%     if isempty(get(handles.text20, 'String'))
        U3w_path = sprintf('%s\\%s_%s_U3w.dat', folder, name, power);
%     else
%         U3w_path = get(handles.text20, 'String');
%     end
    
    resolution = 200;
    
        EvaluationOf3wResults_gui(dRdT_path, VIP_path, U3w_path,...
                                  folder, name, power, l, b, thickness, n, ...
                                  save_pdf, save_png, resolution);


%% Clean functions

    % From VIP
    function edit16_Callback(hObject, eventdata, handles)
    function edit16_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

    % To VIP
    function edit17_Callback(hObject, eventdata, handles)
    function edit17_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
        % Clean VIP
        function pushbutton17_Callback(hObject, eventdata, handles)
            content = get(handles.uitable2, 'Data');
                from = str2double(get(handles.edit16, 'String'))+1;
                to = str2double(get(handles.edit17, 'String'))+1;
            clear(5,to-from+1) = cellstr('');
            content(1:5,from:to) = clear;
            set(handles.uitable2, 'Data', content);

            

    % From dRdT
    function edit18_Callback(hObject, eventdata, handles)
    function edit18_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

    % To dRdT
    function edit19_Callback(hObject, eventdata, handles)
    function edit19_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
        
        % Clean dRdT
        function pushbutton18_Callback(hObject, eventdata, handles)
            content = get(handles.uitable1, 'Data');
                from = str2double(get(handles.edit18, 'String'));
                to = str2double(get(handles.edit19, 'String'));
            clear(9,to-from+1) = cellstr('');
            content(1:9,from:to) = clear;
            set(handles.uitable1, 'Data', content);


            
    % From U3w
    function edit20_Callback(hObject, eventdata, handles)
    function edit20_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

    % To U3w
    function edit21_Callback(hObject, eventdata, handles)
    function edit21_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

        % Clean U3w
        function pushbutton19_Callback(hObject, eventdata, handles)
            content = get(handles.uitable4, 'Data');
                from = str2double(get(handles.edit20, 'String'))+1;
                to = str2double(get(handles.edit21, 'String'))+1;
            clear(17,to-from+1) = cellstr('');
            content(1:17,from:to) = clear;
            set(handles.uitable4, 'Data', content);
