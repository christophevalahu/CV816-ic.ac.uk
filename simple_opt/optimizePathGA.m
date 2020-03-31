function [phi] = optimizePathGA(nSegments)
%
% Finds the optimal path using Matlab's in built genetic algorithm solver
% 
LOWER_BOUND = zeros(1, nSegments);
UPPER_BOUND = zeros(1, nSegments) + pi/4;

options = optimoptions(@ga,'MutationFcn',@mutationadaptfeasible, ...
                       'PlotFcn',{@gaplotbestf,@gaplotmaxconstr}, ...
                       'Display', 'iter',...
                       'MaxGenerations', 300, 'TolFun', 1e-10);
[thetaSolution, fval] = ga(@objfun, nSegments, [],[],[],[], ...
                           LOWER_BOUND, UPPER_BOUND, ...
                           @confuneq, options)

phi = thetaToPhi(thetaSolution);

end

