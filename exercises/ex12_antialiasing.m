%% Authors:
%	Alfredo Hernández  <aldomann.designs@gmail.com>
%	Sergi Escanes      <sergi.escanes@e-campus.uab.cat>
%	Antonio J. Sánchez <antoniojose.sanchez@e-campus.uab.cat>

%% Startup
addpath(genpath('functions'));

clc;   % Cleans Command Window
clear; % Cleans Workspace

%% Study of antialiasing (Exercise 1.2)

DimX = 256;
DimY = 256;

A = 30;

for k=1:16
	Freq = k/8;

	L = ExpSin(DimX, DimY, 1/Freq, A);
	FFT = fft2shift(L);

	figure(1)
	subplot(4,4,k)
		colormap(gray);
		imagesc(L);
		axis equal tight
		title(sprintf('Function (nu = %.2f)', Freq))

	figure(2)
	subplot(4,4,k)
		colormap(gray);
		imagesc(abs(FFT));
		axis equal tight
		title(sprintf('Modulus of FT (nu = %.2f)', Freq))
end
