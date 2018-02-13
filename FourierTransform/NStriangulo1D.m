function t = NStriangulo1D(Dim, W, X0, h, X)
% Triangle Rectangle in 1D
%
% INPUT
% Dim: size of the vector in pixels
% X: Coordinates
% X0: Width of the triangle base
% h: Height of the triangle
%
% OUTPUT
% t : value of the function
%
% USE
% t = NStriangulo1D(Dim, W, X0, h, X)
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

t = zeros(1, Dim);

ind = find((X>X0) & (X<X0+W));
t(ind) = -h/W *(X(ind) - X0 - W);
