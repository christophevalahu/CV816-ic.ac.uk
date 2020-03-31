function [] = plotPath(phi)
%
% Plots the path described by a list of angles phi. Shows the required
% power, the average distance from the center and the symmetry in y.
%

nSegments = length(phi);
lengthSegment = sin(pi/(2*nSegments)); 

% Compute the points making up the path
xPoints = zeros(1, nSegments + 1);
yPoints = zeros(1, nSegments + 1);
for index = 1:nSegments
    xPoints(index+1) = xPoints(index) + cos(phi(index)) * lengthSegment;
    yPoints(index+1) = yPoints(index) + sin(phi(index)) * lengthSegment;
end

% Add the points making up the reflection, resulting in the full path
xPoints = [xPoints, -flip(xPoints)];
yPoints = [yPoints, flip(yPoints)];

% Plot the path
clf
hold on
nPoints = length(xPoints);
for index=1:nPoints-1
    plot(xPoints(index:index+1), yPoints(index:index+1), ...
        'color', [(1/nPoints)*index 0 0]) % Color gradient from black to red
end
hold off

PLOT_LIMITS = 1;
xlim([-PLOT_LIMITS PLOT_LIMITS])
ylim([-PLOT_LIMITS PLOT_LIMITS])

xlabel('Re[\alpha]')
ylabel('Im[\alpha]')

% Compute the area of a single arc associated to a segment
areaArc = (2*lengthSegment - sin(2*lengthSegment))*1/8;
% Compute the area enclosed by the path, whic is the area of the polygon +
% 2N x the area of the arcs
areaPath = 2 * computeAreaPolygon(phi, lengthSegment) + ... 
           2 * nSegments * areaArc;
AREA_CIRCLE = pi * 0.25; % Area of a circle of radius 0.5
% Compute the required power compared to a simple circular path.
powerScalingFactor = sqrt(AREA_CIRCLE/areaPath);

text(-0.8, -0.4, [sprintf('Power = %.2f x', powerScalingFactor), ...
                  ' \Omega0'])
text(-0.8, -0.55, sprintf('Average Distance = %.2f ', ...
                          computeAverageDistance(phi, lengthSegment)));
text(-0.8, -0.7, sprintf('Symmetry in Y = %.2f ', ...
                         computeSymmetryY(phi, lengthSegment)))

end


