function L = Gausiana(DimX, DimY, Ancho)
% Generation of a 2D Gaussian
% DimX, DimY:  matrix dimension
% Ancho: Width of the Gaussian
%
% Sintaxis
%   L = Gausiana(DimX, DimY, Ancho);
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/


x = 1:DimX;
y = 1:DimY;

x = x - DimX/2;
y = y - DimY/2;
[X,Y] = meshgrid(x,y);

L = zeros(DimY, DimX);
L = exp(- (X.^2 + Y.^2)/ (Ancho*Ancho));
