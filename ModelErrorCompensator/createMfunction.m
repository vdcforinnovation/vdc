open_system('testBuffer_test.slx');
libraryBlockPath = 'simulink/User-Defined Functions/MATLAB Function';
newBlockPath = 'testBuffer_test/bufferState_test';
% Add a MATLAB Function to the model
add_block(libraryBlockPath, newBlockPath);
% In memory, open models and their parts are represented by a hierarchy of
% objects. The root object is slroot. This line of the script returns the
% object that represents the new MATLAB Function block:
blockHandle = find(slroot, '-isa', 'Stateflow.EMChart', 'Path', newBlockPath);
% The Script property of the object contains the contents of the block,
% represented as a character vector. This line of the script loads the
% contents of the file myAdd.m into the Script property:
blockHandle.Script = fileread('bufferState.m');