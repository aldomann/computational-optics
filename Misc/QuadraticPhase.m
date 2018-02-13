function qf = QuadraticPhase(N, lambda, distance, PixelSize)
% Evaluate the quadratic phase neccesary to perform the Fresnel difraccion
% by using the transfer function of the free propagation.
%       qf=(pi*lambda*z) * (x^2+y*2)
% Input:
%   N:          Dimension of the square matrix
%   lambda:     wave length in microns 
%   distance:   Propagation distance in microns
%   PixelSize:  Sampling distance in microns
% Output:
%   qf:         Imag with the corresponding quadratic phase
    row = zeros(N,1);
    
    PI = 4*atan(1);
    I  = sqrt(-1);
    s  = PI*lambda*distance/(N*PixelSize)^2;
    
    N2 = N/2;
    row(1:N) = exp(I*s*((0:N-1) - N2).^2);
    
    qf = kron(row,row.');
end