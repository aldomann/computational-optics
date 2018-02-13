% Test Desenfoque Coherent/Incoherent

Dim = 512;
Radio = 128;
N   = 64;

% Se genera la estrella de Siemens
Siemens = SiemensStar(Dim, N, 0);
figure(1)
colormap(gray);
axis equal
imagesc(Siemens);
title('Siemens Star')

TFS = fft2shift(Siemens);

for W20=0:0.05:2.5
    ImgW20 = Desenfoque(Dim, W20, Radio);

    TFSD = TFS .* ImgW20;
    SiemensD = ifft2shift(TFSD);

    figure(2)
    subplot(1,2,1)
    colormap(gray);
    axis equal
    imagesc(real(SiemensD));
    title('Coherent')
    
    IOTF = IncoherentOTF(ImgW20);

    TFSD = TFS .* IOTF;
    SiemensD = ifft2shift(TFSD);
    subplot(1,2,2)
    colormap(gray);
    axis equal
    imagesc(real(SiemensD));% + min(min(real(SiemensD))));
    title('INcoherent')
end

