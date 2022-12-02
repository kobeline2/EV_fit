d = readmatrix('../data/input_sample.txt');
d = d(:, 1);

%% sample data
d = randn(365, 100);
d = max(d);


%% parameter estimate
z_bar = mean(d);
s     = std(d);
GAMMA = 0.57721566490153286060651209008240243104215933593992;
N     = length(d);

% Moment
sigma_hat_M = sqrt(6) * s / pi;
mu_hat_M    = z_bar - GAMMA*sigma_hat_M;

% PWM
z_i     = sort(d);
alpha_0 = z_bar;
alpha_1 = sum((1:N-1) .* z_i(2:end)) / N / N-1;
sigma_hat_star = (2*alpha_1 - alpha_0) / log(2); 
mu_hat_star    = alpha_0 - GAMMA*sigma_hat_star;

%% evfit
param     = evfit(d);
mu_hat    = param(1);
sigma_hat = param(2);

histogram(d, 1.5:0.2:4);
y = linspace(1.5, 4, 1001);
p = evpdf(y, mu_hat, sigma_hat);
line(y, 0.2*length(d)*p, Color="red")

%% Moment
mu_hat    = mu_hat_M;
sigma_hat = sigma_hat_M;

histogram(d, 1.5:0.2:4);
y = linspace(1.5, 4, 1001);
p = evpdf(y, mu_hat, sigma_hat);
line(y, 0.2*length(d)*p, Color="red")


%% PWM
mu_hat    = mu_hat_star;
sigma_hat = sigma_hat_star;

histogram(d, 1.5:0.2:4);
y = linspace(1.5, 4, 1001);
p = evpdf(y, mu_hat, sigma_hat);
line(y, 0.2*length(d)*p, Color="red")
