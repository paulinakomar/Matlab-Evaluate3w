function [k_max, k_min] = ThermalConductivity(XlsFileName, Power, DT_Average, thickness, b, l)

% function ThermalConductivity = ThermalConductivity(XlsFileName, Power, DT_Average, thickness, b, l)
%   XlsFileName: e.g. 'Sample_x_xls'
%   Power: power applied to the heater line. Calculated from the formula
%       U_w*I_w. Output from the function PowerResistance
%   DT_Average: average temperature oscillations. Output from the function
%       TemperatureOscillations
%   thickness: thickness of the layer after subtraction of the reference
%       sample (m)
%   b: half width of the heater line (m)
%   l: length of the heater line (m)
% 
% Function calculates the thermal conductivity of superlattice. To evaluate
% the min and max values of thermal conductivity, maximal and minimal
% difference between the thermal oscillations of thick and thin samples 
% is taken into account.

% Last modified v2.0 Feb-2014
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de

if isequaln(Power(1),NaN)
    P = round(Power(2)*1000)/1000;
else
    P = round(Power(1)*1000)/1000;
end

DT_min = min(DT_Average);
DT_max = max(DT_Average);

    k_max = P*thickness/(2*b*l*DT_min);
    k_min = P*thickness/(2*b*l*DT_max);

TopLine =  {'Thermal conductivity of the film' 'k min (W/mK)' 'k max (W/mK)'};

Cela(1,1:3) = cellstr(TopLine);
Cela(2,2) = num2cell(k_min);
Cela(2,3) = num2cell(k_max);
    
        xlswrite(XlsFileName, Cela, 'G1:I2');
