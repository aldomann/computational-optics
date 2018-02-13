function L = Gaussian(DimX, DimY, Width)
% Generates a Gaussian function of width Width in a DimX*DimY matrix
%
% Syntax
%	L = Gausiana(DimX, DimY, Width);

	x = 1:DimX;
	y = 1:DimY;

	x = x - DimX/2;
	y = y - DimY/2;
	[X,Y] = meshgrid(x,y);

	L = zeros(DimY, DimX);
	L = exp(- (X.^2 + Y.^2)/ (Width*Width));

end
