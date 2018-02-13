%% TF de la suma de funciones
% Borrado de todas las variables de la memoria
clear all
clc

DimX = 256;
DimY = 256;

%% SUMA DE SINUSOIDES
Periodo = 8;
Tilt = 0;
L = TiltedSin(DimY, DimX, Periodo, Tilt);

Periodo = 16;
Tilt = 90;
L = L + TiltedSin(DimY, DimX, Periodo, Tilt);

Periodo = 32;
Tilt = 45;
L = L + TiltedSin(DimY, DimX, Periodo, Tilt);

Periodo = 64;
Tilt = -45;
L = L + TiltedSin(DimY, DimX, Periodo, Tilt);

TFL = fft2shift(L);

figure(1)
subplot(2,2,1)
	colormap(gray);
	imagesc(L);
	axis equal tight
	title('Suma de sinusoides')

Fase = angle(TFL);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF Suma de sinusoides')

Modulo = abs(TFL);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF Suma de sinusoides')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('log10(1+Módulo) de la TF Suma de sinusoides')

%% SUMA DE 3 rectángulos
% Dimensión del rectángulo
SizeX = 32;
SizeY = 4;
d = 8;

R = Rectangle(DimY, DimX, SizeY, SizeX);

L = zeros(DimY, DimX);
for i=1:3
	d1 = -2*d + i*d;
	L = L + circshift(R, [0, d1]);
end

TFL = fft2shift(L);

figure(2)
subplot(2,2,1)
	colormap(gray);
	imagesc(L);
	axis equal tight
	title('Suma de 3 rectángulos')

Fase = angle(TFL);
	subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF Suma de 3 rectángulos')

Modulo2 = abs(TFL);
	subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo2);
	axis equal tight
	title('Módulo de la TF Suma de 3 rectángulos')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo2));
	axis equal tight
	title('log10(1+Módulo) de la TF Suma de 3 rectángulos')

%% SUMA DE 11 rectángulos
L = zeros(DimY, DimX);
for i=1:11
	d1 = -6*d + i*d;
	L = L + circshift(R, [0, d1]);
end

TFL = fft2shift(L);

figure(3)
subplot(2,2,1)
	colormap(gray);
	imagesc(L);
	axis equal tight
	title('Suma de 11 rectángulos')

Fase = angle(TFL);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF Suma de 11 rectángulos')

Modulo11 = abs(TFL);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo11);
	axis equal tight
	title('Módulo de la TF Suma de 11 rectángulos')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo11));
	axis equal tight
	title('log10(1+Módulo) de la TF Suma de 11 rectángulos')

%% SUMA DE 21 rectángulos
L = zeros(DimY, DimX);
for i=1:21
	d1 = -11*d + i*d;
	L = L + circshift(R, [0, d1]);
end

TFL = fft2shift(L);

figure(4)
subplot(2,2,1)
	colormap(gray);
	imagesc(L);
	axis equal tight
	title('Suma de 21 rectángulos')

Fase = angle(TFL);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF Suma de 21 rectángulos')

Modulo21 = abs(TFL);
	subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo21);
	axis equal tight
	title('Módulo de la TF Suma de 21 rectángulos')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo21));
	axis equal tight
	title('log10(1+Módulo) de la TF Suma de 21 rectángulos')

%% SUMA DE 31 rectángulos
L = zeros(DimY, DimX);
for i=1:31
	d1 = -16*d + i*d;
	L = L + circshift(R, [0, d1]);
end

TFL = fft2shift(L);

figure(5)
subplot(2,2,1)
	colormap(gray);
	imagesc(L);
	axis equal tight
	title('Suma de 31 rectángulos')

Fase = angle(TFL);
subplot(2,2,2)
	colormap(gray);
	imagesc(Fase);
	axis equal tight
	title('Fase de la TF Suma de 31 rectángulos')

Modulo31 = abs(TFL);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulo31);
	axis equal tight
	title('Módulo de la TF Suma de 31 rectángulos')

subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulo31));
	axis equal tight
	title('log10(1+Módulo) de la TF Suma de 31 rectángulos')

figure(6)
hold on
	plot(Modulo2(DimY/2, :)/3,'r');
	plot(Modulo11(DimY/2, :)/11,'b');
	plot(Modulo21(DimY/2, :)/21,'g');
	plot(Modulo31(DimY/2, :)/31,'k');
	title('Intensity patterns')
	axis tight
hold off

