function [ dYr, dBeta, dy, dtheta ] = imposedDynamics( deltaF, Vx , Yr , Beta , y , theta , kr )
%IMPOSEDDYNAMICS Summary of this function goes here
%   Detailed explanation goes here

% vechielModelPrameters;
  
m  =  2000;  %[kg]  
Iz =  3000;  %[kg*m^2
l  =  3.15;
lf =  1.6;
lr =  1.55;
Kf =  80000; %[N/rad]
Kr = 160000; %[N/rad]

a11 = 1  ;
a12 = 1  ;
a21 = 1  ;
a22 = 1  ;
b11 = 2 * Kf;
b12 = 2 * Kf * lf;
  
  dYr    =  a21 .* Beta + a22 .* Yr + b12 .* deltaF;  
  
  dBeta  =  a11 .* Beta + a12 .* Yr + b11 .* deltaF;
  
  dy     =  Vx  .* sin(theta);

  dtheta =  a11 .* Beta + a12 .* Yr + b11 .* deltaF + kr .* y;

end

