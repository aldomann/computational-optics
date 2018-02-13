function [G1, x, f] = Gauss1(dim, dx, x0, w)
%Generate a Gaussian function in 1D
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

G1 = exp(-((x-x0).^2)/w^2);
