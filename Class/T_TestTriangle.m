figure(1)
	subplot(2,2,1)
	colormap(gray);
	imagesc(log(abs(fft2shift(Rectangle(256,256,254,10)))));
	axis equal tight
	subplot(2,2,2)
	colormap(gray);
	imagesc(log(abs(fft2shift(Rectangle(256,256,254,16)))));
	axis equal tight
	subplot(2,2,3)
	colormap(gray);
	imagesc(log(abs(fft2shift(Rectangle(256,256,254,20)))));
	axis equal tight
	subplot(2,2,4)
	colormap(gray);
	imagesc(log(abs(fft2shift(Rectangle(256,256,254,26)))));
	axis equal tight
