clc
clear
close all

%% test findClosestPathParameter_ul.slx
% run function test script
findClosestPathParameter_ts

% open and simulate test harness
open('findClosestPathParameter_th');
sim('findClosestPathParameter_th');

% delete temporary simulink files
rmdir('slprj', 's')
delete *.slxc
