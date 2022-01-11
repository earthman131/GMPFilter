function [h,ss] = psa(g,nx,ny,dx,m,fb)
nmax = max([nx ny]);
n = 2^nextpow2(nmax);
nn = floor(n/2);
gf = fft2(g,n,n);
gfa = abs(gf(1:nn,1:nn));
gfp = gfa.^2;
k = 0;
dr = 2*pi/((n-1)*dx);
for i=1:nn
    v=(i-1)*dr;
    for j=1:i
        k=k+1;
        u=(j-1)*dr;
        rr(k)=sqrt(u*u+v*v);
        gfpr(k)=(gfp(i,j)+gfp(j,i))/2.0;
    end
end
gfpr=log(gfpr);
r=0.0:dr:((nn-1)*dr);
[rr1,I1]=sort(rr);
gfpr1=gfpr(I1);
l=1;
rflag=0;
r1=r(1);
r2=r(1)+0.3*dr;
i1=1;
gt=gfpr1(1);
for i=2:k
    if (rr1(i)>=r1+dr)&&(rr1(i)<=r2+dr)
        gfpr2(l)=gt/i1;
        i1=1;
        gt=gfpr1(i);
        rflag=1;
    elseif (rr1(i)>=r1)&&(rr1(i)<=r2)
        i1=i1+1;
        gt=gt+gfpr1(i);
    end
    if rflag==1
        l=l+1;
        if l>nn
            break;
        end
        r1=r(l)-0.3*dr;
        r2=r(l)+0.3*dr;
        rflag=0;
    end
end
psg=gfpr2;
nm=zeros(m-1,1);
for i=1:(m-1)
    nm(i)=round(nn*fb(i)/100.0);
end
[h,~] = get_h(r,psg,nn,m,nm);
ss = get_p(h,r,psg,nn,m,nm);