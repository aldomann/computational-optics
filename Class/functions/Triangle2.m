function T = Triangle2(DimY, DimX, Size)
% Genera una función triángulo en el centro de una matriz de dimensiones
% DimX*DimY. Size: Los lados del triangulo rectangulo
%
% Sintaxis
% 	T = Triangle(DimY, DimZ, Size);

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