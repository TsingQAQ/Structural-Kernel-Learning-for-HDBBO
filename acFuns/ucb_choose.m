% Copyright (c) 2017 Zi Wang
function optimum = ucb_choose(xx, yy, KernelMatrixInv, guesses, sigma0, ...
    sigma, l, xmin, xmax, alpha, beta)
% This function returns the next evaluation point using EI.
% xx, yy are the current observations.
% KernelMatrixInv is the gram maxtrix inverse under different GP
% hyper-parameters.
% guesses are the inferred points to recommend to evaluate.
% sigma0, sigma, l are the hyper-parameters of the Gaussian kernel.
% xmin, xmax are the lower and upper bounds for the search space.

% Define the acquisition function (and gradient) of EI.
acfun = @(x) evaluateUCB(x, xx, yy, KernelMatrixInv, l, ...
    sigma, sigma0, alpha, beta);
% Optimize the acquisition function.
optimum = globalMaximization(acfun, xmin, xmax, [guesses;xx]);