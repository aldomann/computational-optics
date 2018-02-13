%% Authors:
%	Alfredo Hernández  <aldomann.designs@gmail.com>
%	Sergi Escanes      <sergi.escanes@e-campus.uab.cat>
%	Antonio J. Sánchez <antoniojose.sanchez@e-campus.uab.cat>

%% Startup
addpath(genpath('functions'));

clc;   % Cleans Command Window
clear; % Cleans Workspace

%% Study of aliasing (Exercise 1.1)

DimX = 256;
DimY = 256;

Freq = input('Introduce the frequency (0 < nu < 2): ');
Period = 1/Freq;

L = Sin(DimX, DimY, Period);
figure(1)
subplot(2,2,1)
	colormap(gray);
	imagesc(L);
	title(sprintf('Sinusoidal function. Period=%.0f', Period))
	axis equal tight

FFT = fft2shift(L);
Phase = angle(FFT);
subplot(2,2,2)
	colormap(gray);
	imagesc(Phase);
	axis equal tight
	title('Phase of FT(Sine)')
Modulus = abs(FFT);
subplot(2,2,3)
	colormap(gray);
	imagesc(Modulus);
	axis equal tight
	title('Modulus of FT(Sine)')
subplot(2,2,4)
	colormap(gray);
	imagesc(log10(1+Modulus));
	axis equal tight
	title('log10(1+Modulus) of FT(Sine)')

% Loop changing the frequency
figure(2)
for k=1:16
	Freq = k/8;

	L = Sin(DimX, DimY, 1/Freq);
	FFT = fft2shift(L);

	subplot(4,4,k)
		colormap(gray);
		imagesc(abs(FFT));
		axis equal tight
		title(sprintf('Modulus of FT (nu = %.2f)', Freq))
end
