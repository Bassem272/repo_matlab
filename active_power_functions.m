% Here is an example MATLAB function that takes an array of active power values and calculates the corresponding reactive power values assuming a power factor of 0.85 and a frequency of 50 Hz:

% ind is inductive cap is capacitive reac is reactive







p=500+(3e6-2e6).*rand(1,100)

[ind, cap] = calc_reactiver(p);
disp(ind);
disp(capr);
reactive_power = calc_reactive_power(p);
disp(reac);

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
%Here is a modified version of the MATLAB function that returns separate arrays for inductive and capacitive reactive power:

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





 



% This will calculate the corresponding reactive power values and display them in the command window.