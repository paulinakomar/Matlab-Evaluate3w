close all, clear all, clc

tic
PathName = '\\fs01\holuj$\Dokumente\Results\3Omega\SL-TH\SL-TH_1-4';
name = 'SL-TH_1-4';
power = '18mW';

%% Import data files 
dRdT_rawData = importdata(sprintf('%s\\%s_dRdT.dat', PathName, name));                 % .dat file with data as described below
    % 8 column file: 
        % - 1st column - resistance measured for Pt100 (Ohm)
        % - 2nd column - resistance measured for the heater (Ohm) 
        % - 1st row - the name of the sample - it will be displayed on the graphs
        % These two columns repeat for 4 samples. Below an example.

        % VERY IMPORTANT!!! columns 1-4 - thick samples, 
                          % columns 5-8 - reference samples

            % PT100 R (Ohm)	V21_13	PT100 R (Ohm)	V21_14	PT100 R (Ohm)	V26_21	PT100 R (Ohm)	V26_22
            % 107.395       59.905	107.445         58.12	107.465         46.92	107.535         47.59
            % 109.75        60.46	109.82          58.685	109.755         47.465	109.765         48.115
            % 111.155       60.785	111.275         59.035	111.14          47.79	111.145         48.44
            % 112.19        61.02	112.355         59.305	112.18          48.04	112.2           48.685

VoltageCurrentPixel = importdata(sprintf('%s\\%s_%s_VIP.dat', PathName, name, power));   % .dat file with data as described below
    % 5 column x 5 row file:
        % - first row and column - labels
        % - columns 2-5 - respective data
        % - 2nd row - applied voltage (V) - one that is set by lock-in amplifier
        % - 3rd row - first harmonic of voltage measured across the heater line by voltmeter (V)
        % - 4th row - current flowing through the heater line (mA)!!!
        % - 5th row - width of the heater line measured on the images taken
            % with the optical microscope (to recalculate the real temperature oscillations)
            
            % VERY IMPORTANT!!! columns 2&3 - thick samples, 
                              % columns 4&5 - reference samples

        % Below an example.

            % Quantity      V21_13	V21_14	V26_21	V26_22
            % U app (V)     4.35	4.32	4.10	4.02
            % Uw (V)        1.05	1.04	0.93	0.94
            % Iw (mA)       17.15	17.40	19.34	19.22
            % pixel width	120     119     109     107


RawData_3w = importdata(sprintf('%s\\%s_%s_3wData.dat', PathName, name, power));
    % 5 column file:
        % - 1st column: frequency (Hz) at which the third harmonic of voltage drop was measured
        % - columns 2-5 - third harmonic of the voltage drop along the heater line, measured with the lock-in amplifier
        % - 1st row: labels (the name of the sample - it will be displayed on the graphs)

            % VERY IMPORTANT!!! columns 2&3 - thick samples, 
                              % columns 4&5 - reference samples

        % Below an example.

            % f (Hz)  V21_13  V21_14  V26_21  V26_22 (µV)!!!
            % 100     452     460     310     303
            % 200     436     444     293     287
            % 350     425     432     280     273
            % 500     416     423     270     265
            % 750     407     414     262     256
            % 1000    401     408     254     248
            % 1500    391     398     244     238
            % 2000	  385     392     237     232
            % 3000	  375     381 	  227     222
            % 5000	  361     367     215     210
            % 10000	  337     345     197     191
            % 20000	  306     316     180     177
            % 30000	  283     294     176     172


%% Set the names of output files
XlsFileName = sprintf('%s_%s_3w_results.xlsx', name, power);                         % Filename of the excel file where the results of all calculations will be written
dRdT_fitPlotsPdf = sprintf('%s_%s_dRdT_outputFit', name, power);                % Filename of the .pdf file, where the linear fit of R Pt100 vs R of the heater will be saved
dU3w_dln2w_fitPlotsPdf = sprintf('%s_%s_dU3w_dln2w_outputFit', name, power);    % Filename of the .pdf file, where the linear fit of U3w vs ln(2w) will be saved (for 8 first points)
TempOscillations_pdf = sprintf('%s_%s_TemperatureOscillations', name, power);   % Filename of the .pdf file, where the plot of temperature oscillations will be saved 
                                                    % (together with the plot of the difference in the temperature oscillations between thick and reference
                                                    % samples)

%% Set parameters
l = 0.001;          % length of the heater line (m)
b = 1e-5;           % half width of the heater line (m)
thickness = 8.65e-7;   % difference in the thickness between thick and reference samples (m) - thickness 
                    % of the superlattice that is an object of the measurement
n = 10;             % to how many points should be fitted a linear function (dU3w/dln(2w))

%% Calculate dRdT
[dRdT] = dRdT(dRdT_rawData, dRdT_fitPlotsPdf, XlsFileName);
    
%% Calculate resistance of the heater and P applied to it
[R, Uw, Power, Cela] = PowerResistance(VoltageCurrentPixel, XlsFileName);
   
%% Calculate the real U3w
[U3w, dU3w_dln2w, ln2w] = ThirdHarmonicOfVoltage(RawData_3w, dU3w_dln2w_fitPlotsPdf, XlsFileName, n);
    
%% Thermal conductivity of the substrate
ThermalConductivity_MgO(Uw, R, dU3w_dln2w, dRdT, l, XlsFileName);

%% Calculate the temperature oscillations
[DT_Average] = TemperatureOscillations(VoltageCurrentPixel, TempOscillations_pdf, XlsFileName, R, dRdT, Uw, U3w, ln2w, n);
    
%% Thermal conductivity of the film
ThermalConductivity(XlsFileName, Power, DT_Average, thickness, b, l);

toc
