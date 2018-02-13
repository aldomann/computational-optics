%% Authors:
%	Alfredo Hernández  <aldomann.designs@gmail.com>
%	Sergi Escanes      <sergi.escanes@e-campus.uab.cat>
%	Antonio J. Sánchez <antoniojose.sanchez@e-campus.uab.cat>

%% Startup
addpath(genpath('functions'));

clc;   % Cleans Command Window
clear; % Cleans Workspace

%% Study of antialiasing (Exercise 1.3)

DimX = 256;
DimY = 256;

Period = input('Introduce the period P ( 0 < P < 256): ');
difPeriod = input('Introduce the period difference:  ');
Amplitude = input('Introduce the intensity: ');
difAmplitude = input('Introduce the intensity difference: ');

L = Doblete(DimX, DimY, Period, difPeriod, Amplitude, difAmplitude);

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
