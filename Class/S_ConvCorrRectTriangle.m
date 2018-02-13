%% Correlation and convolution of rectangle and triangle functions
% Borrado de todas las variables de la memoria
clear all
clc

DimX = 256;
DimY = 256;

%% 3 rectangles + 3 triangles
% Dimensión del rectángulo
SizeX = 32;
SizeY = 32;

d = 80;

ShiftY = 40;
ShiftX = 0;

R = circshift(Rectangle(DimY, DimX, SizeY, SizeX), [ShiftY, ShiftX]);

L1 = zeros(DimY, DimX);
for i=1:3
	d1 = -2*d + i*d;
	L1 = L1 + circshift(R, [0, d1]);
end

% Dimensión del triángulo
TSize = 32;

ShiftY = -40;
ShiftX = 0;

R = circshift(Triangle(DimY, DimX, TSize), [ShiftY, ShiftX]);

L2 = zeros(DimY, DimX);
for i=1:3
	d1 = -2*d + i*d;
	L2 = L2 + circshift(R, [0, d1]);
end

% Sum of the rectangle and the triangle
L0 = L1 + L2;

figure(1)
subplot(3,3,1)
	colormap(gray);
	imagesc(L0);
	axis equal tight
	title('3 rectángulos + 3 triángulos')
	
%% Rectangle and triangle scenes

% Dimensión del rectángulo
SizeX = 32;
SizeY = 32;

Rect = Rectangle(DimY, DimX, SizeY, SizeX);

% Dimensión del triángulo
TSize = 32;
Triang = Triangle(DimY, DimX, TSize);

% Plots
subplot(3,3,2)
	colormap(gray);
	imagesc(Rect);
	axis equal tight
	title('Rectángulo')

subplot(3,3,3)
	colormap(gray);
	imagesc(Triang);
	axis equal tight
	title('Triángulo')
	
%% Correlation

corr1 = Correlation(L0, Rect, 'r');
subplot(3,3,5)
	colormap(gray);
	imagesc(corr1);
	axis equal tight
	title('Corr: + rect')

corr2 = Correlation(L0, Triang, 'r');
subplot(3,3,6)
	colormap(gray);
	imagesc(corr2);
	axis equal tight
	title('Corr: + triang')

%% Convolution

conv1 = Convolution(L0, Rect, 'r');
subplot(3,3,8)
	colormap(gray);
	imagesc(conv1);
	axis equal tight
	title('Conv: + rect')

conv2 = Convolution(L0, Triang, 'r');
subplot(3,3,9)
	colormap(gray);
	imagesc(conv2);
	axis equal tight
	title('Conv: + triang')