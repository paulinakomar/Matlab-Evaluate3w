function [NewName] = dRdT_VtoR(inputDataPath)

% Last modified v2.0 Feb-2014
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de

inputData = importdata(inputDataPath);
data = inputData.data;
header = inputData.textdata;

sizeOfData = size(inputData.data);
    rows = sizeOfData(1);
    columns = sizeOfData(2);

    
for i = 1:columns
    for j = 1:rows/2
        AuxiliaryVariable = [inputData.data(2*j-1,i) inputData.data(2*j,i)];
        averageU(j,i) = mean(AuxiliaryVariable);
    end
end

I = 1E-4;
R = averageU*1E-3/I;

Result(1, 1:columns) = header;
Result(2:rows/2+1, 1:columns) = num2cell(R);

    NewName = strrep(inputDataPath, '_measured.dat', '.dat');
    cell2csv(NewName, Result, '\t');