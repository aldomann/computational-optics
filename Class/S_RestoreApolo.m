%% Script restauracion
% Restauración de una imagen degradada por un filtro pasa baja
% mediante la aplicación del filtro inverso
clc;
%Limpia la ventana de comandos.
clear ; %Limpia las variables en la memoria
format compact
warning('off');

% Lee la imagen
f = imread('apolo17_boulder_noisy.tif');
% Seleccionamos una parte de la imagen
f = f(1:470,1:470);
s = size(f); % size of the image


max(max(f));
n = 0;
d = 2;
cte = 1.e-12;

%% Convoluciones con gaussianas y aplicacion del filtro inverso

% Show Image
H=figure(1);
set(H,'Name','Reconstrucción mediante el filtro inverso')
subplot(2,2,1)
	imagesc(f);
	axis equal tight

% TF y dibujo
F = fft2shift(f);
subplot(2,2,3)
	colormap(gray);
	imagesc(log(100+ abs(F)) );
	title('log abs TF')
	axis equal tight

% Función gaussiana de lado
d = d*2;
r = Gaussian(s(2), s(1), d);
subplot(2,2,2)
	imagesc(r);
	titulo = sprintf('Gaussiana de ancho %d', 2*d+1);
	title(titulo)
	axis equal tight

% TF y dibujo
R = fft2shift(r);
% subplot(3,3,5)
% 	colormap(gray);
% 	imagesc(log(100+ abs(R)) );
% 	title('log abs TF')
% 	axis equal tight

c = Convolution(f, r, 'r');
% subplot(3,3,3)
% 	colormap(gray);
% 	imagesc(c );
% 	title('Convolución con gaussiana')
% 	axis equal tight

% TF y dibujo
C = fft2shift(c);
% subplot(3,3,6)
% 	colormap(gray);
% 	imagesc(log(100+ abs(C)) );
% 	title('log abs TF convolucion con gausiana')
% 	axis equal tight

% Restuaración supuesto conocida la degradacion
% Inverse Filter
RI = conj(R)./(cte + abs(R).^2);
% subplot(3,3,8)
% 	colormap(gray);
% 	imagesc(log(100+ abs(RI)) );
% 	title('Filtro Inverso (Log abs)')
% 	axis equal tight

% Multiplication Inverse FIlter * FT degraded image
CI = C.*RI;
% subplot(3,3,9)
% 	colormap(gray);
% 	imagesc(log(100+ abs(CI)) );
% 	title('log abs TF imagen degradada * FIltro Inverso')
% 	axis equal tight

% Imagen reconstruida
CR = ifft2shift(CI);
subplot(2,2,4)
	colormap(gray);
	imagesc(real(CR) );
	title('Parte Real Funcion reconstruida')
	axis equal tight