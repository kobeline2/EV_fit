load('../data/d.mat')

%% GEV
paramHat = paramEstimateGEV(d);
p = extremeValueFuncs(0, paramHat, 'pdf', 0);

rain = 0:1:100;
y = p(rain);
histogram(d)
yyaxis right
plot(rain, y, 'LineWidth', 2)

%% Gumbel
paramHat = paramEstimateGumbel(d);
p = extremeValueFuncs(0, paramHat, 'pdf', 0);

rain = 0:1:100;
y = p(rain);
histogram(d)
yyaxis right
plot(rain, y, 'LineWidth', 2)