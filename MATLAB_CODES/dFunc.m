function [ dl, du ] = dFunc( x, n, au, bu, al, bl )
%DFUNC Summary of this function goes here
%   Detailed explanation goes here

N = length(x);

qu = qFunc(x, au, bu);
ql = qFunc(x, al, bl);
q = qFuncNumeric(x);

[quMax, i] = max(qu);
[qlMax, i] = max(ql);

dl = zeros(1, N);
du = zeros(1, N);

step = 0.01;
for i = 1:N
    for t = 0:step:x(i)
        du(i) = du(i) + 0.5 * step * n * (((qFuncNumeric(t)/0.5).^n)*log10((qFunc(t, au, bu)/quMax)/(qFuncNumeric(t)/0.5)) + ((qFuncNumeric(t+step)/0.5).^n)*log10((qFunc(t+step, au, bu)/quMax)/(qFuncNumeric(t+step)/0.5)));
        dl(i) = dl(i) + 0.5 * step * n * (((qFuncNumeric(t)/0.5).^n)*log10((qFuncNumeric(t)/0.5)/(qFunc(t, al, bl)/qlMax)) + ((qFuncNumeric(t+step)/0.5).^n)*log10(((qFuncNumeric(t+step)/0.5)/qFunc(t+step, al, bl)/quMax)));
    end
end


end
