function [datatab,datatab2,coms,tv]=makedata(datatab,datatab2,tt,tf)
%percent of each type
m1=0.8;
m2=0.15;
m3=0.05;
solution.a=[];
%tf is count of users
coms=repmat(solution,[tf,1]);
%define command for each user
for cc=1:(tf/20)    
    for cc1=1:(m1*20) %normal
        com1=[];
        i=(cc-1)*20+cc1;
        for hh=1:tt  % HTTP request
            b1=randi(10);
            d1=round(rand);
            if d1==1
                b1=b1+randi(50);
            end
            datatab(i,hh)=b1;
            com1=[com1,b1];
        end
        coms(i).a=com1;
        datatab(i,tt+1)=0;  %tag
    end
    nn=i;
    for cc1=1:(m2*20) %intrusion pattern
        com1=[];
        i=cc1+nn;
        for hh=1:tt
            b1=40+randi(5);
            datatab(i,hh)=b1;
            com1=[com1,b1];
        end
        coms(i).a=com1;
        datatab(i,tt+1)=1;  
    end
    nn=i;
    for cc1=1:(m3*20) %new samples
        com1=[];
        i=cc1+nn;
        for hh=1:tt
            b1=25+randi(20);
            datatab(i,hh)=b1;
            com1=[com1,b1];
        end
        coms(i).a=com1;
        datatab(i,tt+1)=1;  
    end
end
datatab2=datatab(:,1:tt);
tv=(1-m1)*tf;
end

