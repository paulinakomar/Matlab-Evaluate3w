function [U3w_real, slope, ln2w] = ThirdHarmonicOfVoltage(filename, PdfFileName, XlsFileName, n, save_pdf, save_png, resolution)

% function [U3w_real, slope, ln2w] = ThirdHarmonicOfVoltage(filename, PdfFileName, XlsFileName, n)
%     filename: e.g. 'data.dat' - WITH EXTENTION!
%     PdfFileName: e.g. 'Sample_x_pdf'
%     XlsFileName: e.g. 'Sample_x_xls'
%     n: Linear fit to the first n points of dU3w/dln(2w)
% 
%     U3w_real: The real voltage drop along the heater line: U3w(measured
%       in µV)*2*1E-6=U3w_real(V)
%     slope: dU3w_dln2w
%     ln2w: Calculated logarithm of the frequencies used during the measurement. 
% 
% Function calculates the dU3w/dln(2w) by fitting the linear function to
% the first n points of the data. This derivative (slope) is used to
% calculate the thermal conductivity of MgO substrate.

% v1
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de

%% declaration of variables
filename = importdata(filename);
L = size(filename.data, 2)-1;
p = zeros(1,2);
slope = zeros(1,L);
intercept = zeros(1,L);

%% import data
f = filename.data(:,1);
    ln2w = log(2*2*pi*f);
    ln2w_fit = ln2w(1:n,:);

U3w = filename.data(:,2:(L+1));
    U3w_real = U3w*2*1E-6;
    U3w_real_fit = U3w_real(1:n,:);
    
%% Calculation of dU3w/d(ln(2w))
figure1 = figure('PaperOrientation', 'landscape', 'PaperType', 'A4');

for i=1:L
    p = polyfit(ln2w_fit, U3w_real_fit(:,i), 1);
    slope(i) = p(1);
    intercept(i) = p(2);
    
    hold on;
    subplot(2,2,i);
        plot(ln2w, U3w_real(:,i), 'o', ln2w, polyval(p, ln2w));
        title(filename.textdata(i+1));
        slope1 = sprintf('slope (%0.f points) = %f', n, p(1));
        legend(slope1);
        xlabel('ln(2{\omega})');
        ylabel('U_{3{\omega}} (V)');
end

hold off;

%% Write the result to excel file
Cela(1:3, 1) = cellstr({'Fit of U3w vs ln(2w)', 'intercept', 'slope'});
Cela(2, 2:L+1) = num2cell(intercept);
Cela(3, 2:L+1) = num2cell(slope);
        
        range = sprintf('A11:%s13', char(65+L));
        xlswrite(XlsFileName, Cela, range);

%% Save plot to the file
if save_pdf == 1
    set(figure1, 'PaperPosition', [-0.5 -0.25 30 20]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
    saveas(figure1, PdfFileName, 'pdf');
else
end
 
if save_png == 1
     set(figure1, 'PaperPosition', [-0.5 -0.25 30 20]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
     print(figure1, '-dpng', PdfFileName, sprintf('-r%2.0f', resolution));
else
end