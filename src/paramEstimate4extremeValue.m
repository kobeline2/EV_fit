function paramHat = paramEstimate4extremeValue(d, type)
% paramEstimate4extremeValue
% type
% 0:GEV
% 1:Gumbel
% 2:Frechet
% 3:Weibull

switch type
    case 0
        paramHat = paramEstimateGEV(d);
    case 1
        paramHat = paramEstimateGumbel(d);
    case 2
         error('Frechet is not supported yet')
    case 3
         error('Weibull is not supported yet')
    otherwise
        error('Unsupported distribution')
end

end