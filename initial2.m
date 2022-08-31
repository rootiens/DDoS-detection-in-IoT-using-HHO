function [vanttab,tt,tf,datatab,datatab2,anttab,tc,tkh,ttkh,acc,precision,Recall,fmeasure,iter]=initial2
tt=50; % tedade nemoone
tf=300; % tedade feature
datatab=zeros(tf,tt+1);
datatab2=zeros(tf,tt);
anttab=zeros(tf,tt);
vanttab=zeros(tf,1);
tc=9; % tedade cluster
tkh=5; % tedade dafeat ejra
ttkh=[40,60,80,100,120]; % tedade sample haye har ejra
acc=zeros(2,tkh);
precision=zeros(2,tkh);
Recall=zeros(2,tkh);
fmeasure=zeros(2,tkh);
iter=zeros(1,tkh); % iteration 
end

