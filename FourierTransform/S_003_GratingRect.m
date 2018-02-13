% Rectangular grating
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

clc
format compact

dim = 512;  %length of the signal
dx = 1;  % sampling distance
p = 64;  %Period in pixels
w = 4;   % width in pixels
n = 2;   % number of periods

pr = p*dx;  % Period
wr = w*dx; % Width

% Coordinates
x=1:dim;
xr = x*dx;

% Generaion of a grating
g   = redrect(dim, p, w, n);
% Generation of 1 period of the grating
g1 = redrect(dim, p, w, 1);


figure(1)
subplot(3,1,1)
plot(xr,g)
title(sprintf('Grating period %f  width %f  n %f', pr, wr, n));
xlabel('distance (mm)');
ylabel('value');
axis tight


%Fourier Transform
G = fft1shift(g);
G1 = fft1shift(g1);

subplot(3,1,2)
plot(xr,abs(G).^2)
title(sprintf('Grating period %f  width %f  n %f', pr, wr, n));
xlabel('distance (mm)');
ylabel('value');
axis tight

subplot(3,1,3)
plot(xr,abs(G1).^2)
title(sprintf('Modulation  width %f ',wr));
xlabel('distance (mm)');
ylabel('value');
axis tight

%%  TODO
% Change one per one the parameters
%   Period
%   Width
%   Number of periods

%%  HOMEWORK
% Program a new function like "redrect.m" to generate a phase grating
% New parameter will be the phase shift
% Solve analitycally the problem and program the analytical FT and the
% digital FT, and compare them for some cases