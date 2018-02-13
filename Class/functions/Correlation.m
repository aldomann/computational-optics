function c = Correlation(f1, f2, exit)
%Calcula la correlación entre las dos matrices f1, y f2, de la misma
%dimensión vía transformada de Fourier.
%La salida puede ser real (exit = 'r') o compleja (exit = 'c')
%dependiendo del valor de exit
%Sintaxis
% 	c =	Correlation(f1, f2, exit);

% Transformadas de Fourier de las funciones
F1 = fft2shift(f1);
F2 = fft2shift(f2);

% Transformada de Fourier inversa del producto
C = ifft2shift(F1.*conj(F2));
switch exit
	case {'c','C'}
		c = C;
	case {'r', 'R'}
		c = real(C);
	otherwise
		c = real(C);
end