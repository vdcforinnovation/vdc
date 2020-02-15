function [ dYr dBeta dy dtheta ] = imposedDynamics( deltaF, Vx , Yr , Beta , y , theta , kr )
%IMPOSEDDYNAMICS Summary of this function goes here
%   Detailed explanation goes here

  vechielModelPrameters;
  
  dYr    =  a21 .* Beta + a22 .* Yr + b12 .* deltaF;  
  
  dBeta  =  a11 .* Beta + a12 .* Yr + b11 .* deltaF;
  
  dy     =  Vx  .* sin(theta);

  dtheta =  a11 .* Beta + a12 .* Yr + b11 .* deltaF + kr .* y;

end

