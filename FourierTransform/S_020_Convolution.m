% Auto Convolution
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

Dim = 512;
W = 20;
X0 = 0;
h = 1;
dx = 1;
[X, f] = CoorFreq(Dim, dx);

% Generation of a triangular function
t = triangulo1D(Dim, W, X0, h, X);

% Autoconvolution of the Triangle
c = Convolution1D(t, t, 'r');
figure(1)
subplot(2,1,1)
plot(X,t);
axis tight
xlabel('coordinate')
ylabel('function')

subplot(2,1,2)
plot(X,c);
axis tight
xlabel('coordinate')
ylabel('convolution')

 
% Generation of a comb function
Shift = 30;
F = Comb1D(Dim, Period, Shift);

% Convolution between the triangle and the comb functions
c = Convolution1D(t, F, 'r');
figure(2)
subplot(3,1,1)
plot(X,t);
axis tight
xlabel('coordinate')
ylabel('function')

subplot(3,1,2)
plot(X,F);
axis tight
xlabel('coordinate')
ylabel('function')

subplot(3,1,3)
plot(X,c);
axis tight
xlabel('coordinate')
ylabel('convolution')

%% TODO
% - Change the Period of the 2D Comb
% - Define a non-symmetric function and perform the convolution