function R = Delta(DimY, DimX)
% Genera una función delta en el centro de una matriz de dimensiones
% DimX*DimY. Size: Los lados del triangulo rectangulo
%
% Sintaxis
% 	R = Delta(DimY, DimX);

R = zeros(DimY, DimX);
R(DimY/2, DimX/2) = 1;