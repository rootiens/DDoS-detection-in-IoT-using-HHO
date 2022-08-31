function [yy] = fullcon(z)
%im_pooling: Output of the finall pooling layer
[M,N,P]=size(z);
yy=zeros(M*N*P,1);
i=1;
for k=1:P
    for m=1:M
        for n=1:N
            yy(i,1)=max(0,z(m, n, k));
            i=i+1;
        end
    end
end
end