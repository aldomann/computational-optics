function g = redrect(dim, p, w, n)
% Generation of a grating with rectangular groves
% p: period in pixels of the grating
% w: duty cicle
% n: number of periods to be considered
%
% USE
% g = redrect(dim, p, w, n)
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

g = 1:dim;
if ( n*p < dim)
    g(n*p:end) = 0;
end
g = mod(g, p);
g(g>w) = 0;
g(g>0) = 1;