clear
clc
close all

%% test findClosestPathParameter
initPathParam = 0;
pathWidth   = 60;
pathHeight  = 12;
pathElev    = 30;

kitePathParam = 0.1 + 0.6*rand;
kitePos = calcNormalizedPathCoords(kitePathParam,pathWidth,pathHeight,pathElev) + 0.05*rand(3,1);

% find closest path parameter
sClosest = findClosestPathParameter(initPathParam,kitePos,pathWidth,pathHeight,...
    pathElev);
rClosest = calcNormalizedPathCoords(sClosest,pathWidth,pathHeight,pathElev);

%% plot stuff
% plot dome with radius 1 and lat-long lines separated by 15 degrees
plotDome(1,15);
set(gcf,'WindowState','maximized');
% plot path
rPath = calcNormalizedPathCoords(linspace(0,1,501)*2*pi,pathWidth,pathHeight,pathElev);
plot3(rPath(1,:),rPath(2,:),rPath(3,:),'k-');
% plot kite position
pKite = plot3(kitePos(1,:),kitePos(2,:),kitePos(3,:),'or');
% plot closest point
pClosest = plot3(rClosest(1,:),rClosest(2,:),rClosest(3,:),'+b');
%% target point
Lforward = 0.05*2*pi;
sTarget = sClosest + Lforward;
rTarget = calcNormalizedPathCoords(sTarget,pathWidth,pathHeight,pathElev);
pTarget = plot3(rTarget(1,:),rTarget(2,:),rTarget(3,:),'m*');

% legends
lgd = legend([pKite,pClosest,pTarget],...
    {'Kite position','Calculated closest point','Target point'},...
    'Position',[0.7169 0.7388 0.0919 0.0346]);






