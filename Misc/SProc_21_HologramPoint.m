%% Holografia d'un punt

global ah;

%% Dimensions
% Square Matrix dimension
Ndim = 512;
% Wave lenght in mm
lambda = 633.0e-6;

% Coodinates of the object center in mm
xo = -1.0;
yo = -1.0;
zo = -200;

% Coordinates of the reference center in mm
xr = 1.0;
yr = 0.5;
zr = -300;

% Coordinates of the reconstruction center in mm
xre = 1.0;
yre = 0.5;
zre = -300;

% Sampling distance at the output plane in mm
Sampling = 0.01;
Size = Sampling * Ndim;

% Spherical Wave Object, Reference, & Reconstruction
Po = SphericalWave_Quadratic(Ndim, lambda, xo, yo, zo, Sampling);
Po = Po + SphericalWave_Quadratic(Ndim, lambda, xo+10*Sampling, yo, zo, Sampling);
Po = Po + SphericalWave_Quadratic(Ndim, lambda, xo, yo+15*Sampling, zo, Sampling);

Pr = SphericalWave_Quadratic(Ndim, lambda, xr, yr, zr, Sampling);
Pre = SphericalWave_Quadratic(Ndim, lambda, xre, yre, zre, Sampling);

%% Irradiance at the hologram plane
figure(1)
subplot(1,3,1)
	imagesc(angle(Po));
	colormap(gray);
	axis equal tight


%% Intensity plot
Screen = Po + Pr;
Intensity = abs(Screen).^2;

figure(2)
subplot(1,3,1)
	imagesc(Intensity);
	colormap(gray);
	title('Hologram')
	axis equal tight
subplot(1,3,2)
	imagesc(angle(Screen));
	colormap(gray);
	title('Transmitted Phase')
	axis equal tight
subplot(1,3,3)
	imagesc(abs(Intensity));
	colormap(gray);
	title('Transmitted Amplitude')
	axis equal tight


%% Stuff


%% Propagation for reconstruction

% Recconstruction distances
zi3 = 1.0/(1.0/zre + 1.0/zr - 1.0/zo); % Term 3
zi4 = 1.0/(1.0/zre - 1.0/zr + 1.0/zo); % Term 4

% Magnification
M3 = -(zi3/zo); % Term 3
M4 = (zi4/zo); % Term 4

disp(['Term 3:', sprintf('%f', zi3), ' M = ', sprintf('%f', M3)])
disp(['Term 4:', sprintf('%f', zi4), ' M = ', sprintf('%f', M4)])
disp(['reference: ', sprintf('%f', zre)])

d = zi3 - zi4;

delta = d/100;
d10 = delta * 20;
dab = abs(delta);

% This calls the function "wbmcb" when the mouse is moved in the figure
% This function writes the coordinates of the mouse
h = figure('WindowButtonMotionFcn',@wbmcb);

for z=zi4-d10:delta:zi3+d10
	Rec=FresnelFT(Out, Size, lambda, z); % propagation
	
	titulo = sprintf('Reconstructed Amplitude Distance= %f', z);
	figure(h)
	% subplot(1,3,3)
	colormap(gray);
	imagesc(abs(Rec));
	axis equal tight
	title(titulo)
	
	if(abs(z-zi3) < dab)
		disp(['Term 3: ', sprintf('%f', zi3), ' M = ', sprintf('%f', M3)])
		input('Press enter')
	end
	
	if(abs(z-zi4) < dab)
		disp(['Term 4: ', sprintf('%f', zi4), ' M = ', sprintf('%f', M4)])
		input('Press enter')
	end
	
	if(abs(z-zre) < dab)
		disp(['reference: ', sprintf('%f', zre)])
		input('Press enter')
	end
end