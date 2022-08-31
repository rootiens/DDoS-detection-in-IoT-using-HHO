function [I_POOLING] = pooling(y)
L=fix(size(y,1)/2)*2;
m=1;
for i=1:2:L
    A=[y(i,1), y(i+1,1)];
    I_POOLING(m,1)=max(A);
    m=m+1;
end
end