%% Cleaning Apolo17 image

clc;
clear;
% format compacts
warning('off');

% Lee la imagen
a = imread('apolo17_boulder_noisy.tif');
% Seleccionamos una parte de la imagen
a = a(1:470,1:470);
s = size(a); % size of the image

%% Image and TF

H = figure(1);
set(H,'Name','Image')

subplot(2,3,1)
	colormap(gray);
    imagesc(a);
	title('Untouched Apolo');
	axis equal tight

A = fft2shift(a);
subplot(2,3,2)
	colormap(gray);
    imagesc(abs(A));
	title('Untouched Apolo');
	axis equal tight