function fase = CircularAberration(Dim, Rad, W20, W40, W22, W31, phi)
% Generación de una apertura circular de radio Rad
% en una matriz cuadrada de lado Dim

% Creación del vector con las coordenadas x (las y son iguales)
x = 1:Dim;
x = x - double(int32(Dim/2));

% Matrices con las coordenadas
[X, Y] = meshgrid(x, x);

r = sqrt(X.^2 + Y.^2)/Rad;
r2 = r.^2;
r3 = r.^3;
r4 = r.^4;
	
fase = exp(1i * (W20 * r2 + W40 * r4 + W22 * r2 * cos(phi).^2 + W31 * r3 * cos(phi)));