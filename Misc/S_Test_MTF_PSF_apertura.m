% Test MTF OTF apertura

Dim = 512;
W20 = 0;

for radio=64:-2:16
    
    ImgW20 = Desenfoque(Dim, W20, radio);
    
    IOTF = IncoherentOTF(ImgW20);
    
    figure(2)
    subplot(1,2,1)
    colormap(gray);
    axis equal
    imagesc(real(IOTF));
    title('Real OTF')
    
    PSF = fft2shift(ImgW20);
    PSF = abs(PSF).^2;
    subplot(1,2,2)
    colormap(gray);
    axis equal
    imagesc(abs(PSF) .^ 0.3 );
    title('abs( PSF )** 0.3')

    
end