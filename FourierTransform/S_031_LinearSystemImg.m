% 
clc
close all

% Read the imagen
f = imread('Einstein.tif');
% Select part of the Image
f = f(1:512,1:512);
s = size(f); % size of the image


% Inpulse response: Gaussian
n=0;
d = 1;
for k=1:3
    %Show Image
    n = n+1;
    H=figure(n);    
    subplot(2,3,1)
    imagesc(f);
    axis equal tight
    title('Input Image')

    % TF 
    F = fft2shift(f);
    subplot(2,3,4)
    colormap(gray);
    imagesc(log(100+ abs(F)) );
    title('log abs TF')
    axis equal tight


    % Gaussian function
    d = d*2;
    r = Gausiana(s(2), s(1), d);
    subplot(2,3,2)
    imagesc(r);
    titulo = sprintf('Gaussian width %d', 2*d+1);
    title(titulo)
    axis equal tight

    % TF y dibujo
    R = fft2shift(r);
    subplot(2,3,5)
    colormap(gray);
    imagesc(log(100+ abs(R)) );
    title('log abs TF')
    axis equal tight

    c = Convolution(f, r, 'r');
    subplot(2,3,3)
    colormap(gray);
    imagesc(c );
    title('Convolution with a Gaussian')
    axis equal tight

    % TF y dibujo
    C = fft2shift(c);
    subplot(2,3,6)
    colormap(gray);
    imagesc(log(100+ abs(C)) );
    title('log abs TF Convolution with a Gaussian')
    axis equal tight
     
    
end
