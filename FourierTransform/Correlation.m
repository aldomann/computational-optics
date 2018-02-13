function c = Correlation(f1, f2, exit)
% Evaluates the correlation between the two matrices f1, and f2 
% in the Fourier domain 
% They must be of the same dimension
% The type of the output matrix can be selected
% (exit = 'r')  Real matrix
% (exit = 'c')  Complex matrix
%
% Sintaxis
%   c = Correlation(f1, f2, exit);
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

% Fourier Transform of both matrices
F1 = fft2shift(f1);
F2 = fft2shift(f2);

% Inverse Fourier Transform of the product (the second complex conjugate)
C = ifft2shift(F1.*conj(F2));

% Selection of the exit
switch exit
    case {'c','C'}
        c = C;
    case {'r', 'R'}
        c = real(C);
    otherwise
        c = real(C);
end
            
