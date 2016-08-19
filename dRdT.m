function [dRdT_val] = dRdT(filename, PdfFileName, XlsFileName, save_pdf, save_png, resolution)

% function [dRdT] = dRdT(filename, PdfFileName, XlsFileName)
%   filename: e.g. 'data.dat' - WITH EXTENTION!
%   PdfFileName: e.g. 'Sample_x_pdf'
%   XlsFileName: e.g. 'Sample_x_xls'
% 
% Function calculates dR/dT of the heater line. In the 
% first step it fits a linear function to the plots of R of the heater vs R Pt100, 
% measured at 4 different temperatures. Next, the slope of the fitted curve 
% is multiplied by the well known value of dR/dT for platinum (RvsT_Pt =
% 0.390808). In this way it is calculated the value of dR/dT for each
% heater stipe.

% Last modified v2.0 Feb-2014
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de

%% declaration of variables
filename = importdata(filename);
L = size(filename.data, 2)/2;
x = zeros(L,1);
y = zeros(L,1);
p = zeros(1,2);
slope = zeros(1,L);
intercept = zeros(1,L);
dRdT_val = zeros(1,L);

%% load data, fit and plot it
figure1 = figure('PaperOrientation', 'landscape', 'PaperType', 'A4');

for i=1:L
    
x = filename.data(:,2*i-1);
y = filename.data(:,2*i);
name(i) = filename.textdata(2*i);
    p = polyfit(x, y, 1);
        slope(i) = p(1);
        intercept(i) = p(2);
    
subplot(2,2,i);
    plot(x, y, 'o', x, polyval(p, x));
    title(name(i));
    slope1 = sprintf('slope = %f', p(1));
    legend(slope1);
    xlabel('R Pt100 ({\Omega})');
    ylabel('R heater ({\Omega})');

end
    
%% Save fitting parameters
RvsT_Pt_old = 0.390808;
dRdT_val = RvsT_Pt_old*slope;

    
sideLine = {'Fitting parameters'; 'intercept (dR/dT)'; 'slope (dR/dT)'; 'dR/dT (Ohm/K)'};
    
%Save to xml file
Cela(1:4,1) = cellstr(sideLine);
Cela(1,2:L+1) = cellstr(name);
Cela(2,2:L+1) = num2cell(intercept);
Cela(3,2:L+1) = num2cell(slope);
Cela(4,2:L+1) = num2cell(dRdT_val);

    range = sprintf('A1:%s4', char(65+L));
    xlswrite(XlsFileName, Cela, range);
    
    
%% Save fit
if save_pdf == 1
    set(figure1, 'PaperPosition', [-0.5 -0.25 30 20]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
    saveas(figure1, PdfFileName, 'pdf');
end
 
if save_png == 1
     set(figure1, 'PaperPosition', [-0.5 -0.25 30 20]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
     print(figure1, '-dpng', PdfFileName, sprintf('-r%2.0f', resolution));
end
    