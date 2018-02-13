%% Authors:
%	Alfredo Hernández  <aldomann.designs@gmail.com>
%	Sergi Escanes      <sergi.escanes@e-campus.uab.cat>
%	Antonio J. Sánchez <antoniojose.sanchez@e-campus.uab.cat>

%% Startup
addpath(genpath('functions'));

clc;   % Cleans Command Window
clear; % Cleans Workspace

%% Simulating a Moved Image (Exercise 5.1, 5.2 & 5.3)

DimX = 700;
DimY = 370;

SizeX = input('Introduce the displacement (longitude of the PSF): ');
SizeY = 2;

% Calculating the PSF (Exercise 5.1)
PSF = Rectangle(DimX,DimY,SizeX,SizeY);

figure(1) 
subplot(2,3,1)
	colormap(gray); 
	imagesc(PSF); 
	title('PSF') 
	axis equal tight

% Modulation Transfer Function (Exercise 5.2)
OTF = fft2shift(PSF);
MTF = abs(OTF);
subplot(2,3,2)
	colormap(gray); 
	imagesc(MTF);
	title('MTF') 
	axis equal tight

% Move the Image (Exercise 5.3)
L = imread('images/the_crew.bmp');

TFR = fft2shift(L);

MovFR = abs(TFR).*MTF.*exp(1i*angle(TFR));
Mov = ifft2shift(MovFR);

subplot(2,3,4)
	colormap(gray); 
	imagesc(L);
	title('Image') 
	axis equal tight

subplot(2,3,5)
	colormap(gray); 
	imagesc(abs(Mov));
	title('Moved')
	axis equal tight
	
%% [Optional] Restuaring the Moved Image (Exercise 5.4)
% Inverse Filter
ct = 1.e-4;
IMTF = conj(MTF)./(ct + MTF.^2);

% Inverse Filter * FT of Moved Image
CI = MovFR.*IMTF;

% Reconstructed Image
CR = ifft2shift(CI);
subplot(2,3,6)
	colormap(gray);
	imagesc(real(CR));
	title('Reconstructed Image')
	axis equal tight