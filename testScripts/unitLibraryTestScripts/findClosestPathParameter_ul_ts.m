clc
clear
close all

%% test findClosestPathParameter_ul.slx
findClosestPathParameter_ts

open('findClosestPathParameter_th');
sim('findClosestPathParameter_th');

% delete temporary simulink files
rmdir('slprj', 's')
delete *.slxc
