function [ AyTgt_MEC_Yr AyTgt_MEC_y  AyTgt_MEC_theta] = modelErrorCompensator( deltaF, Vx , Yr , Beta , y ,theta , kr, isSensorValid ,Kyr,Ky,Ktheta,Time_Buff)
%MODELERRORCOMPENSATOR Summary of this function goes here
%   Detailed explanation goes here

% ToDo  
% ?????????????????????????

[ Yr_est Beta_est y_est theta_est isEstCompleated ] = imposedDynamicsEstimator( deltaF, Vx , Yr , Beta , y ,theta , kr, isSensorValid,Time_Buff);

if isEstCompleated == true
  AyTgt_MEC_Yr    = Kyr    * ( Yr_est(length(Yr_est))       - Yr    );
  AyTgt_MEC_y     = - Ky     * ( y_est(length(y_est))         - y     );
  AyTgt_MEC_theta = - Ktheta * ( theta_est(length(theta_est)) - theta );
else
  AyTgt_MEC_Yr    = 0;
  AyTgt_MEC_y     = 0;
  AyTgt_MEC_theta = 0;
end

end

