function [R, U_w, P, Cela] = PowerResistance(filename, XlsFileName)

% function [R, U_w, P] = PowerResistance(filename, XlsFileName)
%   filename: e.g. 'data.dat' - WITH EXTENTION!
%   XlsFileName: e.g. 'Sample_x_xls'
% 
%   R: the row of the heater resistances, calculated from the formula U_w/I_w
%   Uw: measured value of the voltage drop along the heater for each sample
%   P: power applied to the heater line. Calculated from the formula U_w*I_w
% 
% Function calculates the resistance of the heater stripe and power applied
% to it during the 3w measurement. It is done by usage of the measured values 
% of voltage drop along the heater (Uw) and the current flowing in the
% circiut (Iw).

% Last modified v2.0 Feb-2014
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de

%% declaration of variables
filename = importdata(filename);
L = size(filename.data, 2);
R = zeros(1,L);
P = zeros(1,L);

%% Load data
Uappl = filename.data(1,:);
U_w = filename.data(2,:);
I_w = filename.data(3,:)/1000;

%% Calculate power and resistance
R = U_w./I_w;
P = U_w.*I_w;
    
%% Write P and R to the file
sideLine = {'Applied voltage and curent'; 'U applied (V)'; 'Uw (V)'; 'Iw (A)'; 'R heater (Ohm)'; 'P (W)'};

Cela(1:6,1) = cellstr(sideLine);
Cela(2,2:L+1) = num2cell(Uappl);
Cela(3,2:L+1) = num2cell(U_w);
Cela(4,2:L+1) = num2cell(I_w);
Cela(5,2:L+1) = num2cell(R);
Cela(6,2:L+1) = num2cell(P);
    
    range = sprintf('A5:%s%0.f', char(L+65), 10);
    xlswrite(XlsFileName, Cela, range);
