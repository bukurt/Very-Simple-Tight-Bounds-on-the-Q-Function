function [ q ] = qcFunc( x, au, bu, al, bl )
%QCFUNC Summary of this function goes here
%   Detailed explanation goes here
q = (0.5*exp(-11*x)).*qFunc(x, al, bl) + (1-0.5*exp(-10*x)).*qFunc(x, au, bu);

end

