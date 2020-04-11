function [ qjl, qju ] = qjFunc( x )
%QJFUNC Summary of this function goes here
%   Detailed explanation goes here

f1 = sqrt(x.^2 + 3 - sqrt((x.^2 - 1).^2 + 8));
f2 = sqrt(4 - f1.^2);

qjl = 3.*f1.*exp((-2*x.^2)./(2 - f2))./(4*pi + pi*f2) + (4 + (pi - 2)*f2 - 2*f1).*(exp(-x.^2/2) + exp(-2*x.^2./(f1.^2)))./(16 + 4*(pi - 2)*f2);
% qju = f1.*exp((-2*x.^2)./(f1.^2))./(8 + 2*(pi - 2)*f2) + (4*pi + pi*f2 - 4*f1).*exp((-2*x.^2)./(2 + f1))./(8*pi + 2*pi*f2);
qju = 0.25*exp(-x.^2/2) + 0.5*exp(-x.^4/(2*x.^2 + 1)).*(1 - x + sqrt(x.^2 + 4))./(1 + sqrt(x.^2 + 4));

end

