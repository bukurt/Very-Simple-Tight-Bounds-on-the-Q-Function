function [ tNumeric, tCalc, tJensen, tExp] = qPerformans()
clc;clear all;
au=48.8828;
bu=2.0047;
al=12.1628;
bl=2.5066;

x = 0:0.1:5;
n = length(x);
% q = zeros(1, n);
% qCalc = zeros(1, n);
% qju = zeros(1, n);
% qjl = zeros(1, n);
% qExp = zeros(1, n);

tic;
q = qFuncNumeric(x);
tNumeric = toc;

tic;
qCalc = (0.5*exp(-11*x)).*qFunc(x, al, bl) + (1-0.5*exp(-10*x)).*qFunc(x, au, bu);
tCalc = toc;

tic;
[qjl, qju] = qjFunc(x);
tJensen = toc;

tic;
qExp = qFuncExp(x, 100);
tExp = toc;

end