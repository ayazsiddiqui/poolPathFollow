clc
clear
close all

%% test findClosestPathParameter_ul.slx
% run function test script
findClosestPathParameter_ts

% create class definition
fltCtrller = guidanceLawPathFollow_class;

% define properties
fltCtrller.pathWidth_deg = pathWidth;
fltCtrller.pathHeight_deg = pathHeight;
fltCtrller.pathElevation_deg = pathElev;
fltCtrller.normalizedLforward = Lforward/(2*pi);
fltCtrller.kiteMass = kiteMass;
fltCtrller.initPathParameter = initPathParam;
fltCtrller.maxTanRoll_deg = maxTanRoll_deg;

% open and simulate test harness
open('calcDesTanRoll_cl_th');
sim('calcDesTanRoll_cl_th');

% delete temporary simulink files
rmdir('slprj', 's')
delete *.slxc
