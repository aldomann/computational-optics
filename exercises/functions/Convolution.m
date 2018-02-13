function c = Convolution(f1, f2, exit)
% Calculates the Convolution between the f1 and f2 matrices
% of same dimension using the Fourier transform.
% The exit can be real (exit = 'r') o complex (exit = 'c')
%
% Syntax
%	c = Convolucion(f1, f2, exit);

	% FT of the functions
	F1 = fft2shift(f1);
	F2 = fft2shift(f2);

	% Inverse FT of the product
	C = ifft2shift(F1.*F2);

	switch exit
		case {'c','C'}
			c = C;
		case {'r', 'R'}
			c = real(C);
		otherwise
			c = real(C);

end

