function GBPF = CircularBandPass(Dim, x, y, r)
% Generate a Circular Band Pass filter in an image of size (Nx, Ny)
% The gaussian is centered at (x,y) and (-x,-y) with respect to the center
% of the matrix, and has a width r


L = CircularAperture(Dim, r);

GBPF = circshift(L, [-y x]) + circshift(L, [y -x]);

GBPF( GBPF>1) = 1; % Por si acaso se superponen