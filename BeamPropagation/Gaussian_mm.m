function G = Gaussian_mm(x, w0)
% Generates a Gaussian function
% x: X and Y coordinates en mm
% w0: gaussian width
% 
% use
%   G = Gaussian_mm(x, w0)
%
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

[X,Y] = meshgrid(x,x);

G = exp(- (X.^2 + Y.^2)/ (w0*w0));