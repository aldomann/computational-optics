function R = Rectangle(DimY, DimX, SizeY, SizeX)
% Genera una función rectángulo en el centro de una matriz de dimensiones
% DimX*DimY. Size: Los lados del rectangulo
%
% Sintaxis
% 	R = Rectangle(DimY, DimX, SizeY, SizeX);

R = zeros(DimY, DimX);
R(DimY/2 - SizeY/2:DimY/2 + SizeY/2, DimX/2 - SizeX/2:DimX/2 + SizeX/2) = 1;