function F = ifft2shift(f)
% Performs the backwards 2D Fourier Transform
% The quadrants are shifted before and after of the FT
% In this way the center of the matrix is the origin of coordinates
% in the spatial and fourier domains
%
% Sintaxis
%   F = ifft2shift(f);
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

F = fftshift( ifft2 (ifftshift (f) ) );