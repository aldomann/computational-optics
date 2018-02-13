% Correlation 1D
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

clc
format compact

Dim = 512;
W = 20;
X0t = 100;
X0s = 0;
h = 1;
dx = 1;
b = 1;

[X, f] = CoorFreq(Dim, dx);

% Definition of the two functions
[f2, X, f] = TopHat(Dim, dx, X0s, W, b);
f1 = NStriangulo1D(Dim, W, X0t, h, X);

% Correlations with different order
c1 = Correlation1D(f1, f2, 'r');
c2 = Correlation1D(f2, f1, 'r');
figure(1)
subplot(4,1,1)
plot(X,f1);
axis tight
xlabel('coordinate')
ylabel('function 1')

subplot(4,1,2)
plot(X,f2);
axis tight
xlabel('coordinate')
ylabel('function 2')

subplot(4,1,3)
plot(X,c1);
axis tight
xlabel('coordinate')
ylabel('Correlation f1*f2')

subplot(4,1,4)
plot(X,c2);
axis tight
xlabel('coordinate')
ylabel('Correlation f2*f1')