% Fourier transform properties:  shifted function
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

clc;    %Clear command window.

% Borrado de todas las variables de la memoria
clear all   %Clear variables and functions from memory

format compact


% Rectangle Function
% Matrix size
DimX = 256;
DimY = 256;
 
% Rectangle Size
SizeX = 16;
SizeY = 32;

R = zeros(DimY, DimX);
R(DimY/2 - SizeY/2:DimY/2 + SizeY/2, DimX/2 - SizeX/2:DimX/2 + SizeX/2) = 1;

figure(1)
subplot(2,2,1)
colormap(gray);
imagesc(R);
axis equal tight
title('rectangle function')


TFR = fft2shift(R);

Fase = angle(TFR);
subplot(2,2,2)
colormap(gray);
imagesc(Fase);
axis equal tight
title('Phase of the rectangle FT')

Modulo = abs(TFR);
subplot(2,2,3)
colormap(gray);
imagesc(Modulo);
axis equal tight
title('Modulus of the rectangle FT')

subplot(2,2,4)
colormap(gray);
imagesc(log10(1+Modulo));
axis equal tight
title('log10(1+Modulus) of the rectangle FT')



%====================================================================
%      SHIFT PROPERTY
%====================================================================
% Shifting the rectangle

repetir = 'y';
while (repetir == 'y' || repetir == 'Y')
    shiftsize = input('Please, give the shift of the rectangle as a vector. [y, x]: ')
    RS = circshift(R,shiftsize);


    figure(2)
    subplot(2,2,1)
    colormap(gray);
    imagesc(RS);
    axis equal tight
    Titulo = sprintf('Shifted Rectangle Function.  Shift=[%d,%d]', shiftsize);
    title(Titulo)

    TFR = fft2shift(RS);

    Fase = angle(TFR);
    subplot(2,2,2)
    colormap(gray);
    imagesc(Fase);
    axis equal tight
    title('Phase of the rectangle FT')

    Modulo = abs(TFR);
    subplot(2,2,3)
    colormap(gray);
    imagesc(Modulo);
    axis equal tight
    title('Modulus of the rectangle FT')

    subplot(2,2,4)
    colormap(gray);
    imagesc(log10(1+Modulo));
    axis equal tight
    title('log10(1+Modulus) of the rectangle FT')
    
    repetir = input('Anoder shift? (y/n): ','s')
end
