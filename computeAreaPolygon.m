function [areaPolygon] = computeAreaPolygon(phi, lengthSegment)
%
% Given a list of angle phi, rebuilds the trajectory made of the corresponding
% vectors of length lengthSegment. Divides the polygon into triangles with 
% points (0,0), (x1,y1) and (x2,y2). Sums the area of each triangle. 
%

areaPolygon = 0;

x1 = cos(phi(1))*lengthSegment;
y1 = sin(phi(1))*lengthSegment;

for i = 2:length(phi)
    
    x2 = cos(phi(i))*lengthSegment + x1;
    y2 = sin(phi(i))*lengthSegment + y1;
    
    areaPolygon = areaPolygon + computeAreaTriangle(x1, y1, x2, y2, 0, 0);
    
    x1 = x2;
    y1 = y2;
    
end 
end

