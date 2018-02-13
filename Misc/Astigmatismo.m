function ImgW22 = Astigmatismo(Dim, W22, Radio)
% Aberración de onda producida por un desenfoque

% Creación del vector con las coordenadas x (las y son iguales)
x = 1:Dim;
x = x - double(int32(Dim/2));

% Matrices con las coordenadas
[X, Y] = meshgrid(x, x);

ImgW22 = sqrt(X.^2 + Y.^2);

indices = find( ImgW22 > 0 );
cos = (X(indices)./ImgW22(indices)) .^2;

ImgW22 = ImgW22/double(int32(Radio));

ImgW22(indices) = exp( i * ImgW22(indices).^2 .* cos * 2*pi*W22 );

indices = find( ImgW22 > 1 );
ImgW22( indices ) = 0; 
