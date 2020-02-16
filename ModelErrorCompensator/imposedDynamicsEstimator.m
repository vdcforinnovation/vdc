function [ Yr_est Beta_est y_est theta_est isEstValid ] = imposedDynamicsEstimator( deltaF, Vx , Yr , Beta , y ,theta , kr, isSensorValid,Time_Buff)
%IMPOSEDDYNAMICSESTIMATOR Summary of this function goes here
%   Detailed explanation goes here

if isSensorValid == true
  deltaF_buff = deltaF;
  Vx_buff     = Vx;
  Yr_buff     = Yr;
  Beta_buff   = Beta;
  y_buff      = y;
  theta_buff  = theta;
  kr_buff     = kr;
  NeedToReset = false;
else
  deltaF_buff = 0;
  Vx_buff     = 0;
  Yr_buff     = 0;
  Beta_buff   = 0;
  y_buff      = 0;
  theta_buff  = 0;
  kr_buff     = 0;
  NeedToReset = true; 
end   

% ToDo ????Buffering???????????????????

% ToDo ?????????????????????????
[ deltaF_vec deltaFisCompleted] = bufferState( deltaF_buff, NeedToReset);
[ Vx_vec     VxisCompleted]     = bufferState( Vx_buff, NeedToReset);
[ Yr_vec     YrisCompleted]     = bufferState( Yr_buff, NeedToReset);
[ Beta_vec   BetaisCompleted]   = bufferState( beta_buff, NeedToReset);
[ y_vec      yisCompleted]      = bufferState( y_buff, NeedToReset);
[ theta_buff thetaisCompleted]  = bufferState( theta_buff, NeedToReset);
[ kr_buff    krisCompleted]     = bufferState( k_buff, NeedToReset);

isEstValid = (  ( deltaFisCompleted ) ...
              &&( VxisCompleted ) ...
              &&( YrisCompleted ) ...
              &&( BetaisCompleted )...
              &&( yisCompleted )...
              &&( thetaisCompleted )...
              &&( krisCompleted ) );
              
Yr_base    = Yr_vec(1);
beta_base  = Beta_vec(1);
y_base     = y_vec(1);
theta_base = theta_vec(1);

dt = 0.016;
idxBuff = round(Time_Buff/dt);

[ dYr dBeta dy dtheta] = imposedDynamics( delatF_vec, Vx_vec, Yr_vec, Beta_vec, y_vec, theta_vec, kr_vec);  

dt = 0.016;

for i=1:length(Yr_vec); 
  if i==1
    Yr_est_vec(i)    = Yr_base;
    Beta_est_vec(i)  = beta_base;
    y_est_vec(i)     = y_base;
    theta_est_vec(i) = theta_base;
  else
    Yr_est_vec(i)    = Yr_est_vec(i-1)    + dYr(i) * dt;
    Beta_est_vec(i)  = Beta_est_vec(i-1)  + dBeta(i) * dt;    
    y_est_vec(i)     = y_est_vec(i-1)     + dy(i) * dt;    
    theta_est_vec(i) = theta_est_vec(i-1) + dtheta(i) * dt;    
  end  
end

Yr_est = Yr_est_vec(idxBuff);
Beta_est = Beta_est_vec(idxBuff);
y_est    = y_est_vec(idxBuff);
theta_est = theta_est_vec(idxBuff);

end

