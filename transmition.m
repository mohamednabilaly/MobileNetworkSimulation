function [cin,cout, areaofcell,cellsarray,diameterinarray,diameteroutarray,reuseinarray,reuseoutarray,crtointout,crtointin,PsenIn,PsenOut ] = transmition(user_sensitivity,no_of_channel,userErlang,total_area,powerIn,powerOut,user_density,probBlocking,CImin,lambda)
cellsarray=[];
diameterinarray=[];
diameteroutarray=[];
reuseinarray=[];
reuseoutarray=[];
crtointout = [];
crtointin = [];
PsenIn = [];
PsenOut = [];
cin = [];
cout = [];
% reuse = [1,3,4,7,9,12,13];
for reuseIn=1:1:13
    if(reuseIn==2)
        reuseIn=3;
    end
    if(reuseIn==5||reuseIn==6)
        reuseIn=7;
    end
    if(reuseIn==8)
        reuseIn=9;
    end
    if(reuseIn==10||reuseIn==11)
        reuseIn=12;
    end
    for reuseOut=13:-1:1
        
        if(reuseOut==2)
        reuseOut=3;
    end
    if(reuseOut==5||reuseOut==6)
        reuseOut=7;
    end
    if(reuseOut==8)
        reuseOut=9;
    end
    if(reuseOut==10||reuseOut==11)
        reuseOut=12;
    end
    
        for i=1:no_of_channel-1
         cOut = i;
         cIn = no_of_channel-cOut;
         trIN=floor(cIn/reuseIn);
         trOut=floor(cOut/reuseOut);
         aIn = findrhob(trIN,probBlocking);
         aOut = findrhob(trOut,probBlocking);
         rIN=sqrt((aIn)/(user_density*userErlang*pi));
         rOUT=sqrt((((aOut)/(user_density*userErlang))+(pi*rIN*rIN))/((3*(3^(1/2)))/2));
         pSenIN=powerIn*((lambda/(4*pi*rIN))^2);
         pSenOUT=powerOut*((lambda/(4*pi*rOUT))^2);
          if(CImin<=7)
         if(pSenIN>=user_sensitivity && pSenOUT>=user_sensitivity)
             oneout = (3*reuseOut)/6;
             onein = (3*(rOUT^2)*reuseIn)/(6*(rIN^2));
            
             if(oneout >=CImin && onein>=CImin)
                crtointout(length(cellsarray)+1) = oneout;
                crtointin(length(cellsarray)+1) = onein;
                areaofcell = ((3*sqrt(3))*((rIN+rOUT)^2))/2;
                cellsarray(length(cellsarray)+1) = total_area/areaofcell;
                diameterinarray(length(diameterinarray)+1) = rIN*2;
                diameteroutarray(length(diameteroutarray)+1) = (rOUT)*2;
                reuseinarray(length(reuseinarray)+1)= reuseIn;
                reuseoutarray(length(reuseoutarray)+1)=reuseOut;
                PsenIn(length(PsenIn)+1)=pSenIN;
                PsenOut(length(PsenOut)+1)=pSenOUT;
                 cin(length(PsenIn)+1) = cIn;
                 cout(length(PsenIn)+1) = cOut;
             end
         end
          else
         for reuseOut= 14:30
         trIN=floor(cIn/reuseIn);
         trOut=floor(cOut/reuseOut);
         aIn = findrhob(trIN,probBlocking);
         aOut = findrhob(trOut,probBlocking);
         rIN=sqrt((aIn)/(user_density*userErlang*pi));
         rOUT=sqrt((((aOut)/(user_density*userErlang))+(pi*rIN*rIN))/((3*(3^(1/2)))/2));
         pSenIN=powerIn*((lambda/(4*pi*rIN))^2);
         pSenOUT=powerOut*((lambda/(4*pi*rOUT))^2);
         
                 if(pSenIN>=user_sensitivity && pSenOUT>=user_sensitivity)
                 oneout = (3*reuseOut)/6;
                 onein = (3*(rOUT^2)*reuseIn)/(6*(rIN^2));
                 crtointout(length(cellsarray)+1) = oneout;
                 crtointin(length(cellsarray)+1) = onein;
                 areaofcell = ((3*sqrt(3))*((rIN+rOUT)^2))/2;
                 cellsarray(length(cellsarray)+1) = total_area/areaofcell;
                 diameterinarray(length(diameterinarray)+1) = rIN*2;
                 diameteroutarray(length(diameteroutarray)+1) = (rOUT)*2;
                 reuseinarray(length(reuseinarray)+1)= reuseIn;
                 reuseoutarray(length(reuseoutarray)+1)=reuseOut;
                 PsenIn(length(PsenIn)+1)=pSenIN;
                 PsenOut(length(PsenOut)+1)=pSenOUT;
                 cin(length(PsenIn)+1) = cIn;
                 cout(length(PsenIn)+1) = cOut;
                 
                 end       
                end
                 break;
                     end
            
             
         end
         
        end
   
end
