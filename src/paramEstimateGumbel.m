function [paramHat] = paramEstimateGumbel(d)
% PARAMESTIMATEGUMBEL
% estimate parameters of Gumbel (mu, sigma)
% paramHat(1) is mu
% paramHat(2) is sigma
% This function uses PWM. 
% For Gumbel, MLE or PWM are recommended (c.f. エース水文学).

% common values
d     = reshape(d, 1, []);
dMean = mean(d);
% dStd     = std(d);
GAMMA = 0.57721566490153286060651209008240243104215933593992;
N     = length(d);
di    = sort(d);

% MLE(極値統計学（高橋）p.)


% PWM(極値統計学（高橋）p.110)
alpha0 = dMean;
% alpha1 = sum((1:N-1) .* di(2:end)) / N / N-1;
alpha1 = sum(((1:N) - 0.35) .* di) / N^2;
sigmaHat   = (2*alpha1 - alpha0) / log(2); 
if sigmaHat < 0; sigmaHat = NaN; end % sigma must be positive.
muHat      = alpha0 - GAMMA*sigmaHat;       
paramHat   = [muHat, sigmaHat];

    
% % plot
% mu = paramHat(1);
% sigma = paramHat(2);
% p = @(x) exp(-(x-mu)/sigma - exp(-(x-mu)/sigma)) / sigma;
% histogram(d, 1.5:0.1:6);
% y = linspace(1.5, 6, 1001);
% pp = p(y);
% yyaxis right
% plot(y, pp, 'LineWidth', 2)
end