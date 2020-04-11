function [ iu, il, iju, ijl, inu, inl ] = iFunc( mu, sigma, au, bu, al, bl )
%IFUNC Summary of this function goes here
%   Detailed explanation goes here

il = qFunc(mu/sigma, al, bl) - qFunc(mu/(sigma*sqrt(1 + sigma^2)), au, bu).*exp(-mu.^2/(1 + sigma^2))/sqrt(1 + sigma^2);
iu = qFunc(mu/sigma, au, bu) - qFunc(mu/(sigma*sqrt(1 + sigma^2)), al, bl).*exp(-mu.^2/(1 + sigma^2))/sqrt(1 + sigma^2);

ijl = qjFunc(mu/sigma) - qjFunc(mu/(sigma*sqrt(1 + sigma^2))).*exp(-mu.^2/(1 + sigma^2))/sqrt(1 + sigma^2);
iju = qjFunc(mu/sigma) - qjFunc(mu/(sigma*sqrt(1 + sigma^2))).*exp(-mu.^2/(1 + sigma^2))/sqrt(1 + sigma^2);

inl = qFuncNumeric(mu/sigma) - qFuncNumeric(mu/(sigma*sqrt(1 + sigma^2))).*exp(-mu.^2/(1 + sigma^2))/sqrt(1 + sigma^2);
inu = qFuncNumeric(mu/sigma) - qFuncNumeric(mu/(sigma*sqrt(1 + sigma^2))).*exp(-mu.^2/(1 + sigma^2))/sqrt(1 + sigma^2);


end

