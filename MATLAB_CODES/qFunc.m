function [ q ] = qFunc( x, a, b )
%QFUNCSIMPLELB Summary of this function goes here
%   Detailed explanation goes here

q = exp(-(x.^2))/a + exp(-(x.^2)/2)./(b*(x+1));

end

