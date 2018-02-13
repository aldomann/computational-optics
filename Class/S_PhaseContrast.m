%% Modelo de microscopio de contraste de fase
% Borrado de todas las variables de la memoria
clear all
clc
DimX = 256;
DimY = 256;

%% Dimensión del rectángulo
SizeX = 20;
SizeY = 20;

M = Rectangle(DimY, DimX, SizeY, SizeX);

P = exp(1i * M * pi);

%% Plots
figure(1)
subplot(3,2,1)
    colormap(gray);
    imagesc(abs(M));
	axis equal tight
	title('Cuadrado M')
	
subplot(3,2,2)
	colormap(gray);
	imagesc(abs(P));
	axis equal tight
	title('Cuadrado P')

TFP = fft2shift(P);
Ph = angle(TFP);

subplot(3,2,3)
	colormap(gray);
	imagesc(Ph);
	axis equal tight
	title('Fase de TF(P)')
	
%% Contraste de Fase
dim = 2;

contrast_phase = pi/2;

Ph(DimY/2 - dim:DimY/2 + dim, DimX/2 - dim:DimX/2 + dim) = Ph(DimY/2 - dim:DimY/2 + dim, DimX/2 - dim:DimX/2 + dim) + contrast_phase;

subplot(3,2,4)
	colormap(gray);
	imagesc(Ph);
	axis equal tight
	Titulo = sprintf('Fase de TF(P)+ %.1f rad', contrast_phase);
	title(Titulo)

TFP2 = abs(TFP).* exp(1i*Ph);
TFPI = ifft2shift(TFP2);
subplot(3,2,5)
	colormap(gray);
	imagesc(abs(TFPI));
	axis equal tight
	title('Transformada inversa')