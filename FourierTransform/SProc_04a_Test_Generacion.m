%Script Test de generacion de funciones
clear all

% Dimensión de la matriz
DimX = 256;
DimY = 256;

% Función rectángulo
SizeX = 16;
SizeY = 32;
R = rect(DimX, DimY, SizeX, SizeY);

figure(1)
colormap(gray);
axis equal
%image(R);
imagesc(R);
title('función rectángulo')


% Función peine 2D
PeriodX = 32;
PeriodY = 64;
F = Peine2D(DimX, DimY, PeriodX, PeriodY);

figure(2)
colormap(gray);
%image(F);
imagesc(F);
title('función Peine')

% Desplazamiento circular de una matriz
Fs = circshift(F,[32 -3]);

figure(3)
colormap(gray);
imagesc(Fs);
title('función Peine desplazada')

% Convolucion de la función peine con la función rectángulo
C = Convolucion(Fs, R, 'r');

figure(4)
colormap(gray);
imagesc(C);
title('convolución de la función Peine desplazada con el Rectángulo')

% Función triángulo
figure(5) 
T = Triangulo(DimX, DimY, SizeX);
colormap(gray);
imagesc(T);
title('función Triángulo')

% Autoconvolución de la función triángulo
C = Convolucion(T, T, 'r');

figure(6)
colormap(gray);
imagesc(C);
title('Autoconvolución de la función Triángulo')


% Autocorrelación de la función triángulo
C = Correlacion(T, T, 'r');

figure(7)
colormap(gray);
imagesc(C);
title('Autocorrelación de la función Triángulo')


% Función Gausiana
figure(8) 
Ancho = 64;
L = Gausiana(DimX, DimY, Ancho);
colormap(gray);
imagesc(L);
title('función Gausiana')

% TF de la Función Gausiana
figure(9) 
TFL = fft2shift(L);
colormap(gray);
imagesc(abs(TFL));
title('TF de la función Gausiana')


% Función Suma de senos
figure(10) 
PeriodoX = 64;
PeriodoY = 16;
Ax = 1;
Ay = 1;
L = SumaSenos(DimX, DimY, PeriodoX, PeriodoY, Ax, Ay);
colormap(gray);
imagesc(L);
title('función Suma de senos')

% TF de la Función Suma de senos
figure(11) 
TFL = fft2shift(L);
colormap(gray);
imagesc(abs(TFL));
title('TF de la función Suma de senos')


% Función Suma de senos
figure(12) 
axis equal
Periodo  = 32;
Tilt     = 45;

L = TiltedSin(DimX, DimY, Periodo, Tilt);
colormap(gray);
imagesc(L);
title('función Suma de senos')

% TF de la Función Suma de senos
figure(13) 
TFL = fft2shift(L);
colormap(gray);
imagesc(abs(TFL));
title('TF de la función Suma de senos')
