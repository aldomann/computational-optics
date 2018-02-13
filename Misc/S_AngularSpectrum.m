% Angular spectrum
clc
clear all
close all
format compact

x=-10:10:10;
y=-5:.1:5;
z=0:.2:20;

beta = 30;
i=0;

lambda = 2;
fac = 2*pi/lambda;

%writerObj = VideoWriter('AngularSpectrum.avi');
%open(writerObj);

f = figure(4);
for beta=0:90
    i=i+1;
    betap = beta*pi/180;
    cb = cos(betap);
    sb = sin(betap);
    
    
    [Y,Z] = meshgrid(y,z);
    YZ = cos(fac*(Z*cb + Y*sb));
    
    [X, Z,Y] = meshgrid(x,z,y);
    XYZ = cos(fac*(Z*cb + Y*sb));
    [nx,ny,nz] = size(XYZ);
    
    
    zslice = -5.00;
    xslice = 0;
    yslice = 0;
    h = slice(X,Z,Y,XYZ,xslice,yslice,zslice);
    xlabel('X')
    ylabel('Z')
    zlabel('Y')
    colormap(gray)
    set(h,'LineStyle','none')
    set(gca,'YDir','rev')
    
    hold on
    xp= [0 0 0];
    yp= [0 0 20];
    zp= [-5 5 5];
    plot3(xp,yp,zp,'b','LineWidth',2)
    
    xp= [0 0];
    yp= [0 5*cb];
    zp= [0 5*sb];
    plot3(xp,yp,zp,'r','LineWidth',2)
    hold off
    
    %frame = getframe(f);
    %writeVideo(writerObj,frame);
    
    pause(0.01)
    
end
%close(writerObj);
