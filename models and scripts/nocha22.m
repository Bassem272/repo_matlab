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

N=300;        % number of population
  
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








%for line 1 faults
for N=1:len
   
    lineone(N)=vv1(N);
    linel(N)=zz1(N);
    
 Fr1(N)=R(N)*100;
    fault(N)= F(N)
        fault2(N)=f(N)
            fault3(N)=ff(N)
        
 simin(N) = Simulink.SimulationInput(mODL_NAME);
   
    
%   simin(N)=  simin(N).setBlockParameter('notch1/line1','length',string(lineone(N)))
%     simin(N)=  simin(N).setBlockParameter('notch1/line1.1','length',string(linel(N)))
        simin(N)= simin(N).setBlockParameter('notch1/fault1','Faultresistance',num2str(Fr1(N))) 
           simin(N)= simin(N).setBlockParameter('notch1/fault1',char(fault(N)), 'on')
              simin(N)= simin(N).setBlockParameter('notch1/fault1',char(fault2(N)), 'on')
                 simin(N)= simin(N).setBlockParameter('notch1/fault1',char(fault3(N)), 'on')
                     simin(N)= simin(N).setBlockParameter('notch1/fault1','GroundFault', 'on')
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
 simin= simin.setBlockParameter('notch1/fault1','FaultA', 'off');
  simin= simin.setBlockParameter('notch1/fault1','FaultB', 'off');
   simin= simin.setBlockParameter('notch1/fault1','FaultC', 'off');
    simin= simin.setBlockParameter('notch1/fault1','GroundFault', 'off');%             y = fi(i1,i2,i3);
%             table1(N,:)=y;

% %for line 2 faults
% for N=1:len
%    
%     lineone(N)=vv2(N);
%     linel(N)=zz2(N);
%  
%     Fr1(N)=R(N)*5;
%     fault(N)= F(N)
%       fault2(N)=f(N)
%         fault3(N)=ff(N)
%         
%  simin(N) = Simulink.SimulationInput(mODL_NAME);
%    
%     
%    simin(N)=  simin(N).setBlockParameter('notch1/line2','length',string(lineone(N)))
%       simin(N)=  simin(N).setBlockParameter('notch1/line2.1','length',string(linel(N)))
%          simin(N)= simin(N).setBlockParameter('notch1/fault2','Faultresistance',num2str(Fr1(N)))
%             simin(N)= simin(N).setBlockParameter('notch1/fault2',char(fault(N)), 'on')
%                simin(N)= simin(N).setBlockParameter('notch1/fault2',char(fault2(N)), 'on')
%                  simin(N)= simin(N).setBlockParameter('notch1/fault2',char(fault3(N)), 'on')
%                    simin(N)= simin(N).setBlockParameter('notch1/fault2','GroundFault', 'on')
%    simin(N) = simin(N).setPostSimFcn(@(x) postsim(x));
% 
% %     i1 = out.i1;i2 = out.i2;i3 = out.i3;
% %             fi=@cfi; 
% %             y = fi(i1,i2,i3);
% %             table2(N,:)=y;
% %   
% %qwe is important for test date range
% end  
% out=sim(simin)%,'ShowSimulationManager','on')
% valc1=[out.x].';
%    valv1=[out.q].';
%    vala1=[out.asd].';
%    valo1=[out.asd1].';
%    vale1=[out.asd2].';
% simin = Simulink.SimulationInput(mODL_NAME);%             fi=@cfi; 
%  simin= simin.setBlockParameter('notch1/fault2','FaultA', 'off')
%   simin= simin.setBlockParameter('notch1/fault2','FaultB', 'off')
%    simin= simin.setBlockParameter('notch1/fault2','FaultC', 'off')
%    simin= simin.setBlockParameter('notch1/fault2','GroundFault', 'off')
%    %for line 3 faults
% for N=1:len
%    
%     lineone(N)=vv3(N);
%     linel(N)=zz3(N);
%  
%     Fr1(N)=R(N)*5;
%        fault(N)= F(N)
%           fault2(N)=f(N)
%              fault3(N)=ff(N)
%         
%  simin(N) = Simulink.SimulationInput(mODL_NAME);
%    
%     
%    simin(N)=  simin(N).setBlockParameter('notch1/line3','length',string(lineone(N)))
%      simin(N)=  simin(N).setBlockParameter('notch1/line3.1','length',string(linel(N)))
%          simin(N)= simin(N).setBlockParameter('notch1/fault3','Faultresistance',num2str(Fr1(N)))  
%               simin(N)= simin(N).setBlockParameter('notch1/fault3',char(fault(N)), 'on')
%                     simin(N)= simin(N).setBlockParameter('notch1/fault3',char(fault2(N)), 'on')
%                           simin(N)= simin(N).setBlockParameter('notch1/fault3',char(fault3(N)), 'on')
%                              simin(N)= simin(N).setBlockParameter('notch1/fault3','GroundFault', 'on')
%   simin(N) = simin(N).setPostSimFcn(@(x) postsim(x));
% 
% %     i1 = out.i1;i2 = out.i2;i3 = out.i3;
% %             fi=@cfi; 
% %             y = fi(i1,i2,i3);
% %             table3(N,:)=y;
%   
% 
% end  
% out=sim(simin)%,'ShowSimulationManager','on')
% valc2=[out.x].';
%    valv2=[out.q].';
%   vala2=[out.asd].';
%    valo2=[out.asd1].';
%    vale2=[out.asd2].';
 
   
   
