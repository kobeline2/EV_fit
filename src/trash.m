load('../data/d.mat')

%% GEV
paramHat = paramEstimateGEV(d);
p = extremeValueFuncs(0, paramHat, 'pdf', 0);
slsc = getSLSC(d, 0, paramHat)
%%
rain = 0:1:100;
y = p(rain);
histogram(d)
yyaxis right
plot(rain, y, 'LineWidth', 2)

slsc = getSLSC(d, '', paramHat);
%% Gumbel
paramHat = paramEstimateGumbel(d);
p = extremeValueFuncs(1, paramHat, 'pdf', 0);
slsc = getSLSC(d, 1, paramHat)

rain = 0:1:100;
y = p(rain);
histogram(d)
yyaxis right
plot(rain, y, 'LineWidth', 2)