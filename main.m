clear all 


user_sensitivity=-120 ;
user_sens=db2pow(user_sensitivity);
no_of_channel=100;
userErlang=1/144;
total_area=450000000;
powerIn=1;
powerOut=2;
user_density=2;
probBlocking=0.005;
CImin=3;
lambda=(3*(10^8))/(1.8*(10^9));
[ cin ,cout,areaofcell, no_of_cells, diameterIN, diameterOUT, reuseInnn, reuseOuttt, crtointout, crtointin, PsenIn, PsenOut ]=transmition(user_sens, no_of_channel, userErlang, total_area, powerIn, powerOut, user_density, probBlocking, CImin, lambda);
[leastcells,inx] = min(no_of_cells);
ctout = crtointout(inx);
ctin = crtointin(inx);
PsensitivityIn = PsenIn(inx);
psensitivityout = PsenOut(inx);
DiameterIn=diameterIN(inx);
DiameterOut=diameterOUT(inx);
reusei=reuseInnn(inx);
reuseo=reuseOuttt(inx);
cinn =cin(inx);
coutt = cout(inx);