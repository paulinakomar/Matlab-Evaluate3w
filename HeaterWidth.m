function varargout = HeaterWidth(varargin)
% HEATERWIDTH MATLAB code for HeaterWidth.fig
%      HEATERWIDTH, by itself, creates a new HEATERWIDTH or raises the existing
%      singleton*.
%
%      H = HEATERWIDTH returns the handle to a new HEATERWIDTH or the handle to
%      the existing singleton*.
%
%      HEATERWIDTH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HEATERWIDTH.M with the given input arguments.
%
%      HEATERWIDTH('Property','Value',...) creates a new HEATERWIDTH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HeaterWidth_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HeaterWidth_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HeaterWidth

% Last modified v2.0 Feb-2014
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HeaterWidth_OpeningFcn, ...
                   'gui_OutputFcn',  @HeaterWidth_OutputFcn, ...
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


% --- Executes just before HeaterWidth is made visible.
function HeaterWidth_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HeaterWidth (see VARARGIN)

% Choose default command line output for HeaterWidth
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HeaterWidth wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%% load configuration file
        [num, txt, raw] = xlsread('ConfigurationFile.xlsx');
            [num, txt, raw] = xlsread('ConfigurationFile.xlsx');
                set(handles.text3, 'String', txt(2,2)); % starting directory
%                 set(handles.text5, 'String', txt(2,2)); % starting directory
                set(handles.edit1, 'String', txt(3,2)); % set sample name
                set(handles.edit5, 'String', txt(3,2));
                set(handles.edit7, 'String', txt(3,2));
                set(handles.edit9, 'String', txt(3,2));
                set(handles.edit2, 'String', raw(4,2)); % set number of images
                set(handles.edit6, 'String', raw(4,2));
                set(handles.edit8, 'String', raw(4,2));
                set(handles.edit10, 'String', raw(4,2));
                set(handles.edit11, 'String', raw(5,2)); % set number of points to be selected


% --- Outputs from this function are returned to the command line.
function varargout = HeaterWidth_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;





%% Folders where are images
    % Folder with thick samples
    function pushbutton1_Callback(hObject, eventdata, handles)
     
        if isempty(get(handles.text3, 'String'))
            pathname_thick = uigetdir();
            set(handles.text3, 'String', pathname_thick)
        elseif isequal(get(handles.text3, 'String'), '0')
            pathname_thick = uigetdir();
            set(handles.text3, 'String', pathname_thick)
        else
            StartDir = char(get(handles.text3, 'String'));
            pathname_thick = uigetdir(StartDir);
            set(handles.text3, 'String', pathname_thick)
        end
        
        if pathname_thick == 0, return; end
        

    % Folder with reference sample
    function pushbutton2_Callback(hObject, eventdata, handles)
        if isempty(get(handles.text5, 'String'))
            pathname_ref = uigetdir();
            set(handles.text5, 'String', pathname_ref);
        elseif isequal(get(handles.text5, 'String'), '0')
            pathname_thick = uigetdir();
            set(handles.text5, 'String', pathname_thick)
        else            
            StartDir = char(get(handles.text5, 'String'));
            pathname_ref = uigetdir(StartDir);
            set(handles.text5, 'String', pathname_ref);
        end
        
        if pathname_ref == 0, return; end

        
%% Sample names
    % Sample 1
    function edit1_Callback(hObject, eventdata, handles)
    function edit1_CreateFcn(hObject, eventdata, handles)
        if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor','white');
        end
    
    % Sample 2
    function edit5_Callback(hObject, eventdata, handles)
    function edit5_CreateFcn(hObject, eventdata, handles)
        if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor','white');
        end

    % Sample 3
    function edit7_Callback(hObject, eventdata, handles)
    function edit7_CreateFcn(hObject, eventdata, handles)
        if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor','white');
        end
        
    % Sample 4
    function edit9_Callback(hObject, eventdata, handles)
    function edit9_CreateFcn(hObject, eventdata, handles)
        if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor','white');
        end

        
%% Number of images
    % Sample 1
    function edit2_Callback(hObject, eventdata, handles)
    function edit2_CreateFcn(hObject, eventdata, handles)
        if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor','white');
        end

    % Sample 2
    function edit6_Callback(hObject, eventdata, handles)
    function edit6_CreateFcn(hObject, eventdata, handles)
        if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor','white');
        end

    % Sample 3
    function edit8_Callback(hObject, eventdata, handles)
    function edit8_CreateFcn(hObject, eventdata, handles)
        if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor','white');
        end

    % Sample 4
    function edit10_Callback(hObject, eventdata, handles)
    function edit10_CreateFcn(hObject, eventdata, handles)
        if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor','white');
        end


