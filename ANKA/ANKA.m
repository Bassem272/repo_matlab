clc, 
clearvars;
%error msg A;
%error msg A;nota.slx is the original besides notch1.slx
%and we have nocha22nota.m and nocha22but----also very important 888 
% ***in task date is 13/5/2023 model name is 'notch2_load_add.slx we will
% call it the data i mean is lasti.dat the file @@ contains the pics is
% load add 135 and in it fault sim.dat @@fault simdata100ohm.mat
%nocha22.m we will make the esxpermints of the fault is 3lG and in the
%point  between 3 km and 2.78 km line 1 fault is 3 phase and rfault=100ohm
%switch time is .06s and time frame of simulation =.4s

%%then we added a load of 16100 kw  and its relative values but 
%load addsim data 16100kw.dat


%day14/5/2023 we will add faults on line 8 in the same point of the added
%load the data is faultline8.dat 100ohm 300 sims 2001 to 2020
% traimning 2099 and last 280 are for the last purpose testing  121 last 20
% are for the last purpose THE RESULTS ARE SUCCESS Model name is
% MODELlastii

warning on;
mODL_NAME = 'ANKAis';

load_system(mODL_NAME);
find_system(mODL_NAME);
open_system(mODL_NAME)

N=3;        % number of population
  


time=.06+(.07-.06).*rand(1,N)

p=200e3+(2000e3-10e3).*rand(1,N)
  %###
  
[ind, cap] = calc_reactiver(p);

reac = calc_reactive_power(p);

  l1=5.87
    l2=.95
      l3=4.47
        l4=1.47
   c={'FaultA';'FaultA';'FaultA'}

    S={'FaultA';'FaultB';'FaultB'}
    
    V={'FaultA';'FaultB';'FaultC'}
  
    x1={.05*l1;.1*l1;.15*l1;.2*l1;.25*l1;.3*l1;.35*l1;.4*l1;.45*l1;.5*l1;.55*l1;.6*l1;.65*l1;.7*l1;.75*l1;.8*l1;.85*l1;.9*l1;.95*l1}
