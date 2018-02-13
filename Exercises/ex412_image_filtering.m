%% Authors:
%	Alfredo Hernández  <aldomann.designs@gmail.com>
%	Sergi Escanes      <sergi.escanes@e-campus.uab.cat>
%	Antonio J. Sánchez <antoniojose.sanchez@e-campus.uab.cat>

%% Startup
addpath(genpath('functions'));

clc;   % Cleans Command Window
clear; % Cleans Workspace

%% Filtering an image with periodic noise (Exercises 4.1 & 4.2)

DimX = 256;
DimY = 256;
L = imread('images/HeadCT_corrupted.tif');
RFT = fft2shift(L);

figure(1)
subplot(1,2,1)
	colormap(gray); 
	imagesc(L); 
	title('Corrupted HeadCT');
	axis equal tight

Modulo = abs(RFT); 
subplot(1,2,2)
	colormap(gray); 
	imagesc(log(100+Modulo));
	title('Modulus of FT(Corrupted HeadCT)');
	axis equal tight