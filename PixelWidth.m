function [width, Image, Edges, command] = PixelWidth(folder, name, number)

% v1
% Created by Paulina Holuj
% paulina.holuj@gmail.com, holuj@uni-mainz.de
%%
for i = 1:length(name)
    
    counter = [1 2 3];
    for j = 1:number(i)
        
      if length(folder) > 1 
         if i < 3
             folder_pom = cellstr(folder(1));
         else
             folder_pom = cellstr(folder(2));
         end
      end

        sprintf('%s\\%s_0%0.f.png', folder_pom{1}, name{i}, counter(j))
        photo = importdata(sprintf('%s\\%s_0%0.f.png', folder_pom{1}, name{i}, counter(j)));
            Image = rgb2gray(photo);
                figure();
                imshow(Image);
                hold on;

            Edges = edge(Image); %detects edges in the grayscale image
            [row, column] = find(Edges);
                figure();
                spy(Edges);

            % zaznaczanie punktow. Dwa pierwsze tworza prosta. Trzeci to punkt, ktorego
            % odleglosc jest liczona od prostej
            command = sprintf('Select 2 points to define a first line');
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
            command = sprintf('Select 5 points on the second line to determine the distance');
                [Px, Py] = ginput(5);
                line(Px, Py, 'Color', 'r');

            %odleglosc punktu od prostej
            for k=1:5
                d(k) = abs(A*Px(k) + B*Py(k) + C)/sqrt(A^2 + B^2);
            end

            d_mean(i,j) = round(mean(d)*100)/100;
            close all
            
    end
end

for i=1:length(name)
    width(i) = round(mean(d_mean(i,:))*100)/100;
end