z1={.95*l1;.9*l1;.85*l1;.8*l1;.75*l1;.7*l1;.65*l1;.6*l1;.55*l1;.5*l1;.45*l1;.4*l1;.35*l1;.3*l1';.25*l1;.2*l1;.15*l1;.1*l1;.05*l1}
 
 x2={.05*l2;.1*l2;.15*l2;.2*l2;.25*l2;.3*l2;.35*l2;.4*l2;.45*l2;.5*l2;.55*l2;.6*l2;.65*l2;.7*l2;.75*l2;.8*l2;.85*l2;.9*l2;.95*l2}
z2={.95*l2;.9*l2;.85*l2;.8*l2;.75*l2;.7*l2;.65*l2;.6*l2;.55*l2;.5*l2;.45*l2;.4*l2;.35*l2;.3*l2';.25*l2;.2*l2;.15*l2;.1*l2;.05*l2}
 
  x3={.05*l3;.1*l3;.15*l3;.2*l3;.25*l3;.3*l3;.35*l3;.4*l3;.45*l3;.5*l3;.55*l3;.6*l3;.65*l3;.7*l3;.75*l3;.8*l3;.85*l3;.9*l3;.95*l3}
z3={.95*l3;.9*l3;.85*l3;.8*l3;.75*l3;.7*l3;.65*l3;.6*l3;.55*l3;.5*l3;.45*l3;.4*l3;.35*l3;.3*l3;.25*l3;.2*l3;.15*l3;.1*l3;.05*l3}
 
x4={.05*l3;.1*l3;.15*l3;.2*l3;.25*l3;.3*l3;.35*l3;.4*l3;.45*l3;.5*l3;.55*l3;.6*l3;.65*l3;.7*l3;.75*l3;.8*l3;.85*l3;.9*l3;.95*l3}
z4={.95*l3;.9*l3;.85*l3;.8*l3;.75*l3;.7*l3;.65*l3;.6*l3;.55*l3;.5*l3;.45*l3;.4*l3;.35*l3;.3*l3;.25*l3;.2*l3;.15*l3;.1*l3;.05*l3}
    
d=[1 0 0;1 1 0;1 1 1]


b=round(N/3)+1
g=round(N/19)+1
D=repmat(d,b,1)%output

l=rand(N,1)
  R=rand(N,1)
  
  F=repmat(c,b,1)
      f=repmat(S,b,1)
       ff=repmat(V,b,1)
      
     
       vv1=repmat(x1,g,1)
         zz1=repmat(z1,g,1)
          vv2=repmat(x2,g,1)
           zz2=repmat(z2,g,1)
             vv3=repmat(x3,g,1)
               zz3=repmat(z3,g,1)
             vv4=repmat(x3,g,1)
               zz4=repmat(z3,g,1)
   
    All_length= 1:N;
len=length(All_length);


minSNR = 2.94;
maxSNR = 50;





%for line 1 faults
for N=1:len
   
    time(N)=ti(N)
    lineone(N)=vv1(N);
    linel(N)=zz1(N);
    
 Fr1(N)=R(N)*100;  % range of 100 ohm
    fault(N)= F(N)
        fault2(N)=f(N)
            fault3(N)=ff(N)
        
 simin(N) = Simulink.SimulationInput(mODL_NAME);
   
    
  simin(N)=  simin(N).setBlockParameter('ANKAis/line1','length',string(lineone(N)))
    simin(N)=  simin(N).setBlockParameter('ANKAis/line1.1','length',string(linel(N)))

    simin(N)= simin(N).setBlockParameter('ANKAis/fault1','SwitchTimes',num2str(ti(N))) 
        simin(N)= simin(N).setBlockParameter('ANKAis/fault1','Faultresistance',num2str(Fr1(N))) 
           simin(N)= simin(N).setBlockParameter('ANKAis/fault1',char(fault(N)), 'on')
              simin(N)= simin(N).setBlockParameter('ANKAis/fault1',char(fault2(N)), 'on')
                 simin(N)= simin(N).setBlockParameter('ANKAis/fault1',char(fault3(N)), 'on')
                     simin(N)= simin(N).setBlockParameter('ANKAis/fault1','GroundFault', 'on')
    simin(N) = simin(N).setPostSimFcn(@(x) postsim(x));


   
  
end  
 out = sim(simin)
   valc=[out.x].';
   valv=[out.q].';
   vala=[out.asd].';
   valo=[out.asd1].';
   vale=[out.asd2].';
   
   % i1 = out.i1;i2 = out.i2;i3 = out.i3;
simin = Simulink.SimulationInput(mODL_NAME);%             fi=@cfi; 
 simin= simin.setBlockParameter('ANKAis/fault1','FaultA', 'off');
  simin= simin.setBlockParameter('ANKAis/fault1','FaultB', 'off');
   simin= simin.setBlockParameter('ANKAis/fault1','FaultC', 'off');
    simin= simin.setBlockParameter('ANKAis/fault1','GroundFault', 'off');%             y = fi(i1,i2,i3);
%             table1(N,:)=y;

%for line 2 faults
for N=1:len
   
    time(N)=ti(N)
    lineone(N)=vv2(N);
    linel(N)=zz2(N);
 
    Fr1(N)=R(N)*100;  % range of 100 ohm
    fault(N)= F(N)
      fault2(N)=f(N)
        fault3(N)=ff(N)
        
 simin(N) = Simulink.SimulationInput(mODL_NAME);
   
    
   simin(N)=  simin(N).setBlockParameter('ANKAis/line2','length',string(lineone(N)))
      simin(N)=  simin(N).setBlockParameter('ANKAis/line2.1','length',string(linel(N)))

      simin(N)= simin(N).setBlockParameter('ANKAis/fault2','SwitchTimes',num2str(ti(N))) 
         simin(N)= simin(N).setBlockParameter('ANKAis/fault2','Faultresistance',num2str(Fr1(N)))
            simin(N)= simin(N).setBlockParameter('ANKAis/fault2',char(fault(N)), 'on')
               simin(N)= simin(N).setBlockParameter('ANKAis/fault2',char(fault2(N)), 'on')
                 simin(N)= simin(N).setBlockParameter('ANKAis/fault2',char(fault3(N)), 'on')
                   simin(N)= simin(N).setBlockParameter('ANKAis/fault2','GroundFault', 'on')
   simin(N) = simin(N).setPostSimFcn(@(x) postsim(x));

%     i1 = out.i1;i2 = out.i2;i3 = out.i3;
%             fi=@cfi; 
%             y = fi(i1,i2,i3);
%             table2(N,:)=y;
%   
%qwe is important for test date range
end  
out=sim(simin)%,'ShowSimulationManager','on')
valc1=[out.x].';
   valv1=[out.q].';
   vala1=[out.asd].';
   valo1=[out.asd1].';
   vale1=[out.asd2].';
simin = Simulink.SimulationInput(mODL_NAME);%             fi=@cfi; 
 simin= simin.setBlockParameter('ANKAis/fault2','FaultA', 'off')
  simin= simin.setBlockParameter('ANKAis/fault2','FaultB', 'off')
   simin= simin.setBlockParameter('ANKAis/fault2','FaultC', 'off')
   simin= simin.setBlockParameter('ANKAis/fault2','GroundFault', 'off')
   %for line 3 faults
for N=1:len
   
    time(N)=ti(N)
    lineone(N)=vv3(N);
    linel(N)=zz3(N);
 
    Fr1(N)=R(N)*100;   % range of 100 ohm
       fault(N)= F(N)
          fault2(N)=f(N)
             fault3(N)=ff(N)
        
 simin(N) = Simulink.SimulationInput(mODL_NAME);
   
    
   simin(N)=  simin(N).setBlockParameter('ANKAis/line3','length',string(lineone(N)))
     simin(N)=  simin(N).setBlockParameter('ANKAis/line3.1','length',string(linel(N)))

     simin(N)= simin(N).setBlockParameter('ANKAis/fault3','SwitchTimes',num2str(ti(N))) 
         simin(N)= simin(N).setBlockParameter('ANKAis/fault3','Faultresistance',num2str(Fr1(N)))  
              simin(N)= simin(N).setBlockParameter('ANKAis/fault3',char(fault(N)), 'on')
                    simin(N)= simin(N).setBlockParameter('ANKAis/fault3',char(fault2(N)), 'on')
                          simin(N)= simin(N).setBlockParameter('ANKAis/fault3',char(fault3(N)), 'on')
                             simin(N)= simin(N).setBlockParameter('ANKAis/fault3','GroundFault', 'on')
  simin(N) = simin(N).setPostSimFcn(@(x) postsim(x));

%     i1 = out.i1;i2 = out.i2;i3 = out.i3;
%             fi=@cfi; 
%             y = fi(i1,i2,i3);
%             table3(N,:)=y;
  

end  
out=sim(simin)%,'ShowSimulationManager','on')
valc2=[out.x].';
   valv2=[out.q].';
  vala2=[out.asd].';
   valo2=[out.asd1].';
   vale2=[out.asd2].';
 
   
   
