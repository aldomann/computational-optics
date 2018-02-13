function c = Convolution1D(f1, f2, exit)
% Evaluates the convolution between the two vectors f1, and f2 
% in the Fourier domain 
% They must be of the same dimension
% The type of the output vector can be selected
% (exit = 'r')  Real matrix
% (exit = 'c')  Complex matrix
%
% Sintaxis
%   c = Convolution1D(f1, f2, exit);
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

% Fourier Transform of both matrices
F1 = fft1shift(f1);
F2 = fft1shift(f2);

% Inverse Fourier Transform of the product
C = ifft1shift(F1.*F2);

% Selection of the exit
switch exit
    case {'c','C'}
        c = C;
    case {'r', 'R'}
        c = real(C);
    otherwise
        c = real(C);
end