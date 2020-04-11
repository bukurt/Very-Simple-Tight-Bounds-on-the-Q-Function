close all; clear all; clc;

au=48.8828;
bu=2.0047;
al=12.1628;
bl=2.5066;

x = 0:0.1:5;
n = length(x);

fprintf('Numeric : ');
tic;
q = qFuncNumeric(x);
toc;

fprintf('\n Simple Up : ');
tic;
qu = qFunc(x, au, bu);
toc;

fprintf('\n Simple Low : ');
tic;
ql = qFunc(x, al, bl);
toc;

fprintf('\nqCalc : ');
tic;
qCalc = qcFunc(x, au, bu, al, bl);
toc;

fprintf('\nJensen-Cotes : ');
tic;
[qjl, qju] = qjFunc(x);
toc;

fprintf('\n Exp : ');
tic;
qExp = qFuncExp(x, 2);
toc;

deltaQu = qu - q;
deltaQl = ql - q;
dQu = 0; dQl = 0;

for i = 1:n
    if deltaQu(i) >= -1e-3
        dQu = dQu + 1/n;
    end
    if deltaQl < 0
        dQl = dQl + 1/n;
    end
end

figure;
plot(x, qExp, 'black');hold on;
plot(x, q);hold on;
plot(x, ql, 'r-.'); hold on;
plot(x, qu, 'r-.');hold on; 
plot(x, qCalc, 'g-.'); hold on;
legend('Exponantial N=2','Numerical Integration','New Lower Supertight Bound','New Upper Supertight Bound','Combined Supertight')
plot(-x, 1-qExp, 'black');hold on;
plot(-x, 1-q);hold on;
plot(-x, 1-qu, 'r-.');hold on; 
plot(-x, 1-ql, 'r-.'); hold on;
plot(-x, 1-qCalc, 'g-.');hold on;
title('Comparison of Q-Functions');xlabel('x');ylabel('Q(x)');

figure;
qPlot(x, qExp, 'r');hold on;
qPlot(x, qjl, 'g-.');hold on;
qPlot(x, qju, 'g-.');hold on;
qPlot(x, ql, 'black-*'); hold on;
qPlot(x, qu, 'black-*'); hold on;
qPlot(x, q);hold on;
legend('Exponantial N=2', 'Jensen-Cotes Lower Bound', 'Jensen-Cotes Upper Bound', 'New Lower Supertight Bound', 'New Upper Supertight Bound','Numerical Integration');
title('Comparison of Q-Functions');xlabel('x in dB');ylabel('Q(x)');

figure;
qPlot(x, qExp, 'r'); hold on
qPlot(x, qjl, 'g-.'); hold on;
qPlot(x, qju, 'g-.'); hold on;
qPlot(x, ql, 'black-*'); hold on;
qPlot(x, qu, 'black-*'); hold on;
qPlot(x, q); hold on;
xlim([2 4]);
ylim([0.01 0.1]);
legend('Exponantial N=2', 'Jensen-Cotes Lower Bound', 'Jensen-Cotes Upper Bound', 'New Lower Supertight Bound', 'New Upper Supertight Bound','Numerical Integration');

% [dl, du] = dFunc(x, 1, au, bu, al, bl);
% figure;
% qPlot(x, dl);

mu = 0:0.1:10;

figure;
for sigma = 0.5:0.5:1
    [iu, il, iju, ijl, inu, inl] = iFunc(mu, sigma, au, bu, al, bl);
    qPlot(mu, il, 'black-*'); hold on;
    qPlot(mu, iu, 'black-*'); hold on;
    qPlot(mu, ijl, 'black-.'); hold on;
    qPlot(mu, iju, 'black-.'); hold on;
    qPlot(mu, inl, 'black'); hold on;
    qPlot(mu, inu, 'black'); hold on;
end
xlim([0 8]);
ylim([1e-8 0.1]);
legend('New Supertight Lower Bound', 'New Supertight Upper Bound', 'Jensen-Cotes Lower Bound', 'Jensen-Cotes Upper Bound', 'Numerical Integration Lower Bound', 'Numerical Integration Upper Bound');
title('Comparison of Bounds on Q(x) in the Evaluation of Equation (7)');xlabel('mu in dB');ylabel('I(mu;sigma)');

% Load data of BPSK simulation for BER graph
load ('BER_data.mat','-mat');
step=1;
x=0:step:18;
figure;
x2=((x/2).^2);
berC = qcFunc(2*sqrt(10.^(.1*(x-3))), au, bu, al, bl);
% ber = qFuncNumeric(2*sqrt(10.^(.1*(x-3))));
error = (abs(ber0 - berC)).^2;
% semilogy(x,ber); hold on;
semilogy(x, berC, 'b-*');hold on;
semilogy(x,berT,'g');hold on;
semilogy(x,ber0,'r-.');hold on;
legend('Combined New Supertight Bounds','Theoratical','MonteCarlo Simulation')
xlabel('x in dB');ylabel('BER');

% figure;
% semilogy(x, error);
% title('BER Error Analysis of New Supertight Bounds');xlabel('x in dB');ylabel('Absolute Error');
