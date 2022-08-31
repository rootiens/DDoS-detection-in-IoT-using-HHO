function z=fit2(x3,b1,w0,tag,b2)
for u=1:b1
    v3=w0(:,:,u);
    [z] = cnn(v3,x3);
    [yy] = fullcon(z);
    yy2(:,u)=yy;
end
yy3=yy2';
 Mdl = fitcknn(yy3,tag','NumNeighbors',5);
 rng(1); % For reproducibility
 CVKNNMdl = crossval(Mdl);
 classError = kfoldLoss(CVKNNMdl);
z=classError;
end
