function R = Rectangle(DimX,DimY,SizeX,SizeY)

	R = zeros(DimY, DimX);
	R(DimY/2 - SizeY/2:DimY/2 + SizeY/2, DimX/2 - SizeX/2:DimX/2 + SizeX/2) = 1;

end
