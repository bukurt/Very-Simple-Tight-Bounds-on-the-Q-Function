function [  ] = qPlot( x, y, spec)
%QPLOT Summary of this function goes here
%   Detailed explanation goes here

if nargin < 3
    spec = 'b';
end

semilogy(10*log10(x), y, spec);

end

