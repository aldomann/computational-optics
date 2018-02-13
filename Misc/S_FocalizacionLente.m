% S_Focalizacion lente

clear all
clf
clc

lambda = 0.633; % WaveLength in microns
pixelS = 8;    % Sampling distance in microns
focal  = 6; 
d= focal; % propagation distancie in mm

ShiftX = 0.5; % Lens Center Shift (in pixels)
ShiftY = 0.5;

d = d*1000; % microns
focal = focal*1000; % microns

N = 1024;
NL = 32;
npl = N/NL;

fasep = FaseLente(npl, npl, lambda, focal, pixelS, ShiftX, ShiftY);

fase = zeros(N,N);
for n=1:NL
    yi = (n-1)*npl;
    yf = yi + npl;
    for m=1:NL
        xi = (m-1)*npl;
        xf = xi + npl;
        fase(yi+1:yf, xi+1:xf) = fasep(1:npl, 1:npl);
    end
end


fasem = mod(fase, 2*pi);

figure(1) 
imagesc(fase);
colormap('gray')
title('fases cuadráticas de las lentes')

figure(2) 
imagesc(fasem);
colormap('gray')
title('fases cuadráticas de las lentes modulo 2pi')

i = sqrt(-1);
Rad = N/3;
CA = CircularAperture(N, Rad);
fc = CA .* exp(i*fase);

figure(3) 
imagesc(angle(fc));
colormap('gray')
title('fases cuadráticas de las lentes modulo 2pi * apertura')

qf = QuadraticPhaseR(N, N, lambda, d, pixelS);
figure(4) 
imagesc(mod(qf, 2*pi));
colormap('gray')
title('fases cuadráticas de la propagación')



FC = fft2shift(fc);

FCf = FC .* exp(+i*qf);

foco = ifft2shift(FCf);
figure(5) 
imagesc(abs(foco));
colormap('gray')
title('imagen plano final')

figure(6) 
plot(abs(foco(N/2,:)))
axis tight


%%
% Fase a medir
%f = QuadraticPhaseR(N, N, lambda, -10*d, pixelS);
nTerm = 1;
dCoef = 100;
f = nZernike_OneTerm_Car_ISO( nTerm, N, N, dCoef);
f = mod(f, 2*pi);
% Fase a medir + fase de las lentes
fase = fase + f; 

figure(7) 
imagesc(f);
colormap('gray')
title('fase a medir')

fc = CA .* exp(+i*fase);

FC = fft2shift(fc);

FCf = FC .* exp(+i*qf);

foco = ifft2shift(FCf);
figure(8) 
imagesc(abs(foco));
colormap('gray')
title('imagen plano final con fase a medir')

figure(9) 
plot(abs(foco(N/2,:)))
axis tight