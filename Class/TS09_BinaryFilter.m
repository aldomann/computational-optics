%% Script para mostrar Filtros binarios en el dominio de Fourier

% Borrado de todas las variables de la memoria
clear all
clc

% Dimensiones de las imágenes
DimX = 256;
DimY = DimX;

% Generación de funciones periódicas
%% Dos funciones sinusoidales
% Funciones
Periodo = 32;
Tilt = 0;
L = TiltedSin(DimX, DimY, Periodo, Tilt);
Tilt = 90;
L = L + circshift(TiltedSin(DimX, DimY, Periodo, Tilt), [16 0]);

% Dibujo de la función
H=figure(1);
set(H,'Name','Funciones Sinusoidales')
subplot(3,3,1)
	colormap(gray);
	imagesc(L);
	axis equal tight
	title('Suma de sinusoides')

subplot(3,3,3)
	plot(L(:,int32(DimX/2)),'r');
	hold on
	plot(L(DimY/2, :),'b');
	axis([1 DimX -1 1]);
	legend('columna', 'fila');
	hold off

% Transformada de Fourier
TFL = fft2shift(L);
% Dibujo del módulo
Modulo = abs(TFL);
subplot(3,3,2)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF Suma de sinusoides')

%% Filtrado en una dirección
% Anchura del filtro
ancho = 5;
TFL1 = TFL;
TFL1(1:int32(DimY/2)-ancho/2,:) = 0;
TFL1(int32(DimY/2)+ancho/2:DimY,:) = 0;
Modulo = abs(TFL1);
subplot(3,3,5)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF Suma de sinusoides Filtrada')

% TF inversa
L1 = ifft2shift(TFL1);
Preal = real(L1);
subplot(3,3,6)
	colormap(gray);
	imagesc(Preal);
	axis equal tight
	title('Suma de sinusoides Filtrada')

subplot(3,3,4)
	plot(Preal(:,int32(DimX/2)),'r');
	hold on
	plot(Preal(DimY/2, :),'b');
	axis([1 DimX -1 1]);
	legend('columna', 'fila');
	hold off

%% Filtrado en otra dirección
% Anchura del filtro
ancho = 5;
TFL2 = TFL;
TFL2(:, 1:int32(DimX/2)-ancho/2) = 0;
TFL2(:, int32(DimX/2)+ancho/2:DimX) = 0;
Modulo = abs(TFL2);
subplot(3,3,8)
	colormap(gray);
	imagesc(Modulo);
	axis equal tight
	title('Módulo de la TF Suma de sinusoides Filtrada')

% TF inversa
L2 = ifft2shift(TFL2);
Preal = real(L2);
subplot(3,3,9)
	colormap(gray);
	imagesc(Preal);
	axis equal tight
	title('Suma de sinusoides Filtrada')

subplot(3,3,7)
	plot(Preal(:,int32(DimX/2)),'r');
	hold on
	plot(Preal(DimY/2, :),'b');
	axis([1 DimX -1 1]);
	legend('columna', 'fila');
	hold off

%% Función cuadrado repetida periódicamente
DimX = 128;
DimY = DimX;

ancho = 16;
a = ancho-1;
p = 32;
c = ones(ancho, ancho);

L = zeros(DimX, DimX);

for y=1:p:DimX-ancho
	for x=1:p:DimX-ancho
		L(y:y+a, x:x+a) = c;
	end
end

% Dibujo de la función
H=figure(2);
set(H,'Name','Función cuadrado repetida periodimacmente')
subplot(3,3,1)
	colormap(gray);
	imagesc(L);
	axis equal tight
	title('Cuadrados')

% Transformada de Fourier
TFL = fft2shift(L);
% Dibujo del módulo
Modulo = abs(TFL);
subplot(3,3,2)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('Módulo de la TF Cuadrados')

%% Filtrado en una dirección
% Anchura del filtro
ancho = 5;
TFL1 = TFL;
TFL1(1:int32(DimY/2)-ancho/2,:) = 0;
TFL1(int32(DimY/2)+ancho/2:DimY,:) = 0;
Modulo = abs(TFL1);
subplot(3,3,5)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('Módulo de la TF Cuadrados Filtrada')

% TF inversa
L1 = ifft2shift(TFL1);
Preal = real(L1);
subplot(3,3,6)
	colormap(gray);
	imagesc(Preal);
	axis equal tight
	title('Cuadrados Filtrada')

subplot(3,3,4)
	plot(Preal(:,int32(DimX/2)),'r');
	hold on
	plot(Preal(DimY/2, :),'b');
	axis([1 DimX -1 1]);
	legend('columna', 'fila');
	hold off

%% Filtrado en otra dirección
% Anchura del filtro
ancho = 5;
TFL2 = TFL;
TFL2(:, 1:int32(DimX/2)-ancho/2) = 0;
TFL2(:, int32(DimX/2)+ancho/2:DimX) = 0;
Modulo = abs(TFL2);
subplot(3,3,8)
	colormap(gray);
	imagesc(log10(1+Modulo));
	axis equal tight
	title('Módulo de la TF Cuadrados Filtrada')

% TF inversa
L2 = ifft2shift(TFL2);
Preal = real(L2);
subplot(3,3,9)
	colormap(gray);
	imagesc(Preal);
	axis equal tight
	title('Cuadrados Filtrada')

subplot(3,3,7)
	plot(Preal(:,int32(DimX/2)),'r');
	hold on
	plot(Preal(DimY/2, :),'b');
	axis([1 DimX -1 1]);
	legend('columna', 'fila');
	hold off