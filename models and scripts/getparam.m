
% In Simulink, you can use the `get_param` function with the `'ObjectParameters'` parameter to retrieve the names of all parameters for a specific block in a model. Here is an example code snippet that demonstrates how to use the `get_param` function to retrieve the parameter names of a Simulink block:


% Open the Simulink model
open_system('ANKAis.slx');

% Get the parameter names of the Gain block in the model
block_path = 'ANKAis/fault1';
param_names = get_param(block_path, 'ObjectParameters');
BlockDialogParameters = get_param(block_path,'DialogParameters')
% Display the parameter names
disp(['Parameter names of ' block_path ':']);
disp(BlockDialogParameters);
