function p = extremeValueFuncs(type, params, distType, isInv)
% extremeValueFuncs
% type
% 0:GEV, params = [mu, sigma, xi],『極値統計学』p.91
% 1:Gumbel, params = [mu, sigma], 『極値統計学』p.106
% 2:Frechet, params = [mu, sigma], 
% 3:Weibull, params = [mu, sigma], 
% distType = {'pdf', 'cdf'}
% isInv = {0, 1}:  if 1, the output is the inverse of pdf or cdf.

% read parameters
if length(params) == 2
    mu = params(1); sigma = params(2); 
elseif length(params) == 3
    if type ~= 0
        warning('Thare are three parameters although the type is not GEV.')
    end
        mu = params(1); sigma = params(2); xi = params(3);
else
    error('The number of parameters have to be two or three.')
end

nt = @(z) (z - mu)/sigma; % normalized term

% define functions
switch type
case 0 % GEV
    if xi == 0, warning('xi = 0 causes a singular condition.'), end
    c = @(z) max(0, 1+xi*nt(z));
    if strcmp(distType, "pdf")
        if ~isInv
            p = @(z) c(z).^(-inv(xi)-1) .* exp(-c(z).^(-inv(xi))) / sigma;
        elseif isInv
            error('Inverse for PDF is not supported.')
        end
    elseif strcmp(distType, "cdf")
        if ~isInv
            p = @(z) exp(-c(z).^(-inv(xi)));
        elseif isInv
            p = @(y) mu + (sigma/xi)*((-log(y)).^(-xi)-1);
        end
    end

case 1 % Gumbel
    if strcmp(distType, "pdf")
        if ~isInv
            p = @(z) exp(-nt(z) - exp(-nt(z)))/sigma;
        elseif isInv
            error('Inverse for PDF is not supported.')
        end
    elseif strcmp(distType, "cdf")
        if ~isInv
            p = @(z) exp(-exp(-nt(z)));
        elseif isInv
            p = @(y) -sigma*log(-log(y)) + mu;
        end
    end

case 2 % Frechet
    disp('Frechet is not supported yet')
%     if strcmp(distType, "pdf")
%         if ~isInv
% 
%         elseif isInv
%             disp('Inverse for PDF is not supported.')
%         end
%     elseif strcmp(distType, "cdf")
%         if ~isInv
% 
%         elseif isInv
% 
%         end
%     end

% Weibull
case 3
    disp('Weibull is not supported yet')
%     if strcmp(distType, "pdf")
%         if ~isInv
% 
%         elseif isInv
%             disp('Inverse for PDF is not supported.')
%         end
%     elseif strcmp(distType, "cdf")
%         if ~isInv
% 
%         elseif isInv
% 
%         end
%     end
otherwise
    error('Unsupported distribution')
end

end