simin = Simulink.SimulationInput(mODL_NAME);%             fi=@cfi; 
 simin= simin.setBlockParameter('ANKAis/fault3','FaultA', 'off')
  simin= simin.setBlockParameter('ANKAis/fault3','FaultB', 'off')
   simin= simin.setBlockParameter('ANKAis/fault3','FaultC', 'off')
   simin= simin.setBlockParameter('ANKAis/fault3','GroundFault', 'off')

   
   %FOR FAULT AT the place of load adding after that fault4 block with only
   %changing the fault types and fault resistances 
   
   for N=1:len
   
       time(N)=ti(N)
    lineone(N)=vv3(N);
    linel(N)=zz3(N);
 
    Fr1(N)=R(N)*100;   % range of 100 ohm
       fault(N)= F(N)
          fault2(N)=f(N)
             fault3(N)=ff(N)
        
 simin(N) = Simulink.SimulationInput(mdl);
   
    
   simin(N)=  simin(N).setBlockParameter('ANKAis/line5','length',string(lineone(N)))
     simin(N)=  simin(N).setBlockParameter('ANKAis/line5.1','length',string(linel(N)))

     simin(N)= simin(N).setBlockParameter('ANKAis/fault4','SwitchTimes',num2str(ti(N))) 
         simin(N)= simin(N).setBlockParameter('ANKAis/fault4','Faultresistance',num2str(Fr1(N)))  
              simin(N)= simin(N).setBlockParameter('ANKAis/fault4',char(fault(N)), 'on')
                    simin(N)= simin(N).setBlockParameter('ANKAis/fault4',char(fault2(N)), 'on')
                          simin(N)= simin(N).setBlockParameter('ANKAis/fault4',char(fault3(N)), 'on')
                             simin(N)= simin(N).setBlockParameter('ANKAis/fault4','GroundFault', 'on')
  simin(N) = simin(N).setPostSimFcn(@(x) postsim(x));

%     i1 = out.i1;i2 = out.i2;i3 = out.i3;
%             fi=@cfi; 
%             y = fi(i1,i2,i3);
%             table3(N,:)=y;
  

end  
out=sim(simin)%,'ShowSimulationManager','on')
valc4=[out.x].';
   valv4=[out.q].';
  vala4=[out.asd].';
   valo4=[out.asd1].';
   vale4=[out.asd2].';



simin = Simulink.SimulationInput(mODL_NAME);%             fi=@cfi; 
 simin= simin.setBlockParameter('ANKAis/fault4','FaultA', 'off')
  simin= simin.setBlockParameter('ANKAis/fault4','FaultB', 'off')
   simin= simin.setBlockParameter('ANKAis/fault4','FaultC', 'off')
   simin= simin.setBlockParameter('ANKAis/fault4','GroundFault', 'off')

% for load adding only at line 8

for N=1:len
react(N)=reac(N)
indc(N)=ind(N)
capc(N)=cap(N)
        simin(N) = Simulink.SimulationInput(mODL_NAME);   
