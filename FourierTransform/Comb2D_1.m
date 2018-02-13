function F = Comb2D_1(DimX, DimY, Period, Orientation, Shift)
% 1D array of deltas (comb) with period  Period
% in a matrix of dimensions DimX*DimY
% The array is in the Orientation
% Orientation = 1: Rows
% Orientation = 2: Columns
%
%Sintaxis
%   F = Comb2D_1(DimX, DimY, Period, Orientation);
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

F = zeros(DimY, DimX);
switch Orientation
    case 1 % Vertical
        for i=1+Shift:Period:DimY
            F(i, DimX/2) = 1.0;
        end        
        
    case 2 % Horizontal     
        for i=1+Shift:Period:DimX
            F(DimY/2, i) = 1.0;
        end
end