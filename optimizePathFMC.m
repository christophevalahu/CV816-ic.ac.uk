function [phi] = optimizePathFMC(nSegments, endPositionTolerance, ...
                 symmetryTolerance, averageDistanceTolerance)
%
% Finds the optimal path using Matlab's in built Fmincon. 
%

INITIAL_GUESS_THETA = rand(nSegments, 1)*pi/4;
LOWER_BOUND = zeros(1, nSegments);
UPPER_BOUND = zeros(1, nSegments) + pi/4;

gs = MultiStart;
opts = optimset('TolFun', 1e-6, 'MaxIter', 100000);
problem = createOptimProblem('fmincon', 'x0', INITIAL_GUESS_THETA, ...
          'objective', @objfun, 'lb', LOWER_BOUND, 'ub', UPPER_BOUND, ... 
          'nonlcon', @(x)confuneq(x, endPositionTolerance,  ...
                        symmetryTolerance, averageDistanceTolerance),...
          'options', opts);
thetaSolution = run(gs, problem, 100)
 @(x)nonlcon(x,p1,p2)

phi = thetaToPhi(thetaSolution);
     
end

