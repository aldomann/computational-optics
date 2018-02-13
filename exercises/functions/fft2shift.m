function F = fft2shift(f)
% Performs the 2D Fourier Transform by moving the quadrants
% before and after the transformation; it is considering the center
% of coordinates equal to the center of the matrix
%
% Syntax
%   F = fft2shift(f);

	F = fftshift( fft2 (fftshift (f) ) );

end
