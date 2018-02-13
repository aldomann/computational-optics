%% Authors:
%	Alfredo Hernández  <aldomann.designs@gmail.com>
%	Sergi Escanes      <sergi.escanes@e-campus.uab.cat>
%	Antonio J. Sánchez <antoniojose.sanchez@e-campus.uab.cat>

%% Startup
addpath(genpath('functions'));

clc;   % Cleans Command Window
clear; % Cleans Workspace

%% Periodic 2D Function (Exercise 2.1)

DimX = 256;
DimY = 256;

while 1 == 1
	P = input(sprintf(['Introduce P:\n' ...
			  '  1 = Rectangle\n' ...
			  '  2 = Circle\n' ...
			  '  3 = Triangle\n' ...
			  '  4 = Gaussian\n' ...
			  '  5 = 2D Comb\n'...
			  'To exit introduce any other character.\n']));    
	if P == 1
		SizeX = input('Introduce the side (on x): ');
		SizeY = input('Introduce the side (on y): ');
		L = Rectangle(DimX,DimY,SizeX,SizeY);
	elseif P == 2
		Dim = DimX;
		Rad = input('Introduce the radius: ');
		L = CircularAperture(Dim, Rad);
	elseif P == 3
		Size = input ('Introduce the side: ');
		L = Triangle(DimX, DimY, Size);
	elseif P == 4
		Dim = DimX;
		Ancho = input('Introduce the radius: ');
		L = Gaussian(Dim, Dim, Ancho);
	elseif P == 5
		PeriodX = input('Introduce the period on X: ');
		PeriodY = input('Introduce the period on Y: ');
		L = Comb2D(DimX, DimY, PeriodX, PeriodY);
	else
		break
end

figure(1) 
subplot(2,2,1)
	colormap(gray); 
	imagesc(L);
	title('Function in Real Space') 
	axis equal tight

FFT = fft2shift(L); 
Phase = angle(FFT); 
subplot(2,2,2) 
	colormap(gray); 
	imagesc(Phase); 
	axis equal tight
	title('Phase of FT') 

Modulus = abs(FFT); 
subplot(2,2,3) 
	colormap(gray); 
	imagesc(Modulus); 
	axis equal tight
	title('Modulus of FT') 
subplot(2,2,4) 
	colormap(gray); 
	imagesc(log10(1+Modulus)); 
	axis equal tight
	title('log10(1+Modulus) of FT')
end