function p = plottingPosition(N, alpha)
% plottingPosition
% N : the number of data
% alpha = 
% 0    :Weibull
% 0.5  :Hazen
% 0.44 :Gringorten
% 0.375:Blom, 
% 0.4  :Cunnane(default)
% 0.25 :Adamowski
% 

if ~exist('alpha', 'var'), alpha = 0.4; end
p = ((1:N)-alpha) / (N+1-2*alpha);

end