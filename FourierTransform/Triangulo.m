function T = Triangulo(DimX, DimY, Size)
% Genera una funci�n tri�ngulo en el centro deuna matriz de dimensiones
% DimX*DimY. Size: Los lados del triangulo rectangulo
%
% Sintaxis
%   T = Triangulo(DimX, DimY, Size)
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

x = 1:DimX;
y = 1:DimY;
[X,Y] = meshgrid(x,y);

T = zeros(DimY, DimX);
T = X+Y;

T( T<(DimX+DimY)/2 ) = 0;
T( T>0 ) = 1;

T(1:DimY/2-Size/2, : ) = 0;
T(DimY/2+Size/2:DimY, : ) = 0;

T(:, 1:DimX/2-Size/2) = 0;
T(:, DimX/2+Size/2:DimY) = 0;