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

%% test turn angle calulation
rTarg_kite = rTarget - kitePos;
rTarg_kite = rTarg_kite./norm(rTarg_kite);
% dummy velocity
kiteVel = rTarg_kite + 0.5*rand(3,1);
kiteVel = kiteVel./norm(kiteVel);
% calc turn angle
turnAng = calcTurnAngleInTangentFrame(kitePos,kiteVel,rTarget);

%% test desired tangent roll angle calculation
% radius of instantanuous sphere
sphereRad = 100;
f_kitePos = sphereRad*kitePos;
f_kiteVel = 10*kiteVel;
netWingLift = 100;
kiteMass = 10;
maxTanRoll_deg = 30;

desTanRoll = calcDesTanRollAng(f_kitePos,f_kiteVel,...
    rTarget,turnAng,netWingLift,kiteMass,maxTanRoll_deg);

%% plots
% plot line that connects kite position to target
prTarg_kite = plot3([kitePos(1) rTarget(1)],...
    [kitePos(2) rTarget(2)],...
    [kitePos(3) rTarget(3)]);

pVel = quiver3(kitePos(1,:),kitePos(2,:),kitePos(3,:),...
    kiteVel(1),kiteVel(2),kiteVel(3),0.2);

% legends
lgd = legend([pKite,pClosest,pTarget,prTarg_kite,pVel],...
    {'Kite position','Calculated closest point','Target point',...
    'Target vector','Velocity direction'},...
    'Position',[0.7169 0.7388 0.0919 0.0346]);






