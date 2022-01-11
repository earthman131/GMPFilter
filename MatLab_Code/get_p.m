function ss = get_p(h,r,s0,nn,m,nm)
for i=1:m
    if i==1
        n11(i)=2;
        n12(i)=nm(i)-1;
    elseif i==m
        n11(i)=nm(i-1)+1;
        n12(i)=nn-1;
    else
        n11(i)=nm(i-1)+1;
        n12(i)=nm(i)-1;
    end
end
for i=1:m
    for j=1:nn
        a(j,i)=exp(-2*r(j)*h(i));
    end
end
[p1,~]=polyfit(r,s0,10);
s=polyval(p1,r);
sss=exp(s);
for i=1:m
    ss(i)=sss(n11(i))/a(n11(i),i);
end
s1=smooth(s);
P=a*ss';
pp=log(P);
maxs=0.005*(s(1)-s(nn));
for i=1:20
    for j=1:m
        if pp(n11(j))-s1(n11(j))>maxs
            ss(j)=0.9*ss(j);
        elseif pp(n11(j))-s1(n11(j))<-maxs
            ss(j)=1.1*ss(j);
        end
    end
    P = a*ss';
    pp=log(P);
    for j=1:(m)
        if pp(n12(j))-s1(n12(j))>maxs
            ss(j)=0.9*ss(j);
        elseif pp(n12(j))-s1(n12(j))<-maxs
            ss(j)=1.1*ss(j);
        end
    end
    P = a*ss';
    pp=log(P);    
end
