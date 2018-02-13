% Wave Packets:  Dumped Oscilator
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

clc
format compact

dim = 512; % Length of the signal
dx   = 1;      % Sampling distance
period = 4; % Period in pixels of the sinusoidal

g = 0.014;  % Dumping constant in pixels

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

%Generation of the dumping exponential
Sd = S.*exp(-g/2*x);
gr = g*dx;
subplot(3,1,2)
plot(xr,Sd)
title(sprintf('Dumped Sinusoidal period %f  sampling %f  dumping %f', periodr, dx, gr));
xlabel('distance (mm)');
ylabel('value');
axis tight

%Fourier Transform
FTSl = fft1shift(Sd);

df = 1/(dim*dx);
f=( (1:dim) - dim/2-1 )*df;

subplot(3,1,3)
plot( f(dim/2:end) , abs(FTSl(dim/2:end)).^2);
title(sprintf('Dumped Sinusoidal period %f   dumping %f ', periodr, gr));
xlabel('frequency (mm^-1)');
ylabel('value');
axis tight


%%  TODO
% Change the period of the sinusoidal
% Change the width of the limitation