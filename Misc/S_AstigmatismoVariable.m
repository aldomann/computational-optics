%Variacion astigmatismo

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


for W22=0.0:0.05:1
    % Funcion de pupila correspondiente al desenfoque
    ImgW22 = Astigmatismo(Dim, W22, Radio);
    %PSF
    PSF    = fft2shift(ImgW22);
    PSF    = abs(PSF) .^2;
    % OTF
    OTF    = fft2shift(PSF);
    
    %Imagen desenfocada
    TFSD   = TFS .* OTF;
    SiemensD = ifft2shift(TFSD);
    
    figure(2)
    colormap(gray);
    axis equal
    subplot(1,2,2)
    imagesc(real(SiemensD));
    s = sprintf('Siemens Star Con Astigmatismo W22 = %f', W22);
    title(s)
    
    subplot(1,2,1)
    imagesc(real(OTF));
    title('Real Part OTF')

end

input('press enter')


for W22=0.0:0.05:1
    % Funcion de pupila correspondiente al desenfoque
    ImgW22 = Astigmatismo(Dim, W22, Radio);
    ImgW22 = ImgW22.*Desenfoque(Dim, W22, Radio);
    %PSF
    PSF    = fft2shift(ImgW22);
    PSF    = abs(PSF) .^2;
    % OTF
    OTF    = fft2shift(PSF);
    
    %Imagen desenfocada
    TFSD   = TFS .* OTF;
    SiemensD = ifft2shift(TFSD);
    
    figure(2)
    colormap(gray);
    axis equal
    subplot(1,2,2)
    imagesc(real(SiemensD));
    s = sprintf('Siemens Star Con Astigmatismo W22 = %f', W22);
    title(s)
    
    subplot(1,2,1)
    imagesc(real(OTF));
    title('Real Part OTF')

end
