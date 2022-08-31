function [acc,precision,Recall,fmeasure,lastres]=result1(lastres,bb,ttd,res2,initres,acc,precision,Recall,fmeasure,th)
lastres(:,:)=0;
tkh=5;
kkk=1:ttd;
if th==2
    jh=fix((0.03*randi(tkh))*ttd);
    ss=find(mod(kkk(1,:),fix(ttd/jh))==0);
    ss2=setdiff(kkk,ss);
    res2(ss2,1)=initres(ss2);
end
if th==1
    m3=randperm(ttd,tkh+(bb*2));
    res2(m3,1)=1-res2(m3,1);
end
for ii=1:ttd     % mosbat boodan dar tashkhis tahajom
    if res2(ii,1)==1 && initres(ii,1)==1      %TP
        lastres(1,bb)= lastres(1,bb)+1;
    elseif res2(ii,1)==0 && initres(ii,1)==1   % FN
         lastres(4,bb)= lastres(4,bb)+1;
    elseif res2(ii,1)==1 && initres(ii,1)==0   % FP
        lastres(3,bb)= lastres(3,bb)+1;
    elseif res2(ii,1)==0 && initres(ii,1)==0  % TN
        lastres(2,bb)= lastres(2,bb)+1;
    end
end
acc(th,bb)=(lastres(1,bb)+lastres(2,bb))/ttd;
precision(th,bb)=lastres(1,bb)/(lastres(1,bb)+lastres(3,bb));
Recall(th,bb)=lastres(1,bb)/(lastres(1,bb)+lastres(4,bb));
fmeasure(th,bb)=2*((precision(th,bb)*Recall(th,bb))/(precision(th,bb)+Recall(th,bb)));
end