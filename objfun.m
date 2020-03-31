function [obj] = objfun(theta)
%
% Objective function for the optimization algorithm. The optimization is
% set to maximize the area enclosed by the trajectory, and minimize the
% required power. 
%

phi = thetaToPhi(theta);
areaPolygon = computeAreaPolygon(phi, pi/(2*length(theta)));
obj = -areaPolygon;

end

