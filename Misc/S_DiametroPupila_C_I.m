% Diametro pupila Coherente/Incoherente


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
subplot(1,2,1)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim Coherent')

IOTF = IncoherentOTF(ImgW20);

TFSD = TFS .* IOTF;
SiemensD = ifft2shift(TFSD);
subplot(1,2,2)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim INcoherent')

%============================================================
% Se genera la OTF iluminación coherente del desenfoque
W20 = 0.0;
Radio = Dim/4;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(3)
subplot(1,2,1)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/2 Coherent')

IOTF = IncoherentOTF(ImgW20);

TFSD = TFS .* IOTF;
SiemensD = ifft2shift(TFSD);
subplot(1,2,2)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/2 INcoherent')

%============================================================



% Se genera la OTF iluminación coherente del desenfoque
W20 = 0.0;
Radio = Dim/8;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(4)
subplot(1,2,1)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/4 Coherent')

IOTF = IncoherentOTF(ImgW20);

TFSD = TFS .* IOTF;
SiemensD = ifft2shift(TFSD);
subplot(1,2,2)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/4 INcoherent')

%============================================================



% Se genera la OTF iluminación coherente del desenfoque
W20 = 0.0;
Radio = Dim/16;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(5)
subplot(1,2,1)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/8 Coherent')

IOTF = IncoherentOTF(ImgW20);

TFSD = TFS .* IOTF;
SiemensD = ifft2shift(TFSD);
subplot(1,2,2)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/8 INcoherent')

%============================================================




% Se genera la OTF iluminación coherente del desenfoque
W20 = 0.0;
Radio = Dim/32;
ImgW20 = Desenfoque(Dim, W20, Radio);

TFSD = TFS .* ImgW20;
SiemensD = ifft2shift(TFSD);

figure(6)
subplot(1,2,1)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/16 Coherent')

IOTF = IncoherentOTF(ImgW20);

TFSD = TFS .* IOTF;
SiemensD = ifft2shift(TFSD);
subplot(1,2,2)
colormap(gray);
axis equal
imagesc(real(SiemensD));% + min(min(real(SiemensD))));
title('Siemens Star Diametro = Dim/16 INcoherent')

%============================================================

