%% Correlación-Convolución con deltas

Dim = 256;
Shift = 32;

%% Delta and triangle functions
% Delta en el centro desplazada
delta = circshift(Delta(Dim, Dim), [Shift, Shift]);

% Triángulo
Rad = 16;
CA = Triangle(Dim, Dim, Rad);

%% correlación: delta - triangulo
c = Correlation(delta, CA, 'r');

figure(1)
subplot(2,2,1)
	colormap(gray);
	imagesc(c);
	axis equal tight
	title('Corr: delta - triangulo')

%% correlación: triangulo - delta
c = Correlation(CA, delta, 'r');

subplot(2,2,2)
	colormap(gray);
	imagesc(c);
	axis equal tight
	title('Corr: triangulo - delta')

%% Convolución: delta - triangulo
c = Convolution(delta, CA, 'r');
figure(1)
subplot(2,2,3)
	colormap(gray);
	imagesc(c);
	axis equal tight
	title('Conv: delta - triangulo')

%% Convolución: triangulo - delta
c = Convolution(CA, delta, 'r');

subplot(2,2,4)
	colormap(gray);
	imagesc(c);
	axis equal tight
	title('Conv: triangulo - delta')