%% Generación de funciones sinusoidales

% Borrado de todas las variables de la memoria
clear all

% Dimensiones de la matriz
DimX = 256;
DimY = 256;

% Periodo
Periodo = input('Introducir el periodo: ');

%Inclinación
Tilt = input('Introducir la inclinación: ');

% Generación de la función sinusoidal
L = TiltedSin(DimY, DimX, Periodo, Tilt);

figure(1)
	subplot(2,1,1)
	colormap(gray);
	imagesc(L);
	Titulo = sprintf('funcion Sinusoidal. Periodo=%.1f; Tilt=%.1f', Periodo, Tilt);
	title(Titulo)
	axis equal tight

% Desplazar la imagen y dibujarla en otra ventana
shiftsize = input('Dar el desplazamiento en forma de vector. [y, x]: ');
LS = circshift(L, shiftsize);

figure(1)
	subplot(2,1,2)
	colormap(gray);
	imagesc(LS);
	Titulo = sprintf('funcion Sinusoidal. Periodo=%.1f; Tilt=%.1f; Shift=[%d,%d]', Periodo, Tilt, shiftsize);
	title(Titulo)
	%title("asd")
	axis equal tight