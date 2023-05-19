% Clear the command window and workspace variables
clc, clearvars;

% Turn on warnings
warning on;

% Load the Simulink model and display the blocks in the model
model_name = 'notch1';
load_system(model_name);
find_system(model_name);

% Set the number of populations and generate a random active power load for each
num = 45;
p = 200e3 + (900e3 - 200e3) .* rand(1, num);

% Calculate the reactive power, inductance, capacitance, and related values for each active power value

% Create a SimulationInput object for each active power value and set the block parameters for each input
for n = 1:num
[reactive_power, inductance, capacitance, inductive_power, capacitive_power] = calc_reactive_power(p);

    sim_in(n) = Simulink.SimulationInput(model_name);
    sim_in(n) = sim_in(n).setBlockParameter('notch1_load_add/test', 'ActivePowere', num2str(reactive_power(n)));
    sim_in(n) = sim_in(n).setBlockParameter('notch1_load_add/test', 'InductivePower', num2str(inductive_power(n)));
    sim_in(n) = sim_in(n).setBlockParameter('notch1_load_add/test', 'CapacitivePower', num2str(capacitive_power(n)));
    sim_in(n) = sim_in(n).setPostSimFcn(@(x) postsim(x)); % Set a post-simulation callback function for each input
end

% Simulate the model for each input and store the results in arrays
out = sim(sim_in);
val_c = [out.x].';
val_v = [out.q].';
val_a = [out.asd].';
val_o = [out.asd1].';
val_e = [out.asd2].';

% Store the arrays in tables and save the tables to a MAT-file
table_c = [val_c];
table_v = [val_v];
table_a = [val_a];
table_o = [val_o];
table_e = [val_e];
save('model_addingloads_T.125S_.04FST_1KM.mat')


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


% Function that calculates the reactive power, inductance, capacitance, and related values for an array of active power values
function [reactive_power, inductance, capacitance, inductive_power, capacitive_power] = calc_reactive_power(p)
    % Constants for the calculation
    pf = 0.85;
    f = 50; % Hz
    V = 10000; % V (assuming a line-to-line voltage of 10 kV)

    % Calculate the apparent power for each active power value
    apparent_power = p ./ pf;

    % Calculate the reactive power for each apparent power value
    reactive_power = sqrt(apparent_power.^2 - p.^2);

    % Calculate the inductive and capacitive reactive power for each value
    inductive_power = reactive_power / 2;
    capacitive_power = reactive_power / 2;

    % Calculate the inductance and capacitance for each value
    inductance = inductive_power ./ (2*pi*f*V^2);
    capacitance = 1 ./ (2*pi*f*V^2*inductance);
end

% Function that calculates the inductive and capacitive reactive power for an array of active power values
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



   
