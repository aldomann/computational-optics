%% Script Importancia de la fase de la TF
clc; %Limpia la ventana de comandos.
clear; %Limpia las variables en la memoria
format compact
warning('off');

mv = imread('meninasv.tif');
% mp = imread('meninasp.tif');
mp = imread('mondrian.tif');

%% Figura 1
H = figure(1);
set(H,'Name','Imagnes y sus transformadas')

subplot(2,4,1)
	colormap(gray);
    imagesc(mv);
	title('Meninas Velazquez');
	axis equal tight

subplot(2,4,5)
	colormap(gray);
	imagesc(mp);
	title('Meninas Picaso');
	axis equal tight

MV = fft2shift(mv);
MP = fft2shift(mp);

subplot(2,4,2)
	colormap(gray);
	imagesc(log(100+ abs(MV)) );
	title('TF Velazquez')
	axis equal tight

subplot(2,4,6)
	colormap(gray);
	imagesc(log(100+ abs(MP)) );
	title('TF Picaso')
	axis equal tight

%% Figura 2
% H = figure(2);
% set(H,'Name','Solo la Fase de la TF')

MV = fft2shift(mv);
MP = fft2shift(mp);

% Módulo Velazquez Fase Picaso
FP = exp(1i*angle(MP));

% Módulo Picaso Fase Velazquez
FV = exp(1i*angle(MV));

fp = ifft2shift(FP);
fv = ifft2shift(FV);

subplot(2,4,3)
	colormap(gray);
	imagesc(real(fp));
	title('Fase Picaso')
	axis equal tight

subplot(2,4,7)
	colormap(gray);
	imagesc(real(fv));
	title('Fase Velazquez')
	axis equal tight

%% Figura 3
% H = figure(3);
% set(H,'Name','Importancia de la Fase de la TF')

MV = fft2shift(mv);
MP = fft2shift(mp);

% Módulo Velazquez Fase Picaso
MVFP = abs(MV) .* exp(1i*angle(MP));

% Módulo Picaso Fase Velazquez
MPFV = abs(MP) .* exp(1i*angle(MV));

mvfp = ifft2shift(MVFP);
mpfv = ifft2shift(MPFV);

subplot(2,4,4)
	colormap(gray);
	imagesc(real(mvfp));
	title('Mod Velazquez - Fase Picaso')
	axis equal tight

subplot(2,4,8)
	colormap(gray);
	imagesc(real(mpfv));
	title('Mod Picaso - Fase Velazquez')
	axis equal tight