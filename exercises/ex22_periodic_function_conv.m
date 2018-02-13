%% Authors:
%	Alfredo Hernández  <aldomann.designs@gmail.com>
%	Sergi Escanes      <sergi.escanes@e-campus.uab.cat>
%	Antonio J. Sánchez <antoniojose.sanchez@e-campus.uab.cat>

%% Startup
addpath(genpath('functions'));

clc;   % Cleans Command Window
clear; % Cleans Workspace

%% Periodic 2D Function (Exercise 2.2)

DimX = 256;
DimY = 256;

PeriodX1=input('Introduce the period on X of the comb function: ');
PeriodY1=input('Introduce the period on Y of the comb function: ');
M = Comb2D(DimX, DimY, PeriodX1, PeriodY1);
    
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

c = Convolution(L, M, 'r');

figure(1)
subplot(1,3,1)
	colormap(gray); 
	imagesc(L); 
	title('Function')
	axis equal tight

subplot(1,3,2)
	colormap(gray); 
	imagesc(M); 
	title('2D Comb')
	axis equal tight

subplot(1,3,3)
	colormap(gray); 
	imagesc(c);
	title('Convolution')
	axis equal tight
end