function F = fft1shift(f)
% Performs the fordward 21D Fourier Transform
% The quadrants are shifted before and after of the FT
% In this way the center of the matrix is the origin of coordinates
% in the spatial and fourier domains
%
% Sintaxis
%   F = fft1shift(f);
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

F = ifftshift( fft (fftshift (f) ) );