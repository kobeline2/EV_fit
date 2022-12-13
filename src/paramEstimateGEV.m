function [paramHat] = paramEstimateGEV(d)
% paramEstimateGEV
% estimate parameters of GEV (mu, sigma, xi)
% paramHat(1) is mu
% paramHat(2) is sigma
% paramHat(3) is xi
% This function uses PWM. 
% For GEV, PWM are recommended (c.f. エース水文学).

% common values
d     = reshape(d, 1, []);
dMean = mean(d);
N     = length(d);
di    = sort(d);

% PWM(極値統計学（高橋）p.96)
alpha0 = dMean;
tmp = ((1:N) - 0.35)/N;
alpha1 = sum(tmp    .* di) / N;
alpha2 = sum(tmp.^2 .* di) / N;

cHat     = log(2)/log(3) - (2*alpha1-alpha0)/(3*alpha2-alpha0);
xiHat    = 7.8590*cHat - 2.9554*cHat^2;
sigmaHat = (2*alpha1-alpha0)*xiHat / ((2^xiHat-1)*gamma(1-xiHat));
muHat    = alpha0 + sigmaHat*(1-gamma(1-xiHat)) /xiHat;

paramHat = [muHat, sigmaHat, xiHat];

% % plot
% mu = paramHat(1);
% sigma = paramHat(2);
% xi = paramHat(3);
% 
% tmp1 = -(1/xi)-1;
% tmp2 = -1/xi;
% p = @(x)    (max(0, 1+xi*((x-mu)/sigma)).^tmp1)...
%     .* [exp(-max(0, 1+xi*((x-mu)/sigma)).^tmp2)] / sigma;
% histogram(d, 1.5:0.1:6);
% y = linspace(1.5, 6, 1001);
% pp = p(y);
% yyaxis right
% plot(y, pp, 'LineWidth', 2)

end
