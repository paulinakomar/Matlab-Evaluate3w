function [DTaverage] = TemperatureOscillations(filename, PdfFileName, XlsFileName, R, dRdT, Uw, U3w, ln2w, n, save_pdf, save_png, resolution)

% function [DTaverage] = TemperatureOscillations(filename, PdfFileName, XlsFileName, R, dRdT, Uw, U3w, ln2w, n)
%   DTaverage:
%   
%   filename: e.g. 'data.dat' - WITH EXTENTION!
%   PdfFileName: e.g. 'Sample_x_pdf'
%   XlsFileName: e.g. 'Sample_x_xls'
%
%   R: The row of the heater resistances, calculated from the formula
%       U_w/I_w. Output of the function PowerResistance.
%   dRdT: Derivative of the resistance versus the temperature. Output of the function dRdT.
%   Uw: Applied voltage to the heater line (with the frequency w). Output of the function PowerResistance.
%   U3w: Measured third harmonic of the viltage along the heater line. Output of the function ThirdHarmonicOfVoltage.
%   ln2w: Calculated logarithm of the frequencies used during the measurement. Output of the function ThirdHarmonicOfVoltage.
%   n: Number of points taken to calculate the average temperature
%       oscillations.
%
% Function calculates the temperature oscillations, based on given values
% of R, Uw, U3w and dR/dT. 
% Due to the different real widths of the heaters, this quantity must be 
% recalculated as all of lines would have exactly the same width (120
% pixels). This is saved as DT_corrected.
% As a further step, function calculates the difference in the temperature
% oscillations between two thick samples (columns 1 ans 2) and two
% reference samples (columns 3 and 4). Subsequently it calculates the
% average from the first n points and plots it on the graph in the middle
% of data taken for the calculations.

% v1
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de

filename = importdata(filename);
L = size(filename.data, 2);
PixelWidth = filename.data(4,:);

for i=1:L
    DT(:,i) = (2*R(i)/(Uw(i)*dRdT(i)))*U3w(:,i);
    DT_corrected(:,i) = DT(:,i)*PixelWidth(i)/120;
end


%% Plot temperature oscillations
hold off;

figure1 = figure('PaperOrientation', 'portrait', 'PaperType', 'A4');
subplot(2,1,1);
    plot(ln2w, DT_corrected, '.', 'MarkerSize', 15);
            title('Corrected temperature oscillations');
            legend(filename.textdata(1,2:(L+1)));
            xlabel('ln(2{\omega})');
            ylabel('{\Delta}T (K)');
            grid on;
         
    
%% Calculate the difference of T oscillations between thick sample and reference one

if L == 4
    Difference(:,1) = DT_corrected(:,1) - DT_corrected(:,3);
    Difference(:,2) = DT_corrected(:,1) - DT_corrected(:,4);
    Difference(:,3) = DT_corrected(:,2) - DT_corrected(:,3);
    Difference(:,4) = DT_corrected(:,2) - DT_corrected(:,4);
    koniec = 4;
    
    for i=1:4
        DTaverage(i) = mean(Difference(1:n,i));
    end
                
elseif L == 3
    Difference(:,1) = DT_corrected(:,1) - DT_corrected(:,3);
    Difference(:,2) = DT_corrected(:,2) - DT_corrected(:,3);
    koniec = 2;
    
    for i=1:2
        DTaverage(i) = mean(Difference(1:n,i));
    end
        
else
    Difference(:,1) = DT_corrected(:,1) - DT_corrected(:,2);
    DTaverage = mean(Difference(1:n,1));
    koniec = 1;
end


subplot(2,1,2);
    hold on;
    plot(ln2w, Difference, '.', 'MarkerSize', 15);
    plot(ln2w(round(n/2)), DTaverage, '*');     
        title('Difference of T oscillations between thick and reference samples');
        xlabel('ln(2{\omega})');
        ylabel('{\Delta}({\Delta}T) (K)');
        grid on;
        box on;

        
%% Save temperature oscillations and the difference in DT to the excel file
Cela(1,1) = cellstr('Corrected temperature oscillations (K)');
    endValue = length(DT_corrected);
%     endValue = long;
Cela(2:endValue+1,2:L+1) = num2cell(DT_corrected);

Cela(1,6) = cellstr('Difference in the temperature oscillations (K)');
Cela(2:endValue+1,6:5+koniec) = num2cell(Difference);
Cela(endValue+2,6) = cellstr('Average temperature oscillations');
Cela(endValue+3,6:5+koniec) = num2cell(DTaverage);

     range = sprintf('A16:%s%0.f', char(65+5+koniec-1), endValue+2+16);
     xlswrite(XlsFileName, Cela, range);
 
%% Save the plot of temperature oscillations
if save_pdf == 1
    set(figure1, 'PaperPosition', [-0.5 -0.25 22 30]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
    saveas(figure1, PdfFileName, 'pdf');
else
end
 
if save_png == 1
     set(figure1, 'PaperPosition', [-0.5 -0.25 22 30]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
     print(figure1, '-dpng', PdfFileName, sprintf('-r%2.0f', resolution));
else
end

