function Siemens = SiemensStar(Dim, N, binariza)
% Generation of a Siemens Star Test in a square matrix
% of dimension Dim*Dim
% The number of oscilations is N
% binariza: Option to binarize the output image
%         >= 1 binary output
%
% Sintaxis
%   Siemens = SiemensStar(Dim, N, binariza);

% Creacion del vector con las coordenadas x (las y son iguales)
x = 1:Dim;
x = x - double(int32(Dim/2));

% Coordinates
[X, Y] = meshgrid(x, x);

angle = atan2(Y,X);

Siemens = cos(angle*N);
if binariza >= 1
    Siemens( Siemens > 0 )  = 1;
    Siemens( Siemens <= 0 ) = 0;
end