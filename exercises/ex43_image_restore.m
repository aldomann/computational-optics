%% Authors:
%	Alfredo Hernández  <aldomann.designs@gmail.com>
%	Sergi Escanes      <sergi.escanes@e-campus.uab.cat>
%	Antonio J. Sánchez <antoniojose.sanchez@e-campus.uab.cat>

%% Startup
addpath(genpath('functions'));

clc;   % Cleans Command Window
clear; % Cleans Workspace

%% Filtering an image with periodic noise (Exercise 4.3)

L = imread('images/HeadCT_corrupted.tif');

figure(1)
subplot(2,2,1)
	colormap(gray);
	imagesc(L);
	title('Corrupted HeadCT');
	axis equal tight

RFT = fft2shift(L);
subplot(2,2,2)
	colormap(gray);
	imagesc(log(100+abs(RFT)));
	title('FT(HeadCT)');
	axis equal tight
	
RFTFilt = RFT;
for j = 256:258
    for n = 237:239
        RFTFilt(n,j) = 0; 
    end
    for n = 276:278
        RFTFilt(n,j) = 0; 
    end
end

for n = 256:258
    for j = 266:268
        RFTFilt(n,j) = 0; 
    end
    for j = 246:248
        RFTFilt(n,j) = 0; 
    end
end

for j = 216:218
    for n = 216:218
        RFTFilt(n,j)=0;
    end
end

for j = 296:298
    for n = 296:298
        RFTFilt(n,j)=0;
    end
end

subplot(2,2,3)
	colormap(gray);
	imagesc(log(100+abs(RFTFilt)));
	title('FT(Filtered HeadCT)');
	axis equal tight

LRest = abs(ifft2shift(RFTFilt));

subplot(2,2,4)
	colormap(gray);
	imagesc(LRest);
	title('Restored HeadCT');
	axis equal tight
