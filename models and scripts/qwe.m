x=0:0:0
u=repmat(x,51)
%%%91;100 and 801;810 and after deleting 801;810 we took 1001;to1010
%tablei and test tablei1
%second time 100ohmfit 201 to 210 deleted 401 410 deleted 801 810
%veryimportantdata@@
%take each 320 row of each line and doing take for testing 101;110 and
%201;210 
%rhe second line 101;110 and 201;212
myMatrix = ones(1, 960);


function newout = postsim(out)
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
newout.x=[aA4 ;dA4 ; dA3 ;  dA2 ; dA1 ; aB4; dB4 ; dB3 ;  dB2 ; dB1; aC4; dC4 ; dC3 ; dC2 ; dC1];
end