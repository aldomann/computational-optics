function L = ExpSin(DimX, DimY, Period, A)

	x = 1:DimX;
	y = 1:DimY;
	[X,Y] = meshgrid(x,y);
	FX = 1/Period;
	L = zeros(DimY, DimX);
	L = L + sin( 2*pi*(X*FX ))*exp(-X/A);

end
