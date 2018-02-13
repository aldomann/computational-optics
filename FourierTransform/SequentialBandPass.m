function SequentialBandPass(G, x, dim)
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

xm = min(x);
xM = max(x);
ym = -0.1;
yM = 1.1;

 g = ifft1shift(G);
figure(2)
for i=1:2:dim
    [R, x2, f2] = TopHat(dim, 1, 0, i, 1);
    G1 = G.*R;
    g1 = ifft1shift(G1);
        
    figure(2)
    subplot(1,2,1)
    plot(x,real(g1));
    title( sprintf('Reconstructed Function: bandpass width %d', i) );
    axis([xm xM ym yM])
   subplot(1,2,2)
    plot(x,real(g-g1));
    title( sprintf('Error: bandpass width %d', i) );
    axis([xm xM ym yM])
    
    pause(0.02);
end