function ImgW40 = Esferica(Dim, W40, Radio)
% Aberración de onda producida por un desenfoque

% Creación del vector con las coordenadas x (las y son iguales)
x = 1:Dim;
x = x - double(int32(Dim/2));

% Matrices con las coordenadas
[X, Y] = meshgrid(x, x);

Rad = sqrt(X.^2 + Y.^2)/double(int32(Radio));

indices = find( Rad > 1 );

ImgW40 = exp( i * Rad.^4 * 2*pi*W40 );

ImgW40( indices ) = 0; 