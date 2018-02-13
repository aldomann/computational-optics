function L = DoubleSlit(DimX, DimY, Period, difPeriod, Amplitude, difAmplitude)

	x = 1:DimX;
	y = 1:DimY;
	[X,Y] = meshgrid(x,y);
	FX1 = 1/Period;
	FX2 = 1/(Period + difPeriod);
	Amplitude2 = Amplitude + difAmplitude;
	L = zeros(DimY, DimX);
	L = L + Amplitude*sin( 2*pi*(X*FX1 )) + Amplitude2*sin( 2*pi*(X*FX2 ));

end
