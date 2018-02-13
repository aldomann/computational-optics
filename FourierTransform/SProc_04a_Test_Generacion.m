%Script Test de generacion de funciones
clear all

% Dimensi�n de la matriz
DimX = 256;
DimY = 256;

% Funci�n rect�ngulo
SizeX = 16;
SizeY = 32;
R = rect(DimX, DimY, SizeX, SizeY);

figure(1)
colormap(gray);
axis equal
%image(R);
imagesc(R);
title('funci�n rect�ngulo')


% Funci�n peine 2D
PeriodX = 32;
PeriodY = 64;
F = Peine2D(DimX, DimY, PeriodX, PeriodY);

figure(2)
colormap(gray);
%image(F);
imagesc(F);
title('funci�n Peine')

% Desplazamiento circular de una matriz
Fs = circshift(F,[32 -3]);

figure(3)
colormap(gray);
imagesc(Fs);
title('funci�n Peine desplazada')

% Convolucion de la funci�n peine con la funci�n rect�ngulo
C = Convolucion(Fs, R, 'r');

figure(4)
colormap(gray);
imagesc(C);
title('convoluci�n de la funci�n Peine desplazada con el Rect�ngulo')

% Funci�n tri�ngulo
figure(5) 
T = Triangulo(DimX, DimY, SizeX);
colormap(gray);
imagesc(T);
title('funci�n Tri�ngulo')

% Autoconvoluci�n de la funci�n tri�ngulo
C = Convolucion(T, T, 'r');

figure(6)
colormap(gray);
imagesc(C);
title('Autoconvoluci�n de la funci�n Tri�ngulo')


% Autocorrelaci�n de la funci�n tri�ngulo
C = Correlacion(T, T, 'r');

figure(7)
colormap(gray);
imagesc(C);
title('Autocorrelaci�n de la funci�n Tri�ngulo')


% Funci�n Gausiana
figure(8) 
Ancho = 64;
L = Gausiana(DimX, DimY, Ancho);
colormap(gray);
imagesc(L);
title('funci�n Gausiana')

% TF de la Funci�n Gausiana
figure(9) 
TFL = fft2shift(L);
colormap(gray);
imagesc(abs(TFL));
title('TF de la funci�n Gausiana')


% Funci�n Suma de senos
figure(10) 
PeriodoX = 64;
PeriodoY = 16;
Ax = 1;
Ay = 1;
L = SumaSenos(DimX, DimY, PeriodoX, PeriodoY, Ax, Ay);
colormap(gray);
imagesc(L);
title('funci�n Suma de senos')

% TF de la Funci�n Suma de senos
figure(11) 
TFL = fft2shift(L);
colormap(gray);
imagesc(abs(TFL));
title('TF de la funci�n Suma de senos')


% Funci�n Suma de senos
figure(12) 
axis equal
Periodo  = 32;
Tilt     = 45;

L = TiltedSin(DimX, DimY, Periodo, Tilt);
colormap(gray);
imagesc(L);
title('funci�n Suma de senos')

% TF de la Funci�n Suma de senos
figure(13) 
TFL = fft2shift(L);
colormap(gray);
imagesc(abs(TFL));
title('TF de la funci�n Suma de senos')
