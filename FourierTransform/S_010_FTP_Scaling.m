% Fourier transform properties:  scaled function
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
%      SCALING PROPERTY
%====================================================================
% Scaling the rectangle

repetir = 'y';
while (repetir == 'y' || repetir == 'Y')
    
    Fac = input('Enter the scaling factor : ')
    
    
    % Dimensión del rectángulo 
    SX = int32(SizeX * Fac);
    SY = int32(SizeY * Fac);

    RE = zeros(DimY, DimX);
    RE(DimY/2 - SY/2:DimY/2 + SY/2, DimX/2 - SX/2:DimX/2 + SX/2) = 1;


    figure(2)
    subplot(2,2,1)
    colormap(gray);
    imagesc(RE);
    axis equal tight
    Titulo = sprintf('Scaled Rectangle Function.  Scaling %f', Fac);
    title(Titulo)

    TFR = fft2shift(RE);

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
    
    repetir = input('Anoder scale factor? (y/n): ','s')
end
