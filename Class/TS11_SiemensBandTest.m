%% Filtros pasa bandas con el Test de Siemens

% Borrado de todas las variables de la memoria
clear all
clc

% Dimensiones de la matriz
Dim = 512;
N = 64; % número de periodos

% Generación y dibujo de la estrella de Siemens
Siemens = SiemensStar(Dim, N, 0);
H=figure(1);
set(H,'Name','Band Pass Fitering')
	subplot(3,3,1)
	colormap(gray);
	imagesc(Siemens);
	axis equal tight

% TF y dibujo
TFB = fft2shift(Siemens);
subplot(3,3,2)
	colormap(gray);
	imagesc(log(100+ abs(TFB)) );
	title('Real FT Siemens')
	axis equal tight

%% Filtro Pasa banda
r = 50; % anchura del círculo
x = 80; % Centro del Círculo Inicial
y = 0;

% Loop, picking up the points.
disp('Left mouse button picks points.')
disp('Right mouse button picks last point.')
subplot (3,3,3)
	axis([0 100 0 100]);
	text (10, 90, 'On subplot 3,3,2')
	text (10, 70, 'Left mouse button picks points.')
	text (10, 50, 'Right mouse button picks last point.')

but = 1;
while but == 1
	GBPF = CircularBandPass(Dim, x, y, r);
	
	subplot(3,3,4)
		colormap(gray);
		imagesc(GBPF);
		title('Filter 1')
		axis equal tight
	
	% TF Filtrada
	TFBF = TFB.*GBPF;
	subplot(3,3,5)
		colormap(gray);
		imagesc(log(100+ abs(TFBF)) );
		title('Real FT Siemens Filtrada')
		axis equal tight
	
	% Funcion filtrada
	FSS = ifft2shift(TFBF);
	
	subplot(3,3,6)
		colormap(gray);
		imagesc(real(FSS));
		title('Funcion filtrada')
		axis equal tight
	subplot(3,3,2)
		[xi, yi, but] = ginput(1);
	
	x = Dim/2 - floor(xi);
	y = Dim/2 - floor(yi);
	y = -y;
end

%% Filtro Pasa banda
Rc = 80; % Centro del Círculo
r = 20; % anchura del círculo

but = 1;
while but == 1
	GBPF = AnularBandPass(Dim, Rc, r);
	subplot(3,3,7)
		colormap(gray);
		imagesc(GBPF);
		title('Filter 2')
		axis equal tight
	
	% TF Filtrada
	TFBF = TFB.*GBPF;
	subplot(3,3,8)
		colormap(gray);
		imagesc(log(100+ abs(TFBF)) );
		title('Real FT Siemens Filtrada')
		axis equal tight
	
	% Funcion filtrada
	FSS = ifft2shift(TFBF);
	subplot(3,3,9)
		colormap(gray);
		imagesc(real(FSS));
		title('Funcion filtrada')
		axis equal tight
	subplot(3,3,2)
		[xi, yi, but] = ginput(1);
	
	x = Dim/2 - floor(xi);
	y = Dim/2 - floor(yi);
	Rc = sqrt(x*x + y*y);
end