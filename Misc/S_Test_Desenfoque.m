% Test Desenfoque Siemens

Dim = 512;
Radio = 256;
N   = 64;

% Se genera la estrella de Siemens
Siemens = SiemensStar(Dim, N, 0);
figure(1)
colormap(gray);
axis equal
imagesc(Siemens);
title('Siemens Star')

TFS = fft2shift(Siemens);

% Se genera la OTF iluminación coherente del desenfoque
W20 = 0.0;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(2)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Desenfocada W20=0.0')

% Se genera la OTF iluminación coherente del desenfoque
W20 = 0.5;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(3)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Desenfocada W20=0.5')

W20 = 1;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(4)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Desenfocada W20=1.0')

W20 = 2;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(5)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Desenfocada W20=2.0')

W20 = 4;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(6)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Desenfocada W20=4.0')