simin(N)= simin(N).setBlockParameter('ANKAis/test','ActivePower',num2str(react(N))) 
simin(N)= simin(N).setBlockParameter('ANKAis/test','InductivePower',num2str(indc(N))) 
simin(N)= simin(N).setBlockParameter('ANKAis/test','CapacitivePower',num2str(capc(N))) 

    simin(N) = simin(N).setPostSimFcn(@(x) postsim(x));
end  
 out = sim(simin)
   valc5=[out.x].';
   valv5=[out.q].';
   vala5=[out.asd].';
   valo5=[out.asd1].';
   vale5=[out.asd2].';
   

          tablei=[valc;valc1;valc2;valc4;valc5];
          tablev=[valv;valv1;valv2;valv4;valv5];
          tablea=[vala;vala1;vala2;vala4;vala5];
          tableo=[valo;valo1;valo2;valo4;valo5];
          tablee=[vale;vale1;vale2;vale4;vale5];
          
          

save('ANKA_S.mat')



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
    % Input signals
    currentA = out.i1;
    currentB = out.i2;
    currentC = out.i3;
    
    % Wavelet parameters
    wv = 'db4';
    Fs = 3200;
    fb = dwtfilterbank('Wavelet',wv,'Level',4,'SamplingFrequency',Fs);
    
    % Calculate the corresponding noise power range based on the SNR values
    minNoisePower = var(currentA) / (10^(21/10)); %(SNR/10)
    maxNoisePower = var(currentA) / (10^(50/10));
    
    % Generate random noise powers within the desired range
    noisePower1 = (maxNoisePower - minNoisePower) * rand() + minNoisePower;
    noisePower2 = (maxNoisePower - minNoisePower) * rand() + minNoisePower;
    noisePower3 = (maxNoisePower - minNoisePower) * rand() + minNoisePower;
    
    % Generate Gaussian noise with the same size as the input signals
    noise1 = sqrt(noisePower1) * randn(size(currentA));
    noise2 = sqrt(noisePower2) * randn(size(currentB));
    noise3 = sqrt(noisePower3) * randn(size(currentC));
    
    % Add the noise to the input signals
    noisySignal1 = currentA + noise1;
    noisySignal2 = currentB + noise2;
    noisySignal3 = currentC + noise3;
    
    % Wavelet decomposition for noisy signals
    [cA1, LA1] = wavedec(noisySignal1, 1, wv);
    [cB1, LB1] = wavedec(noisySignal2, 1, wv);
    [cC1, LC1] = wavedec(noisySignal3, 1, wv);
    
    [cA2, LA2] = wavedec(noisySignal1, 2, wv);
    [cB2, LB2] = wavedec(noisySignal2, 2, wv);
    [cC2, LC2] = wavedec(noisySignal3, 2, wv);
    
    [cA3, LA3] = wavedec(noisySignal1, 3, wv);
    [cB3, LB3] = wavedec(noisySignal2, 3, wv);
    [cC3, LC3] = wavedec(noisySignal3, 3, wv);
    
    [cA4, LA4] = wavedec(noisySignal1, 4, wv);
    [cB4, LB4] = wavedec(noisySignal2, 4, wv);
    [cC4, LC4] = wavedec(noisySignal3, 4, wv);
    
    % Compute detail and approximation coefficients
    dA1 = detcoef(cA1, LA1, 1);
    dB1 = detcoef(cB1, LB1, 1);
    dC1 = detcoef(cC1, LC1, 1);
    
    dA2 = detcoef(cA2, LA2, 2);
    dB2 = detcoef(cB2, LB2, 2);
    dC2 = detcoef(cC2, LC2, 2);
    
    dA3 = detcoef(cA3, LA3, 3);
    dB3 = detcoef(cB3, LB3, 3);
    dC3 = detcoef(cC3, LC3, 3);
    
    dA4 = detcoef(cA4, LA4, 4);
    dB4 = detcoef(cB4, LB4, 4);
    dC4 = detcoef(cC4, LC4, 4);
    
    aA4 = appcoef(cA4, LA4, wv, 4);
    aB4 = appcoef(cB4, LB4, wv, 4);
    aC4 = appcoef(cC4, LC4, wv, 4);
    
    aA1 = appcoef(cA1, LA1, wv, 1);
    aB1 = appcoef(cB1, LB1, wv, 1);
    aC1 = appcoef(cC1, LC1, wv, 1);
    
    % Create new output object with the coefficients
    
    newout.x = [aA4; dA4; dA3; dA2; dA1; aB4; dB4; dB3; dB2; dB1; aC4; dC4; dC3; dC2; dC1];
end


