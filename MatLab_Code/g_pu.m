function gpu = g_pu(data,npts,ss,m,h,f1,nx,ny,dr)
xdiff=floor((npts-nx)/2); ydiff=floor((npts-ny)/2);
data1=taper2d(data,npts,nx,ny,xdiff,ydiff);
f=fft2(data1); 
fpuz=f;
f=fftshift(f);
cx=npts/2+1; cy=cx;
for I=1:npts
    kx=(I-cx)*dr;
    for J=1:npts
        ky=(J-cy)*dr;
        cr=sqrt(kx*kx+ky*ky);
        p=0;
        pd=0;
        for k=1:m
            p=p+exp(-2*cr*h(k))*ss(k);
            if k<=f1
                pd=p;
            end
        end
        fpu=pd/p;
        fpuz(I,J)=f(I,J)*fpu;
    end
end
fpuz=fftshift(fpuz); fzinv=ifft2(fpuz);
gpu=real(fzinv(1+ydiff:ny+ydiff,1+xdiff:nx+xdiff));