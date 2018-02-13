% Fourier transform of different functions
% 
% Juan Campos
% Universitat Autonoma de Barcelona
% http://grupsderecerca.uab.cat/mipoptilab/

clc;    %Clear command window.
clear all   %Clear variables and functions from memory

format compact

% Size of the matrix
DimX = 256;
DimY = 256;

repetir = 'y';
while (repetir == 'y' || repetir == 'Y')
    
    f = input('select the function: 1=rectangle,  2=circle, 3=triangle, 4=Gaussian, 5=delta, 6=sinus, 7=comb : ');
    
    switch f
        case 1 %Rectangle
            % Size of the rectangle
            SizeX = input('size X: ');
            SizeY = input('size Y: ');
            
            R = zeros(DimY, DimX);
            R(DimY/2 - SizeY/2:DimY/2 + SizeY/2, DimX/2 - SizeX/2:DimX/2 + SizeX/2) = 1;
            
        case 2 % Circle
            % Radius of the circle
            Rad = input('radius of the circle: ');
            
            R = CircularAperture(DimX, Rad);
            
        case 3 % Triangle
            % lado
            Size = input('size: ');
            
            R = Triangulo(DimX, DimX, Size);
            
        case 4 % Gaussian
            % width
            Size = input('width : ');
            
            R = Gausiana(DimX, DimX, Size);
            
        case 5 % Delta
            Shift = input('shift of the delta as a vector [sx, sy] : ');
            R = zeros(DimY, DimX);
            
            R(DimY/2 + Shift(2), DimX/2 + Shift(1)) = 1;
            
        case 6 % Sinusoidal
            Periodo = input('Period : ');
            Tilt = input('rotation : ');
            
            R = RotatedSin(DimX, DimY, Periodo, Tilt);
                        
        case 7% Comb
            Periodo = input('Period : ');
            Orientation = input('Orientation  1=vertical, 2=horizontal : ');
            Shift = input('Shift : ');
            
            R = Comb2D_1(DimX, DimY, Periodo, Orientation, Shift);
    end
    
    TFR = fft2shift(R);
    
    figure
    subplot(2,2,1)
    colormap(gray);
    imagesc(R);
    axis equal tight
    title('Function')
    
    Fase = angle(TFR);
    subplot(2,2,2)
    colormap(gray);
    imagesc(Fase);
    axis equal tight
    title('Phase of the FT')
    
    Modulo = abs(TFR);
    subplot(2,2,3)
    colormap(gray);
    imagesc(Modulo);
    axis equal tight
    title('Modulus of the FT')
    
    subplot(2,2,4)
    colormap(gray);
    imagesc(log10(1+Modulo));
    axis equal tight
    title('log10(1+Modulus) of the FT')
    
    repetir = input('Anoder function? (y/n): ','s');
end
