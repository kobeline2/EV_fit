function slsc = getSLSC(d, type, paramHat)
% getSLSC
% type
% 0:GEV, params = [mu, sigma, xi],『極値統計学』p.91
% 1:Gumbel, params = [mu, sigma], 『極値統計学』p.106
% 2:Frechet, params = [mu, sigma], 
% 3:Weibull, params = [mu, sigma], 

d      = reshape(d, 1, []);
cdfInv = extremeValueFuncs(type, paramHat, 'cdf', 1);

v99  = cdfInv(0.99);
v01  = cdfInv(0.01);
N    = length(d);
pp   = plottingPosition(N);
s    = cdfInv(pp);
slsc = sqrt(sum((s - sort(d)).^2)/N) / (v99 - v01);

end