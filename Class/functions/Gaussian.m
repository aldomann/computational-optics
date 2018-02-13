function L = Gaussian(DimY, DimX, Width)
% Genera una función Gaussiana en una matriz de dimensiones
% DimX*DimY. Las anchura viene dada por Ancho
%
% Sintaxis
% 	L = Gaussian(DimY, DimX, Width);

x = 1:DimX;
y = 1:DimY;

x = x - DimX/2;
y = y - DimY/2;
[X,Y] = meshgrid(x,y);

L = exp(- (X.^2 + Y.^2)/ (Width*Width));