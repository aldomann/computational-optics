%Variacion del desenfoque


Dim = 512;
Radio = 64;
N   = 64;

% Se genera la estrella de Siemens
Siemens = SiemensStar(Dim, N, 0);
figure(1)
colormap(gray);
axis equal
imagesc(Siemens);
title('Siemens Star')

TFS = fft2shift(Siemens);


% Funcion de pupila correspondiente al desenfoque
for W20=0.0:0.1:2
    ImgW20 = Desenfoque(Dim, W20, Radio);
    PSF    = fft2shift(ImgW20);
    PSF    = abs(PSF) .^2;
    OTF    = fft2shift(PSF);
    
    %Imagen desenfocada
    TFSD   = TFS .* OTF;
    SiemensD = ifft2shift(TFSD);
    
    figure(2)
    colormap(gray);
    axis equal
    subplot(1,2,2)
    imagesc(real(SiemensD));
    s = sprintf('Siemens Star Desenfocada W20 = %f', W20);
    title(s)
    
    subplot(1,2,1)
    imagesc(real(OTF));
    title('Real Part OTF')

end