%% Initialize objects
    function uitable1_CellEditCallback(hObject, eventdata, handles)
        guidata(hObject, handles);
    function uitable1_CreateFcn(hObject, eventdata, handles)
        
    function axes1_CreateFcn(hObject, eventdata, handles)
    function axes2_CreateFcn(hObject, eventdata, handles)
        
    function text17_CreateFcn(hObject, eventdata, handles)
        
%% Number of points to be selected
function edit11_Callback(hObject, eventdata, handles)
function edit11_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

    
%% OK button
function pushbutton3_Callback(hObject, eventdata, handles)

    set(handles.uitable1, 'Data', []);
    
    k = 1;
        folder = {get(handles.text3, 'String'), get(handles.text5, 'String')};
        while ~strcmp('0', folder{k}) 
            folder_corr{k} = folder{k};
 
            if k < 2
                k = k+1;
            else
                break
            end
        end
        
    k = 1;
        name = {get(handles.edit1, 'String'), get(handles.edit5, 'String'), ...
                get(handles.edit7, 'String'), get(handles.edit9, 'String')};
            while ~strcmp('', name{k})
                  name_corr{k} = name{k};
                if k < 4
                    k = k+1;
                else
                    break
                end
            end

    k = 1;
        number = [str2double(get(handles.edit2, 'String')), str2double(get(handles.edit6, 'String')), ...
                  str2double(get(handles.edit8, 'String')), str2double(get(handles.edit10, 'String'))];
            while ~isnan(number(k))
                  number_corr(k) = number(k);
                if k < 4
                    k = k+1;
                else
                    break
                end
            end

    %% load data and evaluate it
    for i = 1:length(name_corr)
        for j = 1:number_corr(i)

          if length(folder_corr) > 1 
             if i < 3
                 folder_pom = cellstr(folder_corr(1));
             else
                 folder_pom = cellstr(folder_corr(2));
             end
          else
              folder_pom = folder_corr;
          end
             name_corr_pom = char(name_corr{i});
             set(handles.text18, 'String', sprintf('%s_0%0.f.png', name_corr_pom, j))
                photo = importdata(sprintf('%s\\%s_0%0.f.png', folder_pom{1}, name_corr_pom, j));
                Image = rgb2gray(photo.cdata);
                    imshow(Image, 'Parent', handles.axes2)


                Edges = edge(Image); % detects edges in the grayscale image
                [row, column] = find(Edges);
                    axes(handles.axes1);
                    spy(Edges);
                    set(handles.axes1,'xtick',[],'ytick',[]);
                    

                % zaznaczanie punktow. Dwa pierwsze tworza prosta. Trzeci to punkt, ktorego
                % odleglosc jest liczona od prostej
                set(handles.text17, 'String', sprintf('Select 2 points to define a first line'))
                    [x, y] = ginput(2);
                    line(x, y, 'Color', 'r');

                % wspolczynniki kierunkowe prostej
                a = (y(1)-y(2))/(x(1)-x(2));
                b = y(1) - a*x(1);

                % prosta w postaci ogolnej
                A = a;
                B = -1;
                C = b;

                % zaznacz 5 punktow
                n_points = str2double(get(handles.edit11, 'String'));
                set(handles.text17, 'String', ...
                    sprintf('Select %0.f points on the second line to determine the distance', str2double(get(handles.edit11, 'String'))));
                    
                    [Px, Py] = ginput(n_points);
                    line(Px, Py, 'Color', 'r');

                %odleglosc punktu od prostej
                for k=1:n_points
                    d(k) = abs(A*Px(k) + B*Py(k) + C)/sqrt(A^2 + B^2);
                end

                d_mean(i,j) = round(mean(d)*100)/100;
                
        end
    end
    
    ImSize = size(Image);
    if ImSize(1) == 480 && ImSize(2) == 640
        MaskWidth = 120;
    elseif ImSize(1) == 576 && ImSize(2) == 720
        MaskWidth = 118;
    end

    for i=1:length(name_corr)
        width(i) = round(mean(d_mean(i,:))*100)/(100*MaskWidth);
    end

    set(handles.uitable1, 'Data', num2cell(width))

  
