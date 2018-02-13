function [G1, x, f] = Exponential1(dim, dx, x0, w)
%Generate a Exponential function in 1D
%
%  dim:  dimension of the array
%  dx: separation between pixels
%  x0: coordinate of the maximum
%  w: width of the Gaussian
%
% Sintaxis
% G1 = Gauss1(dim, dx, x0, w)
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

 [x, f] = CoorFreq(dim, dx);
 
G1 = exp(-(abs(x-x0))/w);
G1( (x-x0)<0) = 0;