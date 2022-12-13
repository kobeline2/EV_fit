function [paramHat] = paramEstimateJackKnife(d, type)
% paramEstimateJackKnife
% type
% 0:GEV, params = [mu, sigma, xi],『極値統計学』p.91
% 1:Gumbel, params = [mu, sigma], 『極値統計学』p.106
% 2:Frechet, params = [mu, sigma], 
% 3:Weibull, params = [mu, sigma], 

N = length(d);
paramAll = paramEstimate4extremeValue(d, type);
paramLOO = zeros(N, length(paramAll));

d = reshape(d, 1, []);
for I = 1:N
    dLOO = d;
    dLOO(I) = [];
    paramLOO(I, :) = paramEstimate4extremeValue(dLOO, type);
end

paramHat = N*paramAll - (N-1)*mean(paramLOO);
end


