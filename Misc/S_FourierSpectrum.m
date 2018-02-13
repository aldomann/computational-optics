% Fourier Spectrum
clc
clear all
close all

nf = input('Gaussian = 1,  Rect = 2  : ');
if nf == 2

    %% Rect Function
    w = 32;
    g = zeros(512,512);
    g(257-w:257+w, :) = 1;
    tit = 'original rectangle';
    kmax = 255;
    
    dt = 0.01;
    s=2;
else
    %% Gaussian function
    x=(0:511)-256;
    [X, Y] = meshgrid(x, x);
    w = 32;
    w2 = w*w;
    g = exp(-Y.^2/w2);
    tit = 'original gaussian';
    kmax = 32;
    dt = 1;
    s=1;
end

%% Calculations
h = figure(1);
subplot(2,3,1)
imagesc(g)
title(tit)
colormap(gray)

G = fft2shift(g);

mask = zeros(512,512);
maskold = mask;
for k=0:kmax
        
    mask(257-k:257+k, :) = 1;
    
    m2 = mask - maskold;
    maskold = mask;
    
    GMs = G.*m2;
    gms = ifft2shift(GMs);
    gms(1,1)=-0.2;
    gms(1,2) = 0.2;
    subplot(2,3,4)
    agms = real(gms);
    imagesc(agms)
    tit = sprintf('sinusoidal k = %d', k);
    title(tit)
    colormap(gray)    
    
        
    GM = G.*mask;
    gm = ifft2shift(GM);
    gm(1,1)=0;
    gm(1,2) = 1;
    subplot(2,3,2)
    agm = real(gm);
    imagesc(agm)
    tit = sprintf('reconstructed k = %d', k);
    title(tit)
    colormap(gray)
    
    dif = (g-agm);
    dif(1,1)=0;
    dif(1,2) = 1;
    subplot(2,3,3)
    imagesc(dif)
    title('Error')
    colormap(gray)
    
    subplot(2,3,5)
    plot(g(:,256),'k')
    hold on
    plot(agm(:,256),'r')
    hold off
    title('Original & Reconstructed')
    axis tight
    
    subplot(2,3,6)
    plot(dif(:,256),'k')
    title('Error')
    axis tight

    
    drawnow; pause(dt)
end

