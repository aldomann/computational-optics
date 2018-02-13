function F = Peine2D(DimY, DimX, PeriodY, PeriodX)
% Genera una red bidimensional de deltas en una matriz de dimensiones
% DimX*DimY separadas PeriodX*PeriodY
%
%Sintaxis 
% 	F = Peine2D(DimY, DimX, PeriodY, PeriodX);

F = zeros(DimY, DimX);
for i=1:PeriodY:DimY
	for j=1:PeriodX:DimX
		F(i, j) = 1.0;
	end
end