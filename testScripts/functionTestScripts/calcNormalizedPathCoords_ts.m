clear
clc
close all;

%% test calcNormalizedPathCoords.m
pathWidth   = 40;
pathHeight  = 12;
pathElev    = 30;
pathParam   = linspace(0,1,501)*2*pi;

plotDome(1,15);
rPath = calcNormalizedPathCoords(pathParam,pathWidth,pathHeight,pathElev);
plot3(rPath(1,:),rPath(2,:),rPath(3,:),'k-');
