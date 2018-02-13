%% Reconocimiento por correlacion
% Borrado de todas las variables de la memoria
clear all
clc

% Lectura de las escenas
e1 = imread('m332.tif');
e2 = imread('spring.tif');

% Se añade ruido
NoiseAmpli = 0; %20; %100;
Noise = NoiseAmpli*(rand(256,256)-0.5);
e1 = double(e1) + Noise;
e2 = double(e2) + Noise;

% Imágnes que se quieren reconocer
m2 = imread('m2nor.tif');
m3 = imread('m3nor.tif');

H=figure(1);
set(H,'Name','Filtro clásico')

subplot(2,3,1)
	colormap(gray);
	imagesc(e1);
	axis equal tight
	title('E1')

subplot(2,3,4)
	colormap(gray);
	imagesc(e2);
	axis equal tight
	title('E2')

% TF
tfe1 = fft2shift(e1);
tfe2 = fft2shift(e2);
tfm2 = fft2shift(m2);
tfm3 = fft2shift(m3);

%% FILTRO CLASICO
% Correlacion con el filtro clásico
e1_m2 = real(ifft2shift(tfe1.*conj(tfm2)));
e1_m3 = real(ifft2shift(tfe1.*conj(tfm3)));
e2_m2 = real(ifft2shift(tfe2.*conj(tfm2)));
e2_m3 = real(ifft2shift(tfe2.*conj(tfm3)));

subplot(2,3,2)
	surf(e1_m2,'edgecolor','flat')
	view(-23, 6);
	title('E1 * m2')

subplot(2,3,3)
	surf(e1_m3,'edgecolor','flat')
	view(-23, 6);
	title('E1 * m3')

subplot(2,3,5)
	surf(e2_m2,'edgecolor','flat')
	view(-23, 6);
	title('E2 * m2')

subplot(2,3,6)
	surf(e2_m3,'edgecolor','flat')
	view(-23, 6);
	title('E2 * m3')

%% FILTRO DE FASE
H=figure(2);
set(H,'Name','Filtro de Fase')

subplot(2,3,1)
	colormap(gray);
	imagesc(e1 );
	axis equal tight
	title('E1')

subplot(2,3,4)
	colormap(gray);
	imagesc(e2 );
	axis equal tight
	title('E2')

% Correlacion con el filtro clásico
e1_m2 = real(ifft2shift(tfe1.*conj(tfm2./abs(tfm2) )));
e1_m3 = real(ifft2shift(tfe1.*conj(tfm3./abs(tfm3) )));
e2_m2 = real(ifft2shift(tfe2.*conj(tfm2./abs(tfm2) )));
e2_m3 = real(ifft2shift(tfe2.*conj(tfm3./abs(tfm3) )));

subplot(2,3,2)
	surf(e1_m2,'edgecolor','flat')
	view(-23, 6);
	title('E1 * m2')

subplot(2,3,3)
	surf(e1_m3,'edgecolor','flat')
	view(-23, 6);
	title('E1 * m3')

subplot(2,3,5)
	surf(e2_m2,'edgecolor','flat')
	view(-23, 6);
	title('E2 * m2')

subplot(2,3,6)
	surf(e2_m3,'edgecolor','flat')
	view(-23, 6);
	title('E2 * m3')

%% FILTRO INVERSO
H=figure(3);
set(H,'Name','Filtro Inverso')

subplot(2,3,1)
	colormap(gray);
	imagesc(e1 );
	axis equal tight
	title('E1')

subplot(2,3,4)
	colormap(gray);
	imagesc(e2 );
	axis equal tight
	title('E2')

% Correlacion con el filtro inverso
e1_m2 = real(ifft2shift(tfe1.*conj(tfm2./abs(tfm2).^2 )));
e1_m3 = real(ifft2shift(tfe1.*conj(tfm3./abs(tfm3).^2 )));
e2_m2 = real(ifft2shift(tfe2.*conj(tfm2./abs(tfm2).^2 )));
e2_m3 = real(ifft2shift(tfe2.*conj(tfm3./abs(tfm3).^2 )));

subplot(2,3,2)
	surf(e1_m2,'edgecolor','flat')
	view(-23, 6);
	title('E1 * m2')

subplot(2,3,3)
	surf(e1_m3,'edgecolor','flat')
	view(-23, 6);
	title('E1 * m3')

subplot(2,3,5)
	surf(e2_m2,'edgecolor','flat')
	view(-23, 6);
	title('E2 * m2')

subplot(2,3,6)
	surf(e2_m3,'edgecolor','flat')
	view(-23, 6);
	title('E2 * m3')