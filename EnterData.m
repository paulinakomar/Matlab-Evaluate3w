function varargout = EnterData(varargin)
% ENTERDATA MATLAB code for EnterData.fig
%      ENTERDATA, by itself, creates a new ENTERDATA or raises the existing
%      singleton*.
%
%      H = ENTERDATA returns the handle to a new ENTERDATA or the handle to
%      the existing singleton*.
%
%      ENTERDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENTERDATA.M with the given input arguments.
%
%      ENTERDATA('Property','Value',...) creates a new ENTERDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EnterData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EnterData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EnterData

% Last modified v2.0 Feb-2014
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EnterData_OpeningFcn, ...
                   'gui_OutputFcn',  @EnterData_OutputFcn, ...
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

% --- Executes just before EnterData is made visible.
function EnterData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EnterData (see VARARGIN)

% Choose default command line output for EnterData
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EnterData wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%% load configuration file
        [num, txt, raw] = xlsread('ConfigurationFile.xlsx');
            set(handles.text24, 'String', txt(2,2)); % starting directory
            set(handles.text16, 'String', txt(2,2));
            set(handles.text21, 'String', txt(2,2));
            set(handles.text13, 'String', txt(2,2));
            set(handles.edit9,  'String', txt(3,2)); % set sample name
            set(handles.edit10, 'String', txt(7,2)); % set power used in 3w mwasurements


% --- Outputs from this function are returned to the command line.
function varargout = EnterData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



%% Select working directory
function pushbutton11_Callback(hObject, eventdata, handles)
    if isempty(get(handles.text24, 'String'))
        pathname = uigetdir();
        set(handles.text24, 'String', pathname);
    elseif isequal(get(handles.text24, 'String'), '0')
        pathname = uigetdir();
        set(handles.text24, 'String', pathname)
    else
        StartDir = char(get(handles.text24, 'String'));
        pathname = uigetdir(StartDir);
        set(handles.text24, 'String', pathname);
    end
    
    if pathname == 0, return; end
    
%% Give the sample name
function edit9_Callback(hObject, eventdata, handles)
function edit9_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

%% Give the applied power during 3w measurement
function edit10_Callback(hObject, eventdata, handles)
function edit10_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% ---------------------
%% Editable table
%     set(handles.uitable3,...
%         'ColumnEditable', [true true true true true true true true]);
%     set(handles.uitable2,...
%         'ColumnEditable', [false true true true true]);
%     set(handles.uitable4,...
%         'ColumnEditable', [false true true true true]);
    

function uitable3_CellEditCallback(hObject, eventdata, handles)
%     dRdT_data = get(handles.uitable3, 'Value');
%     dRdT_data = str2double(get(handles.uitable3,'Value'));
    dRdT_data = str2double(get(handles.uitable3,'Value'));
function uitable3_CreateFcn(hObject, eventdata, handles)

function uitable2_CellEditCallback(hObject, eventdata, handles)
%     VIP_data = get(handles.uitable2, 'Value');
    VIP_data = str2double(get(handles.uitable2,'Data'));
function uitable2_CreateFcn(hObject, eventdata, handles)
    
    
function uitable4_CellEditCallback(hObject, eventdata, handles)
%     U3w_data = get(handles.uitable3, 'Value');
    U3w_data = str2double(get(handles.uitable3,'Value'));
function uitable4_CreateFcn(hObject, eventdata, handles)



    
%% load or enter data
    %% load dRdT data
    function pushbutton13_Callback(hObject, eventdata, handles)
        
        if isempty(get(handles.text21, 'String'))
            [FileName_dRdT, dRdT_path, Index] = uigetfile({'*dRdT_measured.dat'}, 'File Selector');
            dRdT_path = sprintf('%s%s', dRdT_path, FileName_dRdT);
            set(handles.text21, 'String', dRdT_path);
                if Index == 0, return; end
        else
            StartDir = char(get(handles.text21, 'String'));
            [FileName_dRdT, dRdT_path] = uigetfile({'*dRdT_measured.dat'}, 'File Selector', StartDir);
            dRdT_path = sprintf('%s%s', dRdT_path, FileName_dRdT);
            set(handles.text21, 'String', dRdT_path);
%                 if Index == 0, return; end
        end
        
            dRdT_data_fromFile = importdata(dRdT_path);
                dRdT_size = size(dRdT_data_fromFile.textdata);
                dRdT_size_rows = size(dRdT_data_fromFile.data);
                dRdT_cela(1,1:dRdT_size(2)) = cellstr(dRdT_data_fromFile.textdata);
                dRdT_cela(2:(dRdT_size_rows(1)+1),1:dRdT_size_rows(2)) = num2cell(dRdT_data_fromFile.data);
                                
                if dRdT_size(2) < 8
                    dRdT_cela(1:9,dRdT_size(2)+1:8) = cellstr('');
                end
                
                if dRdT_size_rows(1) < 9
                    dRdT_cela((dRdT_size_rows(1)+2):9,1:8) = cellstr('');
                end
                
                set(handles.uitable3, 'Data', dRdT_cela);
                

                
    %% save dRdT data
    function pushbutton14_Callback(hObject, eventdata, handles) %save button
        dRdT_data(1:9, 1:8) = get(handles.uitable3, 'Data');
