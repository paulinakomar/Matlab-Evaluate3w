function ThermalConductivity_MgO = ThermalConductivity_MgO(Uw, R, dU3w_dln2w, dRdT, l, XlsFileName)

% function ThermalConductivity_MgO = ThermalConductivity_MgO(Uw, R, dU3w_dln2w, dRdT, l, XlsFileName)
%     Uw: Applied voltage to the heater line (with the frequency w). Output of the function PowerResistance.
%     R: The row of the heater resistances, calculated from the formula
%       U_w/I_w. Output of the function PowerResistance.
%     dU3w_dln2w: Derivative of the third harmonic of voltage vs ln2w.
%       Output of the function ThirdHarmonicOfVoltage.
%     dRdT: Derivative of the resistance versus the temperature. Output of the function dRdT.
%     l: length of the heater line (m)
%     XlsFileName: e.g. 'Sample_x_xls'
%     
% Function calculates the thermal conductivity of MgO substrate for each
% sample.

% v1
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de

L = size(Uw, 2);
k_sub = zeros(1,L);

for i = 1:length(Uw)
    k_sub(i) = -Uw(i)^3*dRdT(i)/(4*pi*l*R(i)^2*dU3w_dln2w(i));
end

SideLine = {'Thermal conductivity of the substrate'; 'k sub (W/mK)'};

Cela(1:2,1) = cellstr(SideLine);
Cela(2,2:L+1) = num2cell(k_sub);

	range = sprintf('A14:%s15', char(65+L));
    xlswrite(XlsFileName, Cela, range);