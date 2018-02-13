%% Filtrado del Test de Siemens

% Borrado de todas las variables de la memoria
clear all
clc

%% Intro
% Dimensiones de la matriz
Dim = 512;
N = 64; % número de periodos

% Generación y dibujo de la estrella de Siemens
Siemens = SiemensStar(Dim, N, 0);
H=figure(1);
set(H,'Name','Multiplicacion en el dominio espacial')
subplot(3,3,1)
	colormap(gray);
	imagesc(Siemens);
	axis equal tight

% TF y dibujo
TFB = fft2shift(Siemens);
subplot(3,3,2)
	colormap(gray);
	imagesc(log(100+ abs(TFB)) );
	title('Real FT Siemens')
	axis equal tight

% Generación de una apertura circular y dibujo
Rad = 192;
CA = CircularAperture(Dim, Rad);
subplot(3,3,6)
	colormap(gray);
	imagesc(CA );
	title('Circular Aperture')
	axis equal tight

% Multiplicación de la estrella por la apertura circular
S2 = Siemens.*CA;
TFS2 = fft2shift(S2);
subplot(3,3,4)
	colormap(gray);
	imagesc(S2 );
	title('Siemens * Circular Aperture')
	axis equal tight

subplot(3,3,5)
	colormap(gray);
	%imagesc(real(TFS2) +min(min(real(TFS2))) );
	imagesc(log(100+ abs(TFS2)) );
	title('Real FT Siemens * CA')
	axis equal tight

% Apertura complementaria => Obstrucción circular
CA = abs(CA - 1);
subplot(3,3,9)
	colormap(gray);
	imagesc(CA );
	title('Circular Obstruction')
	axis equal tight
	S2 = Siemens.*CA;
	TFS2 = fft2shift(S2);

subplot(3,3,7)
	colormap(gray);
	imagesc(S2 );
	title('Siemens * Circular obstruction')
	axis equal tight

subplot(3,3,8)
	colormap(gray);
	%imagesc(real(TFS2) +min(min(real(TFS2))) );
	imagesc(log(100+ abs(TFS2)) );
	title('Real FT Siemens * CO')
	axis equal tight


%% Multiplicacion en el dominio de Fourier
clear all
clc
Dim = 512;
N = 64;

% Generación y dibujo de la estrella de Siemens
Siemens = SiemensStar(Dim, N, 0);
H=figure(2);
set(H,'Name','Multiplicacion en el dominio de Fourier')
subplot(3,3,1)
	colormap(gray);
	imagesc(Siemens);
	axis equal tight

% TF y dibujo
TFB = fft2shift(Siemens);
subplot(3,3,2)
	colormap(gray);
	imagesc(log(100+ abs(TFB)) );
	title('Real FT Siemens')
	axis equal tight

% Generación de una apertura circular y dibujo
Rad = 70;
CA = CircularAperture(Dim, Rad);

subplot(3,3,4)
	colormap(gray);
	imagesc(CA );
	title('Circular Aperture')
	axis equal tight

subplot(3,3,5)
	colormap(gray);
	imagesc(log(100+ abs(TFB.*CA)) );
	title('Real FT Siemens * CA')
	axis equal tight
	S2 = ifft2shift(TFB.*CA);

subplot(3,3,6)
	colormap(gray);
	imagesc(real(S2) );
	title('Real IFT(FT Siemens * CA)')
	axis equal tight
	CA = abs(CA - 1);

subplot(3,3,7)
	colormap(gray);
	imagesc(CA );
	title('Circular Obsturction')
	axis equal tight

subplot(3,3,8)
	colormap(gray);
	imagesc(log(100+ abs(TFB.*CA)) );
	title('Real FT Siemens * (1-CA)')
	axis equal tight
	S2 = ifft2shift(TFB.*CA);

subplot(3,3,9)
	colormap(gray);
	imagesc(real(S2) );
	title('Real IFT(FT Siemens * (1-CA))')
	axis equal tight