function [h,f1] = get_h(r,s,nn,m,nm)
for i=1:m
    if i==1
        n1=1:nm(1);
        [p1,~]=polyfit(r(n1),s(n1),1);
        f1(n1)=polyval(p1,r(n1));
    elseif i==m
        n1=nm(m-1):nn;
        [p1,~]=polyfit(r(n1),s(n1),1);
        f1(n1)=polyval(p1,r(n1));
    else
        n1=nm(i-1):nm(i);
        [p1,~]=polyfit(r(n1),s(n1),1);
        f1(n1)=polyval(p1,r(n1));
    end
    h(i)=abs(p1(1))/2;
end

