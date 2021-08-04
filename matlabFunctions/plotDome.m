function plotDome(radius)
%PLOTDOME Plots dome with dotted longitude and latitude lines
% Inputs: Dome radius in meters
% Longitude lines plotted at -90,-60,-30...
% Latitude lines plotted at 0,30,60,90.

% get constants
r = radius;
linWidth = 0.25;
lnType = ':';
grayRGB = 191/255.*[1 1 1];
% make longitude and latitude fine grids
longFine = -90:1:90;
latFine = -0:1:90;
% make longitude and latitude coarse grids
stepSize = 30;
longCoarse = longFine(1):stepSize:longFine(end);
latCoarse = latFine(1):stepSize:latFine(end);
% plot longitude lines
for ii = 1:numel(longCoarse)
    X = r*cosd(longCoarse(ii)).*cosd(latFine);
    Y = r*sind(longCoarse(ii)).*cosd(latFine);
    Z = r*sind(latFine);
    plot3(X,Y,Z,lnType,'linewidth',linWidth,'color',grayRGB);
    hold on;
end
% plot latitude lines
for ii = 1:numel(latCoarse)
    X = r*cosd(longFine).*cosd(latCoarse(ii));
    Y = r*sind(longFine).*cosd(latCoarse(ii));
    Z = r*sind(latCoarse(ii))*ones(size(longFine));
    plot3(X,Y,Z,lnType,'linewidth',linWidth,'color',grayRGB);
end
end