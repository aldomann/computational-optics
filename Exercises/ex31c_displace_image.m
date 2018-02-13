%% Authors:
%	Alfredo Hernández  <aldomann.designs@gmail.com>
%	Sergi Escanes      <sergi.escanes@e-campus.uab.cat>
%	Antonio J. Sánchez <antoniojose.sanchez@e-campus.uab.cat>

%% Startup
addpath(genpath('functions'));

clc;   % Cleans Command Window
clear; % Cleans Workspace

%% Displacing an Image (Exercise  3.1C)

DimX = 256;
DimY = 256;
PhaseX = input('Introduce the displacement (on x): ')/41.1357; %/(103*256/641);
PhaseY = input('Introduce the displacement (on y): ')/41.1357; %/(103*256/641);

L = imread('images/team_rocket.bmp');

figure(1);
subplot(2,1,1)
	colormap(gray);
	imagesc(L);
	title('Original Image')
	axis equal tight

FFT = fft2shift(L);
x = 1:DimX;
y = 1:DimY;
[X,Y] = meshgrid(x,y);
C = FFT.*exp(1i*(-PhaseX*X+PhaseY*Y));
L=ifft2shift(C);

subplot(2,1,2)
	colormap(gray);
	imagesc(abs(L));
	title('Displaced Image')
	axis equal tight
