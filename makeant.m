function [anttab,vanttab]=makeant(tf,anttab,tt,datatab,vanttab)
% entropy of request
for jj=1:tf
    sum1=sum(datatab(jj,1:tt))+1;
    for ii=1:tt
        if datatab(jj,ii)~=0
            anttab(jj,ii)=-log(datatab(jj,ii)/sum1);
        end
    end
end
% varience of http request antropy
for jj=1:tf
    v1=0;
    sum1=sum(anttab(jj,:));
    for ii=1:tt
        v1=v1+(abs(anttab(jj,ii)-sum1)^1);
    end
    vanttab(jj,1)=v1/tt;
end

end

