function [ q ] = qFuncExp( x, N )
%QFUNCEXP Summary of this function goes here
%   Detailed explanation goes here

x = x / sqrt(2);
n = length(x);
q = zeros(1,n);

for i = 1:N
    q = q + 0.5 * exp(-x.^2 / (sin(i*pi/(2*N))^2)) / N;
end


end

