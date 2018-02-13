%% Script 20161116

clear all
clc

%% Siemens
Dim = 512;
N = 32;
S = SiemensStar(Dim, N, 0) + 1;

H=figure(1);
set(H,'Name','Stuff')
subplot(2,3,1)
	colormap(gray);
	imagesc(S);
	title('Siemens Star');
	axis equal tight
	
%% Circular aperture
Rad = 100;
CA = CircularAperture(Dim, Rad);

% Aberration
W20 = 0;
W40 = 0;
W22 = 10; 
W31 = 10;
CA = CA.*CircularAberration(Dim, Rad, W20, W40, W22, W31, 0);

subplot(2,3,2)
	colormap(gray);
	imagesc(abs(CA));
	title('Circular Aperture');
	axis equal tight
	
%% PSF & OTF
TFCA = fft2shift(CA);
PSF = (abs(TFCA)).^2;
OTF = fft2shift(PSF);

subplot(2,3,3)
	colormap(gray);
	imagesc(PSF);
	title('PSF');
	axis equal tight
% subplot(2,3,4)
% 	colormap(gray);
% 	imagesc(OTF);
% 	title('OTF');
% 	axis equal tight

%% Convolution
Image = Convolution(S,PSF, 'r');

subplot(2,3,5)
	colormap(gray);
	imagesc(Image);
	title('Convolution');
	axis equal tight
	