%% Save button - series of samples
    function pushbutton7_Callback(hObject, eventdata, handles)
        pixel_data(1) = cellstr('Pixel');
        pixel_data(2:length(get(handles.uitable1, 'Data'))+1) = get(handles.uitable1, 'Data');
%         pixel_path = sprintf('%s\\pixelWidth.dat', get(handles.text3, 'String'));
            [file, path] = uiputfile('*.dat','Save Measured Pixel Width As', get(handles.text3, 'String'));
                pixel_path = sprintf('%s%s', path, file);
                cell2csv(pixel_path, pixel_data, '\t');


% Save
function pushbutton10_Callback(hObject, eventdata, handles)
        pixel_data(1) = cellstr('Pixel');
        pixel_data(2:length(get(handles.uitable3, 'Data'))+1) = get(handles.uitable3, 'Data');
%         pixel_path = sprintf('%s\\pixelWidth.dat', get(handles.text3, 'String'));
            [file, path] = uiputfile('*.dat','Save Measured Pixel Width As');
                pixel_path = sprintf('%s%s', path, file);
                cell2csv(pixel_path, pixel_data, '\t');


%% Number of points to be selected
function edit12_Callback(hObject, eventdata, handles)
function edit12_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

    
%% single samples
% Sample 1
function pushbutton12_Callback(hObject, eventdata, handles)
        [handles.FileName.s{1} handles.FilePath.s{1}] = uigetfile({'*.png'; '*.jpg'; '*.jpeg'; '*.tif'; '*.tiff'; '*.gif'; '*.bmp'}, 'File Selector',...
            '\\fs01\holuj$\Dokumente\RESULTS\3Omega\SL-TH');
        set(handles.text21, 'String', sprintf('%s%s', handles.FilePath.s{1}, handles.FileName.s{1}));
        guidata(hObject, handles);

% Sample 2
function pushbutton11_Callback(hObject, eventdata, handles)
        [handles.FileName.s{2} handles.FilePath.s{2}] = uigetfile({'*.png'; '*.jpg'; '*.jpeg'; '*.tif'; '*.tiff'; '*.gif'; '*.bmp'}, 'File Selector',...
            '\\fs01\holuj$\Dokumente\RESULTS\3Omega\SL-TH');
        set(handles.text24, 'String', sprintf('%s%s', handles.FilePath.s{2}, handles.FileName.s{2}));
        guidata(hObject, handles);

% Sample 3
function pushbutton14_Callback(hObject, eventdata, handles)
        [handles.FileName.s{3} handles.FilePath.s{3}] = uigetfile({'*.png'; '*.jpg'; '*.jpeg'; '*.tif'; '*.tiff'; '*.gif'; '*.bmp'}, 'File Selector',...
            '\\fs01\holuj$\Dokumente\RESULTS\3Omega\SL-TH');
        set(handles.text32, 'String', sprintf('%s%s', handles.FilePath.s{3}, handles.FileName.s{3}));
        guidata(hObject, handles);

% Sample 4
function pushbutton13_Callback(hObject, eventdata, handles)
        [handles.FileName.s{4} handles.FilePath.s{4}] = uigetfile({'*.png'; '*.jpg'; '*.jpeg'; '*.tif'; '*.tiff'; '*.gif'; '*.bmp'}, 'File Selector',...
            '\\fs01\holuj$\Dokumente\RESULTS\3Omega\SL-TH');
        set(handles.text31, 'String', sprintf('%s%s', handles.FilePath.s{4}, handles.FileName.s{4}));
        guidata(hObject, handles);

% Sample 5
function pushbutton15_Callback(hObject, eventdata, handles)
        [handles.FileName.s{5} handles.FilePath.s{5}] = uigetfile({'*.png'; '*.jpg'; '*.jpeg'; '*.tif'; '*.tiff'; '*.gif'; '*.bmp'}, 'File Selector',...
            '\\fs01\holuj$\Dokumente\RESULTS\3Omega\SL-TH');
        set(handles.text33, 'String', sprintf('%s%s', handles.FilePath.s{5}, handles.FileName.s{5}));
        guidata(hObject, handles);


