function desTanRoll = calcDesTanRollAng(kitePos,kiteVel,...
    targetPoint,turnAngle,netWingLift,maxTanRoll_deg)
%CALCDESTANROLLANG(kitePos,kiteVel,targetPoint,turnAngle,netWingLift,maxTanRoll_deg) 
% Calculate desired tangent roll angle
% 
% Inputs:   kitePos - Instantaneous kite position, not normalized [m]
%           kiteVel - kite velocity, not normalized [m/s]
%           targetPoint - Target point position [m]
%           turnAngle - Turn angle in tangent frame needed to follow path
%           netWingLift - Total lift force generated by the wings after
%           accounting for control surface deflections
%           maxTanRoll_deg - Maximum allowable tagent roll angle [deg]
%
% Output:   desTanRoll - Desired tangent roll angle [rad]

%% dummy variables with shorter names
m = kiteMass;
turnAng = turnAngle;

%% other required variables
% radius of instantaenuous sphere
sphereRad = norm(kitePos);
% position vector from kite to target point
rTarg_kite = (targetPoint./norm(targetPoint)) - (kitePos./sphereRad);
% scale it
rTarg_kite = rTarg_kite*sphereRad;
% velocity squared
V2 = sum(kiteVel.^2);
% formula to calculate desired tangent roll
x = (2*m*sin(-turnAng)*V2)/(norm(rTarg_kite)*max(eps,netWingLift));
desTanRoll = asin(min(max(-sind(maxTanRoll_deg),x),sind(maxTanRoll_deg)));


end

