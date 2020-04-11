sum=zeros(1,4);

x=1000;
for i=1:x
[ tNumeric, tCalc, tJensen, tExp]=qPerformans;
sum(1)=sum(1) + tNumeric;
sum(2)=sum(2)+tCalc;
sum(3)=sum(3)+tJensen;
sum(4)=sum(4)+tExp;
end

sum=sum./x
