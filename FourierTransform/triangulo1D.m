function t = triangulo1D(Dim, W, X0, h, X)
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

t = zeros(Dim, 1);
ind = find((X<=X0) & (X>X0-W));
t(ind) = h/W *(X(ind) - X0 + W);

ind = find((X>X0) & (X<X0+W));
t(ind) = -h/W *(X(ind) - X0 - W);
