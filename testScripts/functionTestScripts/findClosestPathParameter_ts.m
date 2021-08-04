clear
clc
close all

%% test findClosestPathParameter
initPathParam = 0;
pathWidth   = 40;
pathHeight  = 12;
pathElev    = 30;

kitePathParam = 0.1 + 0.6*rand;
kitePos = 100*calcNormalizedPathCoords(pathWidth,pathHeight,pathElev,kitePathParam);

sClosest = findClosestPathParameter(initPathParam,pathWidth,pathHeight,...
    pathElev,kitePos);