function CA = CircularAperture(Dim, Rad)
% Generates a circular aperture of radius Rad
% in a square matrix of side Dim

	% Create vector with x coordinates (the y coords are the same)
	x = 1:Dim;
	x = x - double(int32(Dim/2));

	% Matrices with the coordinates
	[X, Y] = meshgrid(x, x);

	CA = sqrt(X.^2 + Y.^2)/Rad;

	CA( CA <=1 ) = 1;
	CA( CA > 1 ) = 0;

end
