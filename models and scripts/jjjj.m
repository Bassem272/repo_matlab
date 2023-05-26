mODL_NAME = 'notch1';
% num2str(time(N)
load_system(mODL_NAME);
find_system(mODL_NAME);
N=30;

 ts={'[0 .06]';'[0.001 .06]';'[0.002 .06]';'[0.003 .06]';'[0.004 .06]';'[0.005 .06]';'[0.006 .06]';'[0.007 .06]';'[0.008 .06]';'[0.009 .06]';'[0.01 .06]';'[0.011 .06]';'[0.012 .06]';'[0.013 .06]';'[0.014 .06]';'[0.015 .06]';'[0.016 .06]';'[0.017 .06]';'[0.018 .06]';'[0.019 .06]';'[0.020 .06]'};
b1=round(N/20); 
fftime=repmat(ts,b1,1);
 
     All_length= 1:N;
len=length(All_length);
for N=1:len
     simin(N) = Simulink.SimulationInput(mODL_NAME);
time(N)=fftime(N);
simin(N)= simin(N).setBlockParameter('notch1/fault3','SwitchTimes',string(time(N)));
end
out = sim(simin);
 valc=[out.x].';