function [x, f] = CoorFreq(dim, dx)
% Given a vector of size 'dim' pixels and separation between pixels 'dx'
% this function evaluate the coordinates of each pixel and the frequencies
% of the 1D Fourier Transform
% USE
%   [x, f] = CoorFreq(dim, dx)
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

% Step in frequency doamin
df = 1/(dim*dx);

% Coordinates
x=( (1:dim) - dim/2-1 )*dx;

% Frequencies
f=( (1:dim) - dim/2-1 )*df;