simin = Simulink.SimulationInput(mODL_NAME);%             fi=@cfi; 
 simin= simin.setBlockParameter('notch1/fault3','FaultA', 'off')
  simin= simin.setBlockParameter('notch1/fault3','FaultB', 'off')
   simin= simin.setBlockParameter('notch1/fault3','FaultC', 'off')
   simin= simin.setBlockParameter('notch1/fault3','GroundFault', 'off')
%    for N=1:len
%    
%     lineone(N)=vv3(N);
%     linel(N)=zz3(N);
%  
%     Fr1(N)=R(N)*5;
%        fault(N)= F(N)
%           fault2(N)=f(N)
%              fault3(N)=ff(N)
%         
%  simin(N) = Simulink.SimulationInput(mdl);
%    
%     
%    simin(N)=  simin(N).setBlockParameter('notch1/line5','length',string(lineone(N)))
%      simin(N)=  simin(N).setBlockParameter('notch1/line5.1','length',string(linel(N)))
%          simin(N)= simin(N).setBlockParameter('notch1/fault5','Faultresistance',num2str(Fr1(N)))  
%               simin(N)= simin(N).setBlockParameter('notch1/fault5',char(fault(N)), 'on')
%                     simin(N)= simin(N).setBlockParameter('notch1/fault5',char(fault2(N)), 'on')
%                           simin(N)= simin(N).setBlockParameter('notch1/fault5',char(fault3(N)), 'on')
%                              simin(N)= simin(N).setBlockParameter('notch1/fault5','GroundFault', 'on')
%   simin(N) = simin(N).setPostSimFcn(@(x) postsim(x));
% 
% %     i1 = out.i1;i2 = out.i2;i3 = out.i3;
% %             fi=@cfi; 
% %             y = fi(i1,i2,i3);
% %             table3(N,:)=y;
%   
% 
% end  
% out=sim(simin)%,'ShowSimulationManager','on')
% valc3=[out.x].';
%    valv3=[out.q].';
          tablei=[valc]%;valc1;valc2];
          tablev=[valv]%;valv1;valv2];
          tablea=[vala]%;vala1;vala2];
          tableo=[valo]%;valo1;valo2];
          tablee=[vale]%;vale1;vale2];
          
          
save('faultline8.mat')



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

