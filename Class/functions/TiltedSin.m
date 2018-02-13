function L = TiltedSin(DimY, DimX, Period, Tilt)
% Genera una función seno inclinada en una
% matriz de dimensiones DimX*DimY de periodo Periodo e inclinada
% un ángulo Tilt en grados
%
% Sintaxis
% 	L = TiltedSin(DimY, DimX, Period, Tilt);

x = 1:DimX;
y = 1:DimY;

% Two matrices
[X,Y] = meshgrid(x,y);

% Frequencies
FX = cos(Tilt*pi/180)/Period;
FY = sin(Tilt*pi/180)/Period;

L = sin( 2*pi*(X*FX + Y*FY));