%% Exemplo para detec��o de linhas      
close all
clear all
clc

%Reads the image
imrgb = imread('borda.png');
imagesc(imrgb); %Scale data and display as image
colormap (gray); %Sets the current figure's colormap to MAP.
title('Imagem Original'); %Image Title

[y,x,z] = size(imrgb);

im =rgb2gray(imrgb);

%Kernels
%horizontal line kernel
hl   = [-1 -1 -1; 
         2  2  2; 
        -1 -1 -1]; 
    
 %vertical line kernel    
vl   = [-1 2 -1; 
        -1 2 -1; 
        -1 2 -1];
    
%clockwise line kernel    
cwl  = [-1 -1  2;
        -1  2 -1; 
         2 -1 -1]; 

%anticlockwise line kernel
acwl = [2 -1 -1;
       -1  2 -1; 
       -1 -1  2];

horizontal = zeros(y, x);
vertical = zeros(y, x);
clockwise = zeros(y, x);
anticlockwise = zeros(y, x);

for j = 2:y-1
    for i = 2:x-1
        horizontal(j,i) = uint8( hl(1,1) * double(im(j-1, i-1, 1)) + hl(1,2) * double(im(j-1, i, 1)) + hl(1,3) * double(im(j-1, i+1, 1)) + ...
                                 hl(2,1) * double(im(j, i-1  , 1)) + hl(2,2) * double(im(j, i  , 1)) + hl(2,3) * double(im(j, i+1  , 1))+ ...
                                 hl(3,1) * double(im(j+1, i-1, 1)) + hl(3,2) * double(im(j+1, i, 1)) + hl(3,3) * double(im(j+1, i+1, 1)));
                        
        vertical(j,i) = uint8( vl(1,1) * double(im(j-1, i-1, 1)) + vl(1,2) * double(im(j-1, i, 1)) + vl(1,3) * double(im(j-1, i+1, 1)) + ...
                               vl(2,1) * double(im(j, i-1  , 1)) + vl(2,2) * double(im(j, i  , 1)) + vl(2,3) * double(im(j, i+1  , 1))+ ...
                               vl(3,1) * double(im(j+1, i-1, 1)) + vl(3,2) * double(im(j+1, i, 1)) + vl(3,3) * double(im(j+1, i+1, 1)));
                           
        clockwise(j,i) = uint8( cwl(1,1) * double(im(j-1, i-1, 1)) + cwl(1,2) * double(im(j-1, i, 1)) + cwl(1,3) * double(im(j-1, i+1, 1)) + ...
                                cwl(2,1) * double(im(j, i-1  , 1)) + cwl(2,2) * double(im(j, i  , 1)) + cwl(2,3) * double(im(j, i+1  , 1))+ ...
                                cwl(3,1) * double(im(j+1, i-1, 1)) + cwl(3,2) * double(im(j+1, i, 1)) + cwl(3,3) * double(im(j+1, i+1, 1)));
        
        anticlockwise(j,i) = uint8( acwl(1,1) * double(im(j-1, i-1, 1)) + acwl(1,2) * double(im(j-1, i, 1)) + acwl(1,3) * double(im(j-1, i+1, 1)) + ...
                                    acwl(2,1) * double(im(j, i-1  , 1)) + acwl(2,2) * double(im(j, i  , 1)) + acwl(2,3) * double(im(j, i+1  , 1))+ ...
                                    acwl(3,1) * double(im(j+1, i-1, 1)) + acwl(3,2) * double(im(j+1, i, 1)) + acwl(3,3) * double(im(j+1, i+1, 1)));
                           
    end
end

figure;
imagesc(horizontal); 
colormap (gray); 
title('Linhas Horizontais');

figure;
imagesc(vertical); 
colormap (gray);
title('Linhas Verticais');

figure;
imagesc(clockwise); 
colormap (gray);
title('Linhas em sentido horario');

figure;
imagesc(anticlockwise); 
colormap (gray); 
title('Linhas em sentido anti-horario');