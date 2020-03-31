function [averageDistance] = computeAverageDistance(phi, lengthSegment)
%
% Compute the average distance from the origin. The distance is average
% with each point making up the segments of the path. 
%

nSegments = length(phi);
x = 0;
y = 0;
averageDistance = 0;

for index=1:nSegments
    x = x + cos(phi(index))*lengthSegment;
    y = y + sin(phi(index))*lengthSegment;
    averageDistance = averageDistance + sqrt(x^2 + y^2)/(nSegments+1);
end
end

