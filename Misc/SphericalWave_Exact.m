function P = SphericalWave_Exact(Ndim, lambda, xr, yr, zr, Sampling)

% lambda in mm    :  Wave Length
% Sampling in mm  :  Sampling distance in the output plane
% xr, yr, zr in mm:  center of the wave

x = 0:Ndim-1;
x = x - Ndim/2;
x = x * Sampling;

[X, Y] = meshgrid(x, x);
zr2 = zr*zr;

r = zr * sqrt( 1 + (X-xr).^2/zr2  + (Y-yr).^2/zr2 );

k = 2*pi/lambda;

P = exp(-1i*k*r)./r;