%Variacion de ls esferica


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


for W40=0.0:0.2:4
    % Funcion de pupila correspondiente al desenfoque
    ImgW40 = Esferica(Dim, W40, Radio);
    %PSF
    PSF    = fft2shift(ImgW40);
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
    s = sprintf('Siemens Star Con esférica W40 = %f', W40);
    title(s)
    
    subplot(1,2,1)
    imagesc(real(OTF));
    title('Real Part OTF')

end
