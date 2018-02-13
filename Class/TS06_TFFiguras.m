%% Transformada de Fourier de diferentes funciones
% Borrado de todas las variables de la memoria
clear all

%% Función rectángulo
% Dimensión de la matriz
DimX = 256;
DimY = 256;

% Dimensión del rectángulo
SizeX = 16;
SizeY = 32;

R = Rectangle(DimY, DimX, SizeY, SizeX);

figure
subplot(2,2,1)
	colormap(gray);
	imagesc(R);
	axis equal tight
	title('función rectángulo')

TFR = fft2shift(R);

Fase = angle(TFR);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF del rectángulo')

Modulo = abs(TFR);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF del rectángulo')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('log10(1+Módulo) de la TF del rectángulo')
	
%% Función círculo
% Dimensión de la matriz
Dim = 256;

% Radio del círculo
Rad = 16;

R = CircularAperture(Dim, Rad);

figure
subplot(2,2,1)
	colormap(gray);
	imagesc(R);
	axis equal tight
	title('función círculo')

TFR = fft2shift(R);

Fase = angle(TFR);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF del círculo')

Modulo = abs(TFR);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF del círculo')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('log10(1+Módulo) de la TF del círculo')
	
%% Función triángulo
% Dimensión de la matriz
Dim = 256;

% lado
Size = 16;

R = Triangle(Dim, Dim, Size);

figure
subplot(2,2,1)
	colormap(gray);
	imagesc(R);
	axis equal tight
	title('función triángulo')

TFR = fft2shift(R);

Fase = angle(TFR);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF del triángulo')

Modulo = abs(TFR);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF del triángulo')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('log10(1+Módulo) de la TF del triángulo')
	
%% Función Gaussiana
% Dimensión de la matriz
Dim = 256;

% ancho
Size = 16;

R = Gaussian(Dim, Dim, Size);

figure
subplot(2,2,1)
	colormap(gray);
	imagesc(R);
	axis equal tight
	title('función Gaussiana')

TFR = fft2shift(R);

Fase = angle(TFR);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF del Gaussiana')

Modulo = abs(TFR);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF del Gaussiana')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('log10(1+Módulo) de la TF del Gaussiana')
	
%% Delta
% Dimensión de la matriz
DimX = 256;
DimY = 256;

R = Delta(DimY, DimX);

figure
subplot(2,2,1)
	colormap(gray);
	imagesc(R);
	axis equal tight
	title('Delta')

TFR = fft2shift(R);

Fase = angle(TFR);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF Delta')

Modulo = abs(TFR);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF Delta')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('log10(1+Módulo) de la TF Delta')
	
%% Delta desplazada
% Dimensión de la matriz
Dim = 256;

d = 16;

R = circshift(Delta(DimY, DimX), [d,d]);

figure
subplot(2,2,1)
	colormap(gray);
	imagesc(R);
	axis equal tight
	title('Delta')

TFR = fft2shift(R);

Fase = angle(TFR);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF Delta desplazada')

Modulo = abs(TFR);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF Delta desplazada')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('log10(1+Módulo) de la TF Delta desplazada')
	
%% Función sinusoide
% Dimensión de la matriz
DimX = 256;
DimY = 256;

% Dimensión del rectángulo
Periodo = 16;
Tilt = 0;

R = TiltedSin(DimY, DimX, Periodo, Tilt);

figure
subplot(2,2,1)
	colormap(gray);
	imagesc(R);
	axis equal tight
	title('función sinusoide')

TFR = fft2shift(R);

Fase = angle(TFR);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF de la sinusoide')

Modulo = abs(TFR);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF de la sinusoide')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('log10(1+Módulo) de la TF de la sinusoide')