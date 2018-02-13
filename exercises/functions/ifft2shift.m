function F = ifft2shift(f)
% Performs the 2D inverse Fourier Transform by moving the quadrants
% before and after the transformation; it is considering the center
% of coordinates equal to the center of the matrix
%
% Syntax
%	F = fft2shift(f);

	F = fftshift( ifft2 (fftshift (f) ) );

end
