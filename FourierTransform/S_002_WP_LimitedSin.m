% Wave Packets:   Limited sin
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

clc
format compact

dim = 512; % Length of the signal
dx   = 1;      % Sampling distance
period = 4; % Period in pixels of the sinusoidal
L = 64;  % Length in pixels of the signal

% Generation of a sinusoidal
x = 0:dim-1;
S = sin(2*pi*x/period);

xr = x*dx;
periodr = period*dx;

figure(1)
subplot(3,1,1)
plot(xr,S)
title(sprintf('Sinusoidal period %f  sampling %f', periodr, dx));
xlabel('distance (mm)');
ylabel('value');
axis tight

Sl = S;
Lr = L*dx;
Sl(L+1:end) = 0;
subplot(3,1,2)
plot(xr,Sl)
title(sprintf('Limited Sinusoidal period %f  sampling %f  length %f', periodr, dx, Lr));
xlabel('distance (mm)');
ylabel('value');
axis tight



%Fourier Transform
FTSl = fft1shift(Sl);

df = 1/(dim*dx);
f=( (1:dim) - dim/2-1 )*df;

subplot(3,1,3)
plot( f(dim/2:end) , abs(FTSl(dim/2:end)).^2);
title(sprintf('Spectrum Limited Sinusoidal period %f   length %f  bandwith%f', periodr, Lr, 1/Lr));
xlabel('frequency (mm^-1)');
ylabel('value');
axis tight

%%  TODO
% Change the period of the sinusoidal
% Change the width of the limitation
