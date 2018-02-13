% Plane Wave
clc 
close all
clear all
format compact

x=-10:10:10;
y=-5:.1:5;
z=0:.2:20;

i=0;

% Wave Length
lambda = 2;
fac = 2*pi/lambda;

%writerObj = VideoWriter('PlaneWave.avi'); 
%open(writerObj);

% Propagation direction
% s = (0, sin beta, cos beta)
beta = 45;

% Temporal frequency
omega = 1;

F = figure;

for t=0:0.2:30
    i=i+1;
    betap = beta*pi/180;
    cb = cos(betap);
    sb = sin(betap);
       
    cap = sprintf('Plane Wave Propagation.   beta=%4.1f   time=%4.1f', beta, t)
    set(F, 'name', cap);
    
    [X, Z, Y] = meshgrid(x,z,y);
    XYZ = cos(fac*(Z*cb + Y*sb) - omega*t);
    [nx,ny,nz] = size(XYZ);
      
    zslice = -5.00;
    xslice = [0 10];
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
    
    %frame = getframe(F);
    %writeVideo(writerObj,frame);
    
    pause(0.01)
    
end
%close(writerObj);
