out = sim('notch','SaveState','on','StateSaveName','xoutN','SaveOutput','on','OutputSaveName','youtNew'
in = in.setPostSimFcn(@(out) postsim(i1,i2,i3));
   out(i) = sim(simin(i),'SaveState','on','StateSaveName','xoutNew','SaveOutput','on')
in = in.setPostSimFcn(@(i1) postsim(newout));

configSet = getActiveConfigSet('notch')
configSetNames = get_param(configSet, 'ObjectParameters') 

BlockPaths = find_system('notch','Type','Block')
BlockTypes = get_param(BlockPaths,'BlockType')
%BlockDialogParameters = get_param('notch/Three-Phase Fault','ObjectParameters')

BlockDialogParameters = get_param('notch/Three-Phase Fault','DialogParameters')
BlockDialogParameters = get_param('notch/lino' ,'DialogParameters')
  %fv=@cfv;fi=@cfi;f = @cfk;k1=f( i1,i2,i3)  ;y = fi( i1,i2,i3);m1 = fv( v1,v2,v3);t1 =[0 0 1 1 1];mv1=max(m1);mi1=max(y1);;%rg=,001 L=2km
opts = simset('SignalLogging', 'on', 'SignalLoggingName', 'my_logsout_var'); [t,x,y]=sim('test.mdl',10,opts);
%Simulation Manager | Simulink.SimulationInput | applyToModel | loadVariablesFromMATFile | parsim | setBlockParameter | setExternalInput | setInitialState | setModelParameter | setPostSimFcn | setPreSimFcn | setVariable | validate

 % tab(:,i)= y1;
BlockParameterValuex = get_param('notch/Three-Phase Fault','FaultA')
 % set_param('notch/Three-Phase Fault', '')
              gcs %get currentsystem//bdroot//
              bdroot%//Top-level model of current system
gcb
%%Get handle of current block
gcbp
%Get Simulink.BlockPath object for current block
%set_param(bdroot,'Solver','ode15s','StopTime','3000')
%set_param('notch/Three-Phase Fault','FaultA','off','GroundFault','on')
%set_param('notch/lino','Length','55')
in = in.setPostSimFcn(@(y) myfunction(arg1, arg2 ...)) 
function newout = postsim(out);
newout.mean = mean(out.yout);
end
Create a SimulationInput object for a model.

in = Simulink.SimulationInput('vdp');
in = in.setPostSimFcn(@(x) postsim(x));
in = in.setModelParameter('SaveOutput','on');
Simulate the model.

out = sim(in)
View your result

out.mean
%% 

% find	Access and display values of simulation results
% get	Access and display values of simulation results
% getSimulationMetadata	Return SimulationMetadata object for simulation
% setUserData	Store custom data in SimulationMetadata object that SimulationOutput object contains
% setUserString	Store custom character vector in SimulationMetadata object in SimulationOutput object
% who	Access and display output variable names of simulation
% plot	Plot simulation output data in the Simulation Data Inspector