function [Yvec,isCompleted] = bufferState( x, NeedToReset)
%  Summary of this function goes here
%  Detailed explanation goes here

 persistent xbuffer;
 persistent cont;
 
 BuffTimeMax = 3; %[sec]
 dt = 0.016;      %[sec]
 idxBufferMax = round(BuffTimeMax / dt);

 if ( isempty(xbuffer) || isempty(cont) )
     xbuffer = zeros(1,idxBufferMax);
     cont = 0;
 end
 
 if ( NeedToReset == true )     
     isCompleted = false;
     xbuffer = zeros(1,idxBufferMax);
     xbufferTemp = xbuffer(2:idxBufferMax);
     cont = 0;
 else
     xbufferTemp = xbuffer(2:idxBufferMax);
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
