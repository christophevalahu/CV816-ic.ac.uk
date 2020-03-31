function [c, ceq] = confuneq(theta, endPositionTolerance, ...
                             symmetryTolerance, averageDistanceTolerance)
%
% Constraint Function used for Matlab's in built optimizer. 
% c is a list of inequality constraint, where ci <= 0 for each element ci
% of c. 
% ceq is a list of equality constraints, where ceqi = 0 for each element
% ceqi of ceq. 
%

phi = thetaToPhi(theta);
nSegments = length(phi);
lengthSegment = pi/(2*nSegments);

c = [abs(computeEndPositionX(phi)) - endPositionTolerance, ... 
    computeAverageDistance(phi, lengthSegment) - averageDistanceTolerance, ... 
    abs(computeSymmetryY(phi, lengthSegment)) - symmetryTolerance];
%c = [abs(computeEndPositionX(phi)) - endPositionTolerance];
ceq = [];

end

