%% INPUT ここを書き換える
fn = 'filepath';
type = 0; % 0 -> GEV, 1-> Gumbel

% ここは書き換えなくていい
d = readmatrix(fn);
paramHat = paramEstimateJackKnife(d, type);
slsc = getSLSC(d, type, paramHat);
disp(['slsc is ', num2str(slsc)])
cdfInv = extremeValueFuncs(type, paramHat, 'cdf', 1);

disp(['rainfall with return period 10 yrs is ', num2str(cdfInv(1-0.1))])