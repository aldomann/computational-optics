function qf = QuadraticPhaseF(N, Fac)

%Evaluation of a quadratic phase centered in a square matrix
%
%         qf = exp(i Fac (m^2+n^2) )    -N/2 <= m <= N/2 - 1
%                                       -N/2 <= n <= N/2 - 1
% Input parameters:
%   N:      Number of rows and columns of the square matrix
%   Fac:    Multiplicative factor of the square pixel
%
% Output:
%   qf: complex square matrix witht the result
%
% Use:
%   qf = QuadraticPhaseF(N, Fac)
%

    row = zeros(N,1);
    
    % Imaginary unit
    I  = sqrt(-1);
   
    % quadratic exponential in one dimension
    N2 = N/2;
    row(1:N) = exp(I*Fac*((0:N-1) - N2).^2);
    
    % Two dimensional matrix
    qf = kron(row,row.');
end