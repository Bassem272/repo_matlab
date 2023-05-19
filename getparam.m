
% In Simulink, you can use the `get_param` function with the `'ObjectParameters'` parameter to retrieve the names of all parameters for a specific block in a model. Here is an example code snippet that demonstrates how to use the `get_param` function to retrieve the parameter names of a Simulink block:


% Open the Simulink model
open_system('notch1_load_add.slx');

% Get the parameter names of the Gain block in the model
block_path = 'notch1_load_add/test';
param_names = get_param(block_path, 'ObjectParameters');

% Display the parameter names
disp(['Parameter names of ' block_path ':']);
disp(param_names);
