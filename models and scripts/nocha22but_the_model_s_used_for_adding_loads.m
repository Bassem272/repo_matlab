clc, 
clearvars;
%error msg A;nota.slx is the original besides notch1.slx
%and we have nocha22nota.m and nocha22but----also very important 888 
% ***in task date is 13/5/2023 model name is 'notch2_load_add.slx we will
% call it the data i mean is lasti.dat
%nocha22.m we will make the esxpermints of the fault is 3lG and in the
%point  between 3 km and 2.78 km line 1
warning on;
mODL_NAME = 'notch1_load_add'; %we added 2700 MW to the resisitive load which was 500e3 watt the time .4s
% TRUE ":thw switch time is .6 s the range of new load is increased over 4.3 MW is from 100e3 to 2000e3 watt
%first attempt is 960 simulations saved in file newera1.mat 1920 row in th
%form of 1920x 3921 960 from Newetra1)) and 960 from
%cust7mega_line1_100ohm.slx
%FOR TRAINING WE USED IN CUST7MEGA WE USED TABLEI AND TABLEICOPY "FOR
%NEWERA1 WE USED TABLEICURRENT AND TABLEICOPYCC WEB WILL TAKE 5% OF THE
%DATA AS TESTING ABOUT 100 ROW 401 ;425 AND 801;825 AND 1401;1425 AND
%1801;1825 THE NAME OF TEST DATA IS tableCopyCC1 holdoutwith 25% like the
%before||| @@@ data_load_data.mat@@@-----****/////most important
% 1= ENSEMBLE WAS USED IN THE FIRST ATTEMPT FOR TRAINING and showed
%success
%---load add sim data 16100kw----tableiFault100++++rzqi has two one is
%faulted and 2 is load add all data in lastti.dat
load_system(mODL_NAME);
find_system(mODL_NAME);

Num=3;        % number of population
 
  %%##active power load generation
  p=200e3+(2000e3-10e3).*rand(1,Num)
  %###
  
[ind, cap] = calc_reactiver(p);

reac = calc_reactive_power(p);

  
 
   
    All_length= 1:Num;
len=length(All_length);


for N=1:len
react(N)=reac(N)
indc(N)=ind(N)
capc(N)=cap(N)
        simin(N) = Simulink.SimulationInput(mODL_NAME);   
simin(N)= simin(N).setBlockParameter('notch1_load_add/test','ActivePower',num2str(react(N))) 
simin(N)= simin(N).setBlockParameter('notch1_load_add/test','InductivePower',num2str(indc(N))) 
simin(N)= simin(N).setBlockParameter('notch1_load_add/test','CapacitivePower',num2str(capc(N))) 

    simin(N) = simin(N).setPostSimFcn(@(x) postsim(x));
end  
 out = sim(simin)
   valc=[out.x].';
   valv=[out.q].';
   vala=[out.asd].';
   valo=[out.asd1].';
   vale=[out.asd2].';
   
   
          tablei=[valc]%;valc1;valc2];
          tablev=[valv]%;valv1;valv2];
          tablea=[vala]%;vala1;vala2];
          tableo=[valo]%;valo1;valo2];
          tablee=[vale]%;vale1;vale2];
          
          
function newout = postsim(out)
save('newera1ww.mat')





function reac = calc_reactive_power(p)
% Calculates the reactive power for an array of active power values.
% Assumes a power factor of 0.85 and a frequency of 50 Hz.

% Constants for the calculation
pf = 0.85;
f = 50; % Hz
V = 10000; % V (assuming a line-to-line voltage of 10 kV)
% Calculate the apparent power for each active power value
apparent_power = p ./ pf;

% Calculate the reactive power for each apparent power value
reac = sqrt(apparent_power.^2 - p.^2);

% Calculate the inductive and capacitive reactive power for each value
inductive_power = reac / 2;
capacitive_power = reac / 2;

% Calculate the inductance and capacitance for each value
inductance = inductive_power ./ (2*pi*f*V^2);
capacitance = 1 ./ (2*pi*f*V^2*inductance);

% Return the reactive power array
reac = inductive_power + capacitive_power;
end