%         xlswrite(sprintf('%s\\%s_dRdT_measured.xlsx', get(handles.text3, 'String'), get(handles.edit1, 'String')), dRdT_data);
        DD = dir(char(get(handles.text24, 'String')));
        Names = cat(2,DD.name);
        comp = regexp(Names, sprintf('%s_dRdT_measured.dat', char(get(handles.edit9, 'String'))));
        if comp
            b=questdlg('The file allready exists!!! Do you want to overwrite?', 'WARNING!', ...
            'Yes','No','No');

            switch b
                case 'Yes'
                    dRdTMeasured_path = sprintf('%s\\%s_dRdT_measured.dat', get(handles.text24, 'String'), char(get(handles.edit9, 'String')));
                    cell2csv(dRdTMeasured_path , dRdT_data, '\t');
                    dRdT_path = dRdT_VtoR(dRdTMeasured_path); % recalculate data from V do R
                case 'No'
                    return;
            end
        else
            dRdTMeasured_path = sprintf('%s\\%s_dRdT_measured.dat', get(handles.text24, 'String'), char(get(handles.edit9, 'String')));
            cell2csv(dRdTMeasured_path , dRdT_data, '\t');
            dRdT_path = dRdT_VtoR(dRdTMeasured_path); % recalculate data from V do R

        end




% Names = cat(1,DD.name); % get the files name.
% bull=strcmp(file,Names); % compare
% if bull
% b=questdlg('The file allready exist', 'Do you want to overwrite', ...
% 'Yes','No','No');
% switch b
% case 'Yes'
% save(file,...)
% end
% end

    %% load pixel width from HeaterWidth.m
    function pushbutton24_Callback(hObject, eventdata, handles)
        
        if isempty(get(handles.text24, 'String'))
            [FileName_pixel pixel_path Index] = uigetfile({'*.dat'}, 'File Selector');
            Pixel_path = sprintf('%s%s', pixel_path, FileName_pixel);
                if Index == 0, return; end
        else
            StartDir = char(get(handles.text24, 'String'));
            [FileName_pixel pixel_path Index] = uigetfile({'*.dat'}, 'File Selector', StartDir);
            Pixel_path = sprintf('%s%s', pixel_path, FileName_pixel);
                if Index == 0, return; end
        end
        
        table = get(handles.uitable2, 'Data');
        Pixel_data = importdata(Pixel_path);
        table(5,2:length(Pixel_data.data)+1) = num2cell(Pixel_data.data);
            set(handles.uitable2, 'Data', table);
        
    %% load Voltage/Current/Pixel data
    function pushbutton20_Callback(hObject, eventdata, handles)
        
        if isempty(get(handles.text13, 'String'))
            [FileName_VIP VIP_path Index] = uigetfile({'*VIP.dat'}, 'File Selector');
            VIP_path = sprintf('%s%s', VIP_path, FileName_VIP);
            set(handles.text13, 'String', VIP_path);
                if Index == 0, return; end
        else
            StartDir = char(get(handles.text13, 'String'));
            [FileName_VIP VIP_path Index] = uigetfile({'*VIP.dat'}, 'File Selector', StartDir);
            VIP_path = sprintf('%s%s', VIP_path, FileName_VIP);
            set(handles.text13, 'String', VIP_path);
                if Index == 0, return; end
        end
        

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
    function pushbutton19_Callback(hObject, eventdata, handles) %Save button
        VIP_data(1:5,1:5) = get(handles.uitable2, 'Data');
%         xlswrite(sprintf('%s\\%s_VIP_test.xlsx', get(handles.text3, 'String'), get(handles.edit1, 'String')), VIP_data);
        DD = dir(char(get(handles.text24, 'String')));
        Names = cat(2,DD.name);
        comp = regexp(Names, sprintf('%s_%s_VIP.dat', char(get(handles.edit9, 'String')), char(get(handles.edit10, 'String'))));
        if comp
            b=questdlg('The file allready exists!!! Do you want to overwrite?', 'WARNING!', ...
            'Yes','No','No');

            switch b
                case 'Yes'
                    VIP_path = sprintf('%s\\%s_%s_VIP.dat', get(handles.text24, 'String'), char(get(handles.edit9, 'String')), char(get(handles.edit10, 'String')));
                    cell2csv(VIP_path, VIP_data, '\t');
                case 'No'
                    return;
            end
        else
            VIP_path = sprintf('%s\\%s_%s_VIP.dat', get(handles.text24, 'String'), char(get(handles.edit9, 'String')), char(get(handles.edit10, 'String')));
            cell2csv(VIP_path, VIP_data, '\t');
        end


    %% load U3w data
    function pushbutton17_Callback(hObject, eventdata, handles)
        
        if isempty(get(handles.text16, 'String'))
            [FileName_U3w U3w_path Index] = uigetfile({'*U3w.dat'}, 'File Selector');
            U3w_path = sprintf('%s%s', U3w_path, FileName_U3w);
            set(handles.text16, 'String', U3w_path);
                if Index == 0, return; end
        else
            StartDir = char(get(handles.text16, 'String'));
            [FileName_U3w U3w_path Index] = uigetfile({'*U3w.dat'}, 'File Selector', StartDir);
            U3w_path = sprintf('%s%s', U3w_path, FileName_U3w);
            set(handles.text16, 'String', U3w_path);
                if Index == 0, return; end
        end
        
   
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
    function pushbutton16_Callback(hObject, eventdata, handles) %Save button
        U3w_data = get(handles.uitable4, 'Data');
