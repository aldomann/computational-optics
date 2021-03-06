function F = fft2shift(f)
% 2D Fourier Transform. 
% The quadrants are shifted before and after the FT
% Then the coordinates origin is taken at the center of the matrix
%
% Sintaxis
%     F = fft2shift(f);

F = fftshift( fft2 (fftshift (f) ) );