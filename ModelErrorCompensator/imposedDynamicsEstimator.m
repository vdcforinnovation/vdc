function [ Yr_est, Beta_est, y_est, theta_est, isEstValid ] = imposedDynamicsEstimator( deltaF,Vx,Yr , Beta , y ,theta , kr, isSensorValid,Time_Buff)
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

BuffIn = [ deltaF_buff;...
           Vx_buff    ;...
           Yr_buff    ;...
           Beta_buff  ;...
           y_buff     ;...
           theta_buff ;...
           kr_buff]   ;

[StateBuff_vec, isBuffCompleted] = bufferState( BuffIn, NeedToReset );

deltaF_vec = StateBuff_vec(1,:);
Vx_vec = StateBuff_vec(2,:);
Yr_vec = StateBuff_vec(3,:);
Beta_vec = StateBuff_vec(4,:);
y_vec = StateBuff_vec(5,:);
theta_vec = StateBuff_vec(6,:);
kr_vec = StateBuff_vec(7,:);

[ dYr, dBeta, dy, dtheta] = imposedDynamics( deltaF_vec, Vx_vec, Yr_vec, Beta_vec, y_vec, theta_vec, kr_vec);  

% Initialize vecotr
Yr_est_vec      = zeros(1,length(Yr_vec));
Beta_est_vec    = zeros(1,length(Beta_vec));
y_est_vec       = zeros(1,length(y_vec));
theta_est_vec   = zeros(1,length(theta_vec));

dt = 0.016;

isEstValid = isBuffCompleted;

if isEstValid == true
 for i=1:length(Yr_vec)-1; 
  if i==1
    Yr_est_vec(i)    = Yr_vec(i);
    Beta_est_vec(i)  = Beta_vec(i);
    y_est_vec(i)     = y_vec(i);
    theta_est_vec(i) = theta_vec(i);
  else
    Yr_est_vec(i+1)    = Yr_est_vec(i)    + dYr(i) * dt;
    Beta_est_vec(i+1)  = Beta_est_vec(i)  + dBeta(i) * dt;    
    y_est_vec(i+1)     = y_est_vec(i)     + dy(i) * dt;    
    theta_est_vec(i+1) = theta_est_vec(i) + dtheta(i) * dt;    
  end  
 end
end


TimeBuffMax = 3;

if Time_Buff >= TimeBuffMax;
    Time_Buff = TimeBuffMax;
end

idxBuff = round(Time_Buff/dt);

Yr_est = Yr_est_vec(idxBuff);
Beta_est = Beta_est_vec(idxBuff);
y_est    = y_est_vec(idxBuff);
theta_est = theta_est_vec(idxBuff);

end

