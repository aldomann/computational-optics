function L = RotatedtedSin(DimX, DimY, Periodo, Rot)
% Genera una función seno girada en una
% matriz de dimensiones DimX*DimY de periodo Periodo y rotada
% un ángulo Rot en grados
%
% Sintaxis
%   L = TiltedSin(DimX, DimY, Periodo, Rot)
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

x = 1:DimX;
y = 1:DimY;

[X,Y] = meshgrid(x,y);
FX = cos(Rot*pi/180)/Periodo;
FY = sin(Rot*pi/180)/Periodo;

L = sin( 2*pi*(X*FX + Y*FY));

   
        