% OK
function pushbutton9_Callback(hObject, eventdata, handles)
    guidata(hObject, handles);
    set(handles.uitable3, 'Data', []);
    
    k = 1;
        sample_path = {get(handles.text21, 'String'), get(handles.text24, 'String'),...
            get(handles.text32, 'String'), get(handles.text31, 'String'), get(handles.text33, 'String')};
        while ~isempty(sample_path{k})    
            sample_corr{k} = sample_path{k};
                if k < 5
                    k = k+1;
                else
                    break
                end
        end
        

    %% load data and evaluate it
    for i = 1:length(sample_corr)

             set(handles.text18, 'String', handles.FileName.s{i});
                photo = importdata(sample_corr{i});
                Image = rgb2gray(photo.cdata);
                    imshow(Image, 'Parent', handles.axes2)


                Edges = edge(Image); % detects edges in the grayscale image
                [row, column] = find(Edges);
                    axes(handles.axes1);
                    spy(Edges);
                    set(handles.axes1,'xtick',[],'ytick',[]);
                    

                % zaznaczanie punktow. Dwa pierwsze tworza prosta. Trzeci to punkt, ktorego
                % odleglosc jest liczona od prostej
                set(handles.text17, 'String', sprintf('Select 2 points to define a first line'))
                    [x, y] = ginput(2);
                    line(x, y, 'Color', 'r');

                % wspolczynniki kierunkowe prostej
                a = (y(1)-y(2))/(x(1)-x(2));
                b = y(1) - a*x(1);

                % prosta w postaci ogolnej
                A = a;
                B = -1;
                C = b;

                % zaznacz 5 punktow
                n_points = get(handles.edit12, 'String');
                set(handles.text17, 'String', ...
                    sprintf('Select %0.f points on the second line to determine the distance', str2num(get(handles.edit12, 'String'))))
                    
                    [Px, Py] = ginput(str2num(n_points));
                    line(Px, Py, 'Color', 'r');

                %odleglosc punktu od prostej
                for k=1:str2num(n_points)
                    d(k) = abs(A*Px(k) + B*Py(k) + C)/sqrt(A^2 + B^2);
                end

                ImSize = size(Image);
                if ImSize(1) == 480 && ImSize(2) == 640
                    d_mean(i) = round(mean(d)*100)/(100*120);
                elseif ImSize(1) == 576 && ImSize(2) == 720
                    d_mean(i) = round(mean(d)*100)/(100*118);
                end
                
%         end
    end

    for i=1:length(sample_corr)
        width(i) = d_mean(i);
    end

    set(handles.uitable3, 'Data', num2cell(width))


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
    % --------------------------------------------------------------------
    function ClearPathsNames_Callback(hObject, eventdata, handles)
        set(handles.text3, 'String', '');
        set(handles.text5, 'String', '');
        set(handles.edit1, 'String', '');
        set(handles.edit5, 'String', '');
        set(handles.edit7, 'String', '');
        set(handles.edit9, 'String', '');
        set(handles.edit2, 'String', '');
        set(handles.edit6, 'String', '');
        set(handles.edit8, 'String', '');
        set(handles.edit10, 'String', '');
        set(handles.edit11, 'String', '');
        set(handles.text21, 'String', '');
        set(handles.text24, 'String', '');
        set(handles.text32, 'String', '');
        set(handles.text31, 'String', '');
        set(handles.text33, 'String', '');
        set(handles.edit12, 'String', '');
        
    % --------------------------------------------------------------------
    function ConfFile_Callback(hObject, eventdata, handles)
        % --------------------------------------------------------------------
        function LoadConfFile_Callback(hObject, eventdata, handles)
        [ConfFileName ConfFilePath Index] = uigetfile({'*.xls; *.xlsx'}, 'File Selector');
        if Index == 0, return; end
        [num, txt, raw] = xlsread(sprintf('%s%s', ConfFilePath, ConfFileName));
            [num, txt, raw] = xlsread('ConfigurationFile.xlsx');
                set(handles.text3, 'String', txt(2,2)); % starting directory
                set(handles.text5, 'String', txt(2,2)); % starting directory
                set(handles.edit1, 'String', txt(3,2)); % set sample name
                set(handles.edit5, 'String', txt(3,2));
                set(handles.edit7, 'String', txt(3,2));
                set(handles.edit9, 'String', txt(3,2));
                set(handles.edit2, 'String', raw(4,2)); % set number of images
                set(handles.edit6, 'String', raw(4,2));
                set(handles.edit8, 'String', raw(4,2));
                set(handles.edit10, 'String', raw(4,2));
                set(handles.edit11, 'String', raw(5,2)); % set number of points to be selected
                
        % --------------------------------------------------------------------
        function GenerateTemplateConfFile_Callback(hObject, eventdata, handles)
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
    function EnterData_Callback(hObject, eventdata, handles)
        [h,figure] = gcbo;
        EnterData();
        close(figure);
    % --------------------------------------------------------------------
    function Evaluate_Callback(hObject, eventdata, handles)
        [h,figure] = gcbo;
        Dialog3w();
        close(figure);

