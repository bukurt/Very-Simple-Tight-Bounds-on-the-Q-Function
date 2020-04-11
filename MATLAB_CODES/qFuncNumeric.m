function [ y ] = qFuncNumeric( x )
%QFUNCNUMERIC Numeric Q Function Calculation with Trapezoidal Integration

n = length(x);
y = zeros(1, n);
step = 0.01;
uLimit = 10;

for i = 1:n
    for t = x(i):step:uLimit
        y(i) = y(i) + step * 0.5 * (exp((-t^2)/2) + exp((-(t+step)^2)/2)) / sqrt(2*pi);
    end
end

end

