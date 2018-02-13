% Script to demonstrate the output of a linear system
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

Dim = 256;

% Comb function
PeriodX = 50;
PeriodY = 30;
C = Comb2D(Dim, Dim, PeriodX, PeriodY);
% Triangle function
Size = 40;
T = Triangulo(Dim, Dim, Size);


% Convolution
Out = Convolution(C, T, 'real');

figure()
subplot(1,3,1)
imagesc(C);
axis square tight
colormap(gray)
title('Input Object')

subplot(1,3,2)
imagesc(T);
axis square tight
colormap(gray)
title('Inpulse Response')

subplot(1,3,3)
imagesc(Out);
axis square tight
colormap(gray)
title('Output Image')