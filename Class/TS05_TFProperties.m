%% Transformada de Fourier y sus propiedades

% Borrado de todas las variables de la memoria
clear all

%% Función rectángulo
% Dimensión de la matriz
DimX = 256;
DimY = 256;

% Dimensión del rectángulo
SizeX = 16;
SizeY = 32;

R = zeros(DimY, DimX);
R(DimY/2 - SizeY/2:DimY/2 + SizeY/2, DimX/2 - SizeX/2:DimX/2 + SizeX/2) = 1;

figure(1)
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


%% DESPLAZAMIENTO
% Desplazar el rectángulo y hacer los mismo
repetir = 's';
while (repetir == 's' || repetir == 'S')
	shiftsize = input('Dar el desplazamiento en forma de vector. [y, x]: ');
	RS = circshift(R,shiftsize);

	figure(2)
	subplot(2,2,1)
		colormap(gray);
		imagesc(RS);
		axis equal tight
		Titulo = sprintf('función rectángulo. Shift=[%d,%d]', shiftsize);
		title(Titulo)

	TFR = fft2shift(RS);

	Fase = angle(TFR);	
	Fase(Fase == -pi) = pi; % line added by JC
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
	
	repetir = input('Otro desplazamiento? (s/n): ','s');
end

%% ESCALADO
% Escalar el rectángulo y hacer los mismo
repetir = 's';
while (repetir == 's' || repetir == 'S')
	Fac = input('Dar el factor de escala : ');
	
	% Dimensión del rectángulo
	SX = int32(SizeX * Fac);
	SY = int32(SizeY * Fac);
	
	RE = zeros(DimY, DimX);
	RE(DimY/2 - SY/2:DimY/2 + SY/2, DimX/2 - SX/2:DimX/2 + SX/2) = 1;
	
	figure(3)
	subplot(2,2,1)
		colormap(gray);
		imagesc(RE);
		axis equal tight
		Titulo = sprintf('función rectángulo. Escala=%.2f', Fac);
		title(Titulo)
	
	TFR = fft2shift(RE);
	
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
	
	repetir = input('Otra escala? (s/n): ','s');
end

%% TRANSFORMADA DE LA TRANSFORMADA
shiftsize = [30,30];
RS = circshift(R,shiftsize);

figure(4)
subplot(2,2,1)
	colormap(gray);
	imagesc(RS);
	axis equal tight
	Titulo = sprintf('Función rectángulo desplazada');
	title(Titulo)
	
% TF directa y después TF inversa
TFD = fft2shift(RS);
RSdi = ifft2shift(TFD);
subplot(2,2,3)
	colormap(gray);
	imagesc(abs(RSdi));
	axis equal tight
	Titulo = sprintf('TF directa, TF inversa');
	title(Titulo)

% TF directa y después directa
TFD = fft2shift(RS);
RSdd = fft2shift(TFD);
subplot(2,2,4)
	colormap(gray);
	imagesc(abs(RSdd));
	axis equal tight
	Titulo = sprintf('TF directa, TF directa');
	title(Titulo)
