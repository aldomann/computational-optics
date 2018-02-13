function F = Comb2D(DimX, DimY, PeriodX, PeriodY)
% 2D array of deltas (comb)
% in a matrix of dimensions DimX*DimY
% the deltas are separated PeriodX*PeriodY
%
%Sintaxis
%   F = Comb2D(DimX, DimY, PeriodX, PeriodY);
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

F = zeros(DimX, DimY);
for i=1:PeriodY:DimY
    for j=1:PeriodX:DimX
        F(i, j) = 1.0;
    end
end