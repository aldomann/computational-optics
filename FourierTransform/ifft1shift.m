function F = ifft1shift(f)
% Performs the backwards 1D Fourier Transform
% The quadrants are shifted before and after of the FT
% In this way the center of the matrix is the origin of coordinates
% in the spatial and fourier domains
%
% Sintaxis
%   F = ifft1shift(f);
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

F = fftshift( ifft (ifftshift (f) ) );