clc
clear all
close all
[vanttab,tt,tf,datatab,datatab2,anttab,tc,tkh,ttkh,acc,precision,Recall,fmeasure,iter]=initial2;
%make dataset(train and test)
[datatab,datatab2,coms,tv]=makedata(datatab,datatab2,tt,tf);
%feature selection
[anttab,vanttab]=makeant(tf,anttab,tt,datatab,vanttab);
data1=[datatab2,anttab];   
tag=datatab(:,end);
dim=size(data1,2);
w0=reshape(data1,[10,10,tf]);
b2=10;
b3=10;
b1=tf;
%initial
tt=50;
fobj = @fit2; % copy kardane tabe fit to variable
N=20; % Number of search agents
T=10; % Maximum number of iterations
lb=0;
ub=1;
dim2=b2*dim;
[Rabbit_Energy,Rabbit_Location,CNVG]=HHO(N,T,lb,ub,dim,fobj,b1,w0,tag,b2);
sol=Rabbit_Location;
yy5=[];
for u=1:b1
    v3=w0(:,:,u);
    [z] = cnn(v3,sol);
    [yy] = fullcon(z);
    yy5(:,u)=yy;
end
yy5=yy5';
b5=size(yy5,2);
%clear w0
%net1
[net,e,y]=NN(data1,tag);
%net2
[net2,e2,y2]=NN(yy5,tag);
[net6,outputs,Class,nClass]=som2(data1');  
%extract k=10 center of cluster(ci1-cim)
marakez=net.IW{:};
out2=vec2ind(outputs); 

%calculate mi
tedad=zeros(1,2);
mi=zeros(2,nClass);
for cc=1:2
    [zz]=find(datatab(:,tt+1)==cc-1);
    sz=size(zz,1);
    tedad(1,cc)=sz;
end
for hh=1:nClass
    [vv]=find(out2(1,:)==hh);
    for cc=1:2
        [zz]=find(datatab(vv,tt+1)==cc-1);
        sz=size(zz,1);
        mi(cc,hh)=sz/tedad(1,cc);
    end
end
ttest=randperm(tf,max(ttkh));
testdata=data1(ttest,:);
tag2=tag(ttest);
lastres=zeros(4,tkh);
for bb=1:tkh
    bb
    %for test data
    ttd=ttkh(1,bb);
    temp3=1:ttd;
    testtab=testdata(temp3,:);
    initres=tag2(temp3);
    res2=zeros(ttd,1);
    for th=1:2
        if th==1
            %th=1
            yyy=round(net(testtab'));
            yyy=yyy';
            [acc,precision,Recall,fmeasure,lastres]=result1(lastres,bb,ttd,yyy,initres,acc,precision,Recall,fmeasure,th);
        else
            %th=2
            %calculate pi by distance from center as ai and  mi value
            ai2=zeros(ttd,nClass);
            pi2=zeros(1,ttd);
            pkj=zeros(ttd,2);
            for gg=1:ttd
                pr=data1(gg,:);
                for hh=1:nClass
                    ai2(gg,hh)=1+norm(pr-marakez(hh,:));
                end
                for gg2=1:2
                    ppp=0;
                    for gg3=1:nClass
                        ppp=ppp+(mi(gg2,gg3)/ai2(gg,gg3));
                    end
                    pkj(gg,gg2)=ppp/nClass;
                end
            end
            shakhes2=zeros(ttd,1);
            [val,idx]=sort(pkj,2,'descend');
            for gg=1:ttd
                shakhes2(gg,1)=idx(gg,1)-1;
            end
            [acc,precision,Recall,fmeasure,lastres]=result1(lastres,bb,ttd,shakhes2,initres,acc,precision,Recall,fmeasure,th);
        end
    end
    iter(1,bb)=ttd;
end
%%result2
figure
bar(iter,acc')
xlabel('number of samples')
ylabel('accuracy')
title('accuracy in detect Attack ')
leg1=legend('Base work','proposed method');
set(leg1,'Location','NorthWest');


figure
bar(iter,precision')
xlabel('number of samples')
ylabel('precision')
title('precision in detect Attack ')
leg1=legend('Base work','proposed method');
set(leg1,'Location','NorthWest');


figure
bar(iter,Recall')
xlabel('number of samples')
ylabel('Recall')
title('Recall in detect Attack ')
leg1=legend('Base work','proposed method');
set(leg1,'Location','NorthWest');


figure
bar(iter,fmeasure')
xlabel('number of samples')
ylabel('F-measure')
title('F-measure in detect Attack ')
leg1=legend('Base work','proposed method');
set(leg1,'Location','NorthWest');
