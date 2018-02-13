function [G1, x, f] = TopHat(dim, dx, x0, w, b)
%Generate a Top-Hat function in 1D
%
%  dim:  dimension of the array
%  dx: separation between pixels
%  x0: coordinate of the center
%  w: width of the Top-Hat
%
% Sintaxis
% [G1, x, f] = TopHat(dim, dx, x0, w, b)
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

% Calculate the coordinates of each pixel and the frequency
 [x, f] = CoorFreq(dim, dx);

 % Vector filled of zeros
G1 = x*0;

% Top-Hat function
G1(abs(x-x0) < w/2) = b;