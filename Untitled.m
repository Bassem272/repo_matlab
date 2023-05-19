% Define the original signals
originalSignal1 = [1 2 3 4 5];
originalSignal2 = [10 20 30 40 50];
originalSignal3 = [100 200 300 400 500];

% Define the noise level
noiseLevel = 0.1;

% Add noise to the signals
[noisySignal1, noisySignal2, noisySignal3] = addNoiseToSignals(originalSignal1, originalSignal2, originalSignal3, noiseLevel);

% Display the noisy signals
disp("Noisy Signal 1: ");
disp(noisySignal1);
disp("Noisy Signal 2: ");
disp(noisySignal2);
disp("Noisy Signal 3: ");
disp(noisySignal3);
function [noisySignal1, noisySignal2, noisySignal3] = addNoiseToSignals(inputSignal1, inputSignal2, inputSignal3, noiseLevel)
    % inputSignal1, inputSignal2, inputSignal3: The original signals
    % noiseLevel: The standard deviation of the Gaussian noise

    % Generate Gaussian noise with the same size as the input signals
    noise1 = noiseLevel * randn(size(inputSignal1));
    noise2 = noiseLevel * randn(size(inputSignal2));
    noise3 = noiseLevel * randn(size(inputSignal3));

    % Add the noise to the input signals
    noisySignal1 = inputSignal1 + noise1;
    noisySignal2 = inputSignal2 + noise2;
    noisySignal3 = inputSignal3 + noise3;
end
