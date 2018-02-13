% Script to calculate the 1D FT of a Gaussian function
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

clc
format compact

% Generation of the Gaussian function
dim = 512;
dx = 1;
x0 = 0;
w = 20;

[g, x, f] = Gauss1(dim, dx, x0, w);
% Draw of the function
figure(1)
subplot(4,1,1)
plot(x,g)
title(sprintf('Gaussian width %f  sampling %f', w, dx));
xlabel('distance (mm)');
ylabel('value');
axis tight

%Fourier Transform
G = fft1shift(g);
GA = w*sqrt(pi)*exp(-(pi*f*w).^2);

% Draw of the modulus FT
subplot(4,1,2)
plot(f, abs(G), 'b')
hold on
plot(f, abs(GA), 'r');
hold off
xlabel('frequency (mm^-1)');
ylabel('FT Modulus');
axis tight
%Draw of the error on the modulus of the FT
subplot(4,1,3)
plot(f, abs(G) - abs(GA))
xlabel('frequency (mm^-1)');
ylabel('Modulus error');
axis tight
%Draw of the Phase of the FT
subplot(4,1,4)
plot(f, angle(G))
xlabel('frequency (mm^-1)');
ylabel('FT Phase');
axis tight

% Reconstruction of the function depending on the frequencies considered
SequentialBandPass(G, x, dim);


%%    TODO
% Change the width of the function
% Change the location of the center