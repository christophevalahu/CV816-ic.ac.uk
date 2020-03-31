N = 10 ;

INITIAL_GUESS_THETA = rand(N, 1)*pi/2;

lb = zeros(1, N);
up = zeros(1,N) + pi/4;

gs = MultiStart;
opts = optimset('TolFun', 1e-6, 'MaxIter', 100000);
problem = createOptimProblem('fmincon', 'x0', INITIAL_GUESS_THETA, 'objective', @objfun, 'lb', lb, 'ub', up, 'nonlcon', @confuneq, 'options', opts);
theta_res = run(gs, problem, 100)
objfun(theta_res)


%{
options = optimoptions(@ga,'MutationFcn',@mutationadaptfeasible, ...
    'PlotFcn',{@gaplotbestf,@gaplotmaxconstr}, 'Display', 'iter',...
    'MaxGenerations', 300, 'TolFun', 1e-10);
[theta_res, fval] = ga(@objfun, N, [],[],[],[], lb, up, ...
    @confuneq, options)
%}
phi = thetaToPhi(theta_res);
plotPath(phi);
