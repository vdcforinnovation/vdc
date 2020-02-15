function [Yvec isCompleted] = bufferState( x, NeedToReset )
%  Summary of this function goes here
%  Detailed explanation goes here

 persistent xbuffer;
 persistent xbufferTemp;
 persistent cont;
 
 BuffTime = 5;
 dt = 0.016;
 bufferMax = round(BuffTime / dt);
 
 if ( isempty(xbuffer) || isempty(xbufferTemp)||isempty(cont))
     xbuffer = zeros(bufferMax + 1,1);
     xbufferTemp = zeros(bufferMax,1);
     cont = 0;
 end

 if ( NeedToReset == true )     
     isCompleted = false;
     xbuffer = zeros(bufferMax + 1,1);
     xbufferTemp = zeros(bufferMax,1);
     cont = 0;
 else
     xbufferTemp = xbuffer(2:bufferMax+1);
     xbuffer = [xbufferTemp;x];  
    
     if ( cont >= bufferMax)
          cont = bufferMax;    
          isCompleted = true;
     else
          isCompleted = false;
          cont = cont + 1  ;
     end
 end
 
 Yvec = xbufferTemp;
 
end