function [ind, cap] = calc_reactiver(p)
% Calculates the inductive and capacitive reactive power for an array of active power values.
% Assumes a power factor of 0.85 and a frequency of 50 Hz.

% Constants for the calculation
pf = 0.85;
f = 50; % Hz
V = 10000; % V (assuming a line-to-line voltage of 10 kV)

% Calculate the apparent power for each active power value
apparent_power = p ./ pf;

% Calculate the reactive power for each apparent power value
reactive_power = sqrt(apparent_power.^2 - p.^2);

% Calculate the inductive and capacitive reactive power for each value
ind = reactive_power / 2;
cap = reactive_power / 2;

% Calculate the inductance and capacitance for each value
inductance = ind ./ (2*pi*f*V^2);
capacitance = 1 ./ (2*pi*f*V^2*inductance);

% Return the inductive and capacitive reactive power arrays
end




function newout = postsim(out)
%newout.x = out.i1;


currentA =out.i1;
currentB =out.i2;
currentC = out.i3;
wv = 'db4';
Fs = 3200;
fb = dwtfilterbank('Wavelet',wv,'Level',4,'SamplingFrequency',Fs);
[cA1, LA1] = wavedec(currentA, 1, 'db4');
[cB1, LB1] = wavedec(currentB, 1, 'db4');
[cC1, LC1] = wavedec(currentC, 1, 'db4');
[cA2, LA2] = wavedec(currentA, 2, 'db4');
[cB2, LB2] = wavedec(currentB, 2, 'db4');
[cC2, LC2] = wavedec(currentC, 2, 'db4');
[cA3, LA3] = wavedec(currentA, 3, 'db4');
[cB3, LB3] = wavedec(currentB, 3, 'db4');
[cC3, LC3] = wavedec(currentC, 3, 'db4');
[cA4, LA4] = wavedec(currentA, 4, 'db4');
[cB4, LB4] = wavedec(currentB, 4, 'db4');
[cC4, LC4] = wavedec(currentC, 4, 'db4');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[cA6, LA6] = wavedec(currentA, 6, 'db4');
[cB6, LB6] = wavedec(currentB, 6, 'db4');
[cC6, LC6] = wavedec(currentC, 6, 'db4');
[af,aj] = wenergy(cA6, LA6);
[bf,bj] = wenergy(cB6, LB6);
[cf,cj] = wenergy(cC6, LC6);
v=aj+bj+cj;
ae1=sum(aj);
ae2=sum(bj);
ae3=sum(cj);
newout.asd1=[ae1 ,ae2 ,ae3];%%%%$$$
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dA1 = detcoef(cA1, LA1, 1);
dB1 = detcoef(cB1, LB1, 1);
dC1 = detcoef(cC1, LC1, 1);
dA2 = detcoef(cA2, LA2,2);
dB2 = detcoef(cB2, LB2, 2);
dC2 = detcoef(cC2, LC2, 2);
dA3 = detcoef(cA3, LA3, 3);
dB3 = detcoef(cB3, LB3, 3);
dC3 = detcoef(cC3, LC3, 3);
dA4 = detcoef(cA4, LA4, 4);
dB4 = detcoef(cB4, LB4, 4);
dC4 = detcoef(cC4, LC4, 4);
aA4 = appcoef(cA4, LA4,'db4', 4);
aB4 = appcoef(cB4, LB4,'db4', 4);
aC4 = appcoef(cC4, LC4,'db4' ,4);
aA1 = appcoef(cA1, LA1,'db4', 1);
aB1 = appcoef(cB1, LB1,'db4', 1);
aC1 = appcoef(cC1, LC1,'db4' ,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wv = 'db4';
Fs = 12500;
fb = dwtfilterbank('Wavelet',wv,'Level',10,'SamplingFrequency',Fs);
[nA6, mA6] = wavedec(currentA, 10, 'db4');
[nB6, mB6] = wavedec(currentB, 10, 'db4');
[nC6, mC6] = wavedec(currentC,10, 'db4');
[aq,ak] = wenergy(nA6, mA6);
[bq,bk] = wenergy(nB6, mB6);
[cq,ck] = wenergy(nC6, mC6);
v=ak+bk+ck;
ab1=sum(ak);
ab2=sum(bk);
ab3=sum(ck);
newout.asd2=[ab1 ,ab2 ,ab3];%%%%$$$
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w1 =out.v1;
w2 =out.v2;
w3 = out.v3;
wv = 'db4';
Fs = 3200;
fb = dwtfilterbank('Wavelet',wv,'Level',4,'SamplingFrequency',Fs);

[ca1, La1] = wavedec(w1, 1, 'db4');
[cb1, Lb1] = wavedec(w2, 1, 'db4');
[cc1, Lc1] = wavedec(w3, 1, 'db4');
[ca2, La2] = wavedec(w1, 2, 'db4');
[cb2, Lb2] = wavedec(w2, 2, 'db4');
[cc2, Lc2] = wavedec(w3, 2, 'db4');
[ca3, La3] = wavedec(w1, 3, 'db4');
[cb3, Lb3] = wavedec(w2, 3, 'db4');
[cc3, Lc3] = wavedec(w3, 3, 'db4');
[ca4, La4] = wavedec(w1, 4, 'db4');
[cb4, Lb4] = wavedec(w2, 4, 'db4');
[cc4, Lc4] = wavedec(w3, 4, 'db4');
da1 = detcoef(ca1, La1, 1);
db1 = detcoef(cb1, Lb1, 1);
dc1 = detcoef(cc1, Lc1, 1);
da2 = detcoef(ca2, La2,2);
db2 = detcoef(cb2, Lb2, 2);
dc2 = detcoef(cc2, Lc2, 2);
da3 = detcoef(ca3, La3, 3);
db3 = detcoef(cb3, Lb3, 3);
dc3 = detcoef(cc3, Lc3, 3);
%level 4 detail
da4 = detcoef (ca4, La4, 4);
db4 = detcoef(cb4, Lb4, 4);
dc4 = detcoef(cc4, Lc4, 4);
%level 4 approximation
aa4 = appcoef(ca4, La4,'db4', 4);
ab4 = appcoef(cb4, Lb4,'db4', 4);
ac4 = appcoef(cc4, Lc4,'db4' ,4);
in1=[aA4 ;dA4 ; dA3 ;  dA2 ; dA1 ];
in2=[aB4; dB4 ; dB3 ;  dB2 ; dB1];
in3=[aC4; dC4 ; dC3 ; dC2 ; dC1];
newout.q=[aa4;da4 ;da3 ; da2; da1; ab4;db4 ;db3 ; db2; db1;ac4;dc4 ;dc3 ; dc2; dc1];
newout.x=[aA4 ;dA4 ; dA3 ;  dA2 ; dA1 ; aB4; dB4 ; dB3 ;  dB2 ; dB1; aC4; dC4 ; dC3 ; dC2 ; dC1];







k1 =in1;
k2 =in2;
k3 = in3;
%Obtain the percentages of energy in the approximation and details coefficients.
wv = 'db4';
Fs = 12500;
fb = dwtfilterbank('Wavelet',wv,'Level',10,'SamplingFrequency',Fs);
[ga6, ha6] = wavedec(k1, 6, 'db4');
[gb6, hb6] = wavedec(k2, 6, 'db4');
[gc6, hc6] = wavedec(k3, 6, 'db4');
[aa,ad] = wenergy(ga6,ha6);
[ba,bd] = wenergy(gb6,hb6);
[ca,cd] = wenergy(gc6,hc6);
v=ad+bd+cd;
as1=sum(ad);
as2=sum(bd);
as3=sum(cd);
newout.asd=[as1 ,as2 ,as3];
%s.e = pentropy(Ed)
%Ed = 1×4
  %  2.1560    1.2286    1.4664    6.8630

%%Obtain the wavelet packet tree corresponding to the 3-level wavelet packet decomposition of the signal using the sym4 wavelet.
%t = wpdec(noisbump,3,wv);
%Obtain the percentages of energy in the terminal nodes.

%e = wenergy(t)
end

