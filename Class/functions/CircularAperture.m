function CA = CircularAperture(Dim, Rad)
% Generación de una apertura circular de radio Rad
% en una matriz cuadrada de lado Dim

% Creación del vector con las coordenadas x (las y son iguales)
x = 1:Dim;
x = x - double(int32(Dim/2));

% Matrices con las coordenadas
[X, Y] = meshgrid(x, x);

CA = sqrt(X.^2 + Y.^2)/Rad;

CA(CA <=1) = 1;
CA(CA > 1) = 0;