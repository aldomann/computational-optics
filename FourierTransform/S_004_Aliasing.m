% Script to demonstrate the Aliasing problem
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

clc
close all
clear all
format compact

PI = 4.*atan(1.0);
I  = sqrt(-1);

A1 = 1.0;
A2 = 1.0;

N  = 1024;
N2 = N/2;

f1 = 1.0/16.0;
s  = zeros(N,1);
ex = zeros(N,1);

figure(1)
% Sinusoidal functions
x=-N2:N2-1;
for m = 1:50
    f2 = 0.02*m;
    ex(1:N) = exp(-(1:N)/100.0);
    s(1:N)  = A1 * sin(2*PI*f1*(1:N)) + A2 * sin(2*PI*f2*(1:N));
    s = s .* ex;    
    tfs = fftshift(fft(s));
    
    figure(1)
    %subplot(2,1,1)
    plot(s);
    axis tight
    titulo = sprintf('Sinusoidal addition of frequencies: f1=%f,    f2=%f', f1, f2);
    title(titulo);
    
    figure(2)
    %subplot(2,1,2)
    plot(x, abs(tfs));
    axis tight

    f2
    
    %w = waitforbuttonpress;
    pause(0.2)
end

%Chirp function
for m = 1:40
    f1 = 16.0*m;
    s(1:N) = exp(-I*PI*f1*(((1:N)-N2)/N2).^2);
    tfs = fftshift(fft(s));
    
    figure(1)
    %subplot(2,1,1)    
    plot(angle(s));
    titulo = sprintf('f1=%f', f1);
    title(titulo);
    axis tight
    
    figure(2)
    %subplot(2,1,2)    
    plot(x,abs(tfs));
    axis tight
    
    %w = waitforbuttonpress;
    pause(0.2)
end

%% 2D functions

N=256;
 
    figure(3)
for m = 1:20
    f1 = PI*0.001*m;
    lente = QuadraticPhaseF(N, f1);
       
    imshow(angle(lente));
    titulo = sprintf('f1=%f', f1);
    title(titulo);
    axis tight
        
    %w = waitforbuttonpress;
    pause(0.2)
end



