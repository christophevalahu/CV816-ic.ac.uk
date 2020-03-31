function [positionX] = computeEndPositionX(phi)
%
% Compute the position in x at the end of the path
%

nSegments = length(phi);
lengthSegment = (pi/2)/nSegments; % Approximate the length of a segment
positionX = 0;

for index = 1:length(phi)
    positionX = positionX + cos(phi(index))*lengthSegment;
end
end

