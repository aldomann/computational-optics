function F = fft2shift(f)
% Performs the fordward 2D Fourier Transform
% The quadrants are shifted before and after of the FT
% In this way the center of the matrix is the origin of coordinates
% in the spatial and fourier domains
%
% Sintaxis
%   F = fft2shift(f);
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

F = ifftshift( fft2 (fftshift (f) ) );