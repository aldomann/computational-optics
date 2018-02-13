%Test diametro pupila


Dim = 512;
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
Radio = Dim/2;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(2)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim')


% Se genera la OTF iluminación coherente del desenfoque
W20 = 0.0;
Radio = Dim/4;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(3)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/2')

% Se genera la OTF iluminación coherente del desenfoque
W20 = 0.0;
Radio = Dim/8;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(4)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/4')

% Se genera la OTF iluminación coherente del desenfoque
W20 = 0.0;
Radio = Dim/16;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(5)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/8')


% Se genera la OTF iluminación coherente del desenfoque
W20 = 0.0;
Radio = Dim/32;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(6)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/16')

