function F = Comb2D(DimX, DimY, PeriodX, PeriodY)

	F = zeros(DimX, DimY);

	for i=1:PeriodY:DimY
		for j=1:PeriodX:DimX
			F(i, j) = 1.0;
	end

end
