function [Yvec,isCompleted] = bufferState( x, NeedToReset)
%  Summary of this function goes here
%  Detailed explanation goes here

 persistent xbuffer;
 persistent xbufferTemp;
 persistent cont;
 
 BuffTimeMax = 3; %[sec]
 dt = 0.016;      %[sec]
 idxBufferMax = round(BuffTimeMax / dt);

 if ( isempty(xbuffer) || isempty(cont) || isempty(xbufferTemp) )
     xbuffer = zeros(length(x),idxBufferMax);
     xbufferTemp = zeros(length(x),idxBufferMax-1);
     cont = 0;
 end
 
 if ( NeedToReset == true )     
     isCompleted = false;
     xbuffer = zeros(length(x),idxBufferMax);
     xbufferTemp = xbuffer(:,2:idxBufferMax);
     cont = 0;
 else
     xbufferTemp = xbuffer(:,2:idxBufferMax);
     xbuffer = [xbufferTemp x];
           
     if ( cont >= idxBufferMax)
          cont = idxBufferMax;    
          isCompleted = true;
     else
          isCompleted = false;
          cont = cont + 1  ;
     end
 end
 
 Yvec = xbuffer;
 
end
