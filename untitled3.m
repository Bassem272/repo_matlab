% Here is an example MATLAB function that takes an array of active power values and calculates the corresponding reactive power values assuming a power factor of 0.85 and a frequency of 50 Hz:









active_power = [1e6, 1.2e6, 800e3, 1.5e6, 1.1e6, 900e3, 1.3e6, 1.4e6, 1.7e6, 1.8e6, 1.6e6, 1.9e6, 1.3e6, 1.2e6, 1.5e6, 800e3, 1e6, 1.1e6, 1.4e6, 1.6e6];
[inductive_power, capacitive_power] = calc_reactiver(p);
disp(inductive_power);
disp(capacitive_power);

% p= [1e6, 1.2e6, 800e3, 1.5e6, 1.1e6, 900e3, 1.3e6, 1.4e6, 1.7e6, 1.8e6, 1.6e6, 1.9e6, 1.3e6, 1.2e6, 1.5e6, 800e3, 1e6, 1.1e6, 1.4e6, 1.6e6];
p=500+(1000-500).*rand(1,100)

reactive_power = calc_reactive_power(p);
disp(reactive_power);
function reactive_power = calc_reactive_power(p)
% Calculates the reactive power for an array of active power values.
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
inductive_power = reactive_power / 2;
capacitive_power = reactive_power / 2;

% Calculate the inductance and capacitance for each value
inductance = inductive_power ./ (2*pi*f*V^2);
capacitance = 1 ./ (2*pi*f*V^2*inductance);

% Return the reactive power array
reactive_power = inductive_power + capacitive_power;
end
%Here is a modified version of the MATLAB function that returns separate arrays for inductive and capacitive reactive power:

function [inductive_power, capacitive_power] = calc_reactiver(p)
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
inductive_power = reactive_power / 2;
capacitive_power = reactive_power / 2;

% Calculate the inductance and capacitance for each value
inductance = inductive_power ./ (2*pi*f*V^2);
capacitance = 1 ./ (2*pi*f*V^2*inductance);

% Return the inductive and capacitive reactive power arrays
end





 



% This will calculate the corresponding reactive power values and display them in the command window.