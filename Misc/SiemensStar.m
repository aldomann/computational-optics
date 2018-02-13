function Siemens = SiemensStar(Dim, N, binariza)
% Genera una estrella de Siemens e una matriz de dimensiones
% Dim*Dim. El número de brazos es N. 
% binariza: Opción de binarizar la imagen
%
% Sintaxis
%   Siemens = SiemensStar(Dim, N, binariza);

% Creación del vector con las coordenadas x (las y son iguales)
x = 1:Dim;
x = x - double(int32(Dim/2));

% Matrices con las coordenadas
[X, Y] = meshgrid(x, x);

angle = atan2(Y,X);

Siemens = cos(angle*N);
if binariza >= 1
    Siemens( Siemens > 0 )  = 1;
    Siemens( Siemens <= 0 ) = 0;
end