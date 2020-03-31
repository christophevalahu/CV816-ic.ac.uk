function [areaTriangle] = computeAreaTriangle(x1, y1, x2, y2, x3, y3)
%
% Computes the area of a triangle described by the three points (x1,y1),
% (x2, y2), (x3, y3). 
%

s1 = sqrt((x1 - x2)^2 + (y1 - y2)^2);
s2 = sqrt((x1 - x3)^2 + (y1 - y3)^2);
s3 = sqrt((x2 - x3)^2 + (y2 - y3)^2);

p = (s1 + s2 + s3)/2;

areaTriangle = sqrt(p*(p-s1)*(p-s2)*(p-s3));

end