% --------------------------------------------------------------------
function Layout_Callback(hObject, eventdata, handles)
    % --------------------------------------------------------------------
    function SingleSamples_Callback(hObject, eventdata, handles)
        set(handles.uipanel5, 'Visible', 'off');
        set(handles.uipanel19, 'Visible', 'on');

    % --------------------------------------------------------------------
    function SeriesOfSamples_Callback(hObject, eventdata, handles)
        set(handles.uipanel5, 'Visible', 'on');
        set(handles.uipanel19, 'Visible', 'off');

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
        
        
%------------


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)

    % Original position of controls
    uipanel19_org = [5, 259, 401, 341];
    uipanel5_org  = [5, 259, 401, 341];
    axes2_org     = [43, 9, 320, 240];
    axes1_org     = [420, 80, 640, 480];
    text17_org    = [505, 580, 450, 20];
    text18_org    = [646, 29, 168, 20];


    % Set units in pixels
    set(hObject, 'Units', 'pixels');
    % Original size of window
    Original_Size = [520 499 1081 610];
    % New size of window
    Figure_Size   = get(hObject, 'Position');

    set(hObject, 'Position', Figure_Size);

        if((Figure_Size(3) < Original_Size(3)) || (Figure_Size(4) < Original_Size(4)))
            Figure_Size = [Original_Size(1), Original_Size(2), Original_Size(3), Original_Size(4)];
        end
        set(handles.figure1, 'Position', Figure_Size);
    % Scale panel with graphs
    set(handles.axes1, 'Units', 'pixels');
    set(handles.axes1, 'Position', [(Figure_Size(3)-uipanel5_org(3)-axes1_org(3)*(Figure_Size(3)/Original_Size(3)))/2+uipanel5_org(3),...
        (Figure_Size(4)-axes1_org(4)*(Figure_Size(4)/Original_Size(4)))/2,...
        axes1_org(3)*(Figure_Size(3)/Original_Size(3)),...
        axes1_org(4)*(Figure_Size(4)/Original_Size(4))]);
    
    set(handles.uipanel5, 'Units', 'pixels');
    set(handles.uipanel5, 'Position', [5,...
        Figure_Size(4)-350,...
        uipanel5_org(3),...
        uipanel5_org(4)]);
    
    set(handles.uipanel19, 'Units', 'pixels');
    set(handles.uipanel19, 'Position', [5,...
        Figure_Size(4)-350,...
        uipanel19_org(3),...
        uipanel19_org(4)]);
    
    set(handles.axes2, 'Units', 'pixels');
    set(handles.axes2, 'Position', [10,...
        (Figure_Size(4)-axes2_org(4)*(Figure_Size(4)/Original_Size(4))-uipanel19_org(4))/2,...
        axes2_org(3)*(Figure_Size(3)/Original_Size(3)),...
        axes2_org(4)*(Figure_Size(4)/Original_Size(4))]);
    
    set(handles.text17, 'Units', 'pixels');
    set(handles.text17, 'Position', [(Figure_Size(3)-uipanel5_org(3)-axes1_org(3)*(Figure_Size(3)/Original_Size(3)))/2+uipanel5_org(3)+(axes1_org(3)*(Figure_Size(3)/Original_Size(3))-text17_org(3))/2,...
        (Figure_Size(4)-axes1_org(4)*(Figure_Size(4)/Original_Size(4)))/2+axes1_org(4)*(Figure_Size(4)/Original_Size(4))+10,...
        text17_org(3),...
        text17_org(4)]);
    
    set(handles.text18, 'Units', 'pixels');
    set(handles.text18, 'Position', [(Figure_Size(3)-uipanel5_org(3)-axes1_org(3)*(Figure_Size(3)/Original_Size(3)))/2+uipanel5_org(3)+(axes1_org(3)*(Figure_Size(3)/Original_Size(3))-text18_org(3))/2,...
        (Figure_Size(4)-axes1_org(4)*(Figure_Size(4)/Original_Size(4)))/2-40,...
        text18_org(3),...
        text18_org(4)]);
