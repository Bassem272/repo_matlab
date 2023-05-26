% Load the data from the workspace
data = your_data_variable_name; % Replace with the actual variable name

% Define the parameters for denoising
noise_level = 21; % Specify the noise level in dB

% Perform denoising on each column of the data
denoised_data = zeros(size(data));
for col = 1:size(data, 2)
    % Extract the current column
    current_column = data(:, col);

    % Estimate the noise standard deviation
    noise_std = std(current_column);

    % Compute the denoising level based on the specified noise level
    denoising_level = noise_std * 10^(-noise_level/20);

    % Perform Savitzky-Golay filtering for denoising
    denoised_column = sgolayfilt(current_column, 3, 11);

    % Store the denoised column in the output
    denoised_data(:, col) = denoised_column;
end

% Store the denoised data back to the workspace
denoised_data_variable_name = denoised_data; % Replace with the desired variable name
