function [averagePositionY] = computeSymmetryY(phi, lengthSegment)
%
% Compute the average y position of the path. 
%

averagePositionY = 0;
currentPositionY = 0;

nSegments = length(phi);

for index=1:nSegments
    currentPositionY = currentPositionY + sin(phi(index))*lengthSegment;
    averagePositionY = averagePositionY + currentPositionY/(nSegments + 1);
end
end

