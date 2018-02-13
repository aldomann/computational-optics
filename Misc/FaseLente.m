function qf = FaseLente(N, lambda, focal, PixelSize, ShiftX, ShiftY)
% Evaluate the quadratic phase corresponding to a lens
% 
%       qf=(pi/lambda*focal) * (x^2+y*2)
% Input:
%   N:          Dimension of the square matrix
%   lambda:     wave length in microns 
%   focal:      focal distance in microns
%   PixelSize:  Sampling distance in microns
%   ShiftX, ShiftY: Shift of the lens center in parts of pixels
% Output:
%   qf:         Imag with the corresponding quadratic phase


    
    PI = 4*atan(1);
    fac  = PI/(lambda*focal);
    
    N2 = N/2;
    x(1:N) = ((0:N-1) - N2 - ShiftX) * PixelSize;
    y(1:N) = ((0:N-1) - N2 - ShiftY) * PixelSize;
    
    x = fac * x.^2;
    y = fac  *y.^2;
    
    [X, Y] = meshgrid(x,y);
    qf = X + Y;
    
end