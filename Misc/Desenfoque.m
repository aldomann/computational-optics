function ImgW20 = Desenfoque(Dim, W20, Radio)
% Aberración de onda producida por un desenfoque

% Creación del vector con las coordenadas x (las y son iguales)
x = 1:Dim;
x = x - double(int32(Dim/2));

% Matrices con las coordenadas
[X, Y] = meshgrid(x, x);

ImgW20 = sqrt(X.^2 + Y.^2)/double(int32(Radio));

indices = find( ImgW20 > 1 );

ImgW20 = exp( i * ImgW20.^2 * 2*pi*W20 );

ImgW20( indices ) = 0; 
