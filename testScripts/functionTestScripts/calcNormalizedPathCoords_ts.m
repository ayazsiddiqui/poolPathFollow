clear
clc

%% test calcNormalizedPathCoords.m
pathWidth   = 40;
pathHeight  = 12;
pathElev    = 30;
pathParam   = linspace(0,0.25,101)*2*pi;


rPath = calcNormalizedPathCoords(pathWidth,pathHeight,pathElev,pathParam);