%         xlswrite(sprintf('%s\\%s_U3w_test.xlsx', get(handles.text3, 'String'), get(handles.edit1, 'String')), U3w_data);
        DD = dir(char(get(handles.text24, 'String')));
        Names = cat(2,DD.name);
        comp = regexp(Names, sprintf('%s_%s_U3w.dat', char(get(handles.edit9, 'String')), char(get(handles.edit10, 'String'))));
        if comp
            b=questdlg('The file allready exists!!! Do you want to overwrite?', 'WARNING!', ...
            'Yes','No','No');

            switch b
                case 'Yes'
                    U3w_path = sprintf('%s\\%s_%s_U3w.dat', get(handles.text24, 'String'), char(get(handles.edit9, 'String')), char(get(handles.edit10, 'String')));
                    cell2csv(U3w_path, U3w_data, '\t');
                case 'No'
                    return;
            end
        else
            U3w_path = sprintf('%s\\%s_%s_U3w.dat', get(handles.text24, 'String'), char(get(handles.edit9, 'String')), char(get(handles.edit10, 'String')));
            cell2csv(U3w_path, U3w_data, '\t');
        end
        
        
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
        function pushbutton18_Callback(hObject, eventdata, handles)
            content = get(handles.uitable2, 'Data');
                from = str2double(get(handles.edit16, 'String'))+1;
                to = str2double(get(handles.edit17, 'String'))+1;
            
                
            cl = cellstr('Sample');
            for i=1:(to-from)
                if to-from == 0
                    cl = cl;
                else
                    cl = [cl cellstr('Sample')];
                end
            end
            
            cl(2:5,to-from+1) = cellstr('');
            content(1:5,from:to) = cl;
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
        function pushbutton12_Callback(hObject, eventdata, handles)
            content = get(handles.uitable3, 'Data');
                from = str2double(get(handles.edit18, 'String'));
                to = str2double(get(handles.edit19, 'String'));
            
            cl = cellstr('Sample');
            for i=1:(to-from)
                if to-from == 0
                    cl = cl;
                else
                    cl = [cl cellstr('Sample')];
                end
            end
            
            cl(2:9,to-from+1) = cellstr('');
            content(1:9,from:to) = cl;
            set(handles.uitable3, 'Data', content);

            
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
        function pushbutton15_Callback(hObject, eventdata, handles)
            content = get(handles.uitable4, 'Data');
                from = str2double(get(handles.edit20, 'String'))+1;
                to = str2double(get(handles.edit21, 'String'))+1;
                
            cl = cellstr('Sample');
            for i=1:(to-from)
                if to-from == 0
                    cl = cl;
                else
                    cl = [cl cellstr('Sample')];
                end
            end   
                
            cl(2:17,to-from+1) = cellstr('');
            content(1:17,from:to) = cl;
            set(handles.uitable4, 'Data', content);




% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
    % --------------------------------------------------------------------
    function ClearPathsNames_Callback(hObject, eventdata, handles)
        set(handles.text24, 'String', '');
        set(handles.text16, 'String', '');
        set(handles.text21, 'String', '');
        set(handles.text13, 'String', '');
        set(handles.edit9, 'String', '');
        set(handles.edit10, 'String', '');
    % --------------------------------------------------------------------
    function ConfFile_Callback(hObject, eventdata, handles)
        % --------------------------------------------------------------------
        function LoadConfFile_Callback(hObject, eventdata, handles)
        [ConfFileName ConfFilePath Index] = uigetfile({'*.xls; *.xlsx'}, 'File Selector');
                if Index == 0, return; end
        [num, txt, raw] = xlsread(sprintf('%s%s', ConfFilePath, ConfFileName));
            set(handles.text24, 'String', txt(2,2)); % starting directory
            set(handles.text16, 'String', txt(2,2));
            set(handles.text21, 'String', txt(2,2));
            set(handles.text13, 'String', txt(2,2));
            set(handles.edit9,  'String', txt(3,2)); % set sample name
            set(handles.edit10, 'String', txt(7,2)); % set power used in 3w mwasurements

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
    function MeasureHeaterWidth_Callback(hObject, eventdata, handles)
        [h,figure] = gcbo;
        HeaterWidth();
        close(figure);

    % --------------------------------------------------------------------
    function Evaluate_Callback(hObject, eventdata, handles)
        [h,figure] = gcbo;
        Dialog3w();
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
