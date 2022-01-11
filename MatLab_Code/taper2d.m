function gf = taper2d(g,npts,nx,ny,xdiff,ydiff)
gf=zeros(npts); gf(ydiff+1:ydiff+ny,xdiff+1:xdiff+nx)=g;
for J=ydiff+1:ydiff+ny
    for I=1:xdiff
        gf(I,J)=gf(I,J)*((1+sin(-pi/2+(I-1)*pi/xdiff))*0.5);
        gf(npts-I+1,J)=gf(npts-I+1,J)*((1+sin(-pi/2+(I-1)*pi/xdiff))*0.5);
    end
end
for I=xdiff+1:xdiff+nx
    for J=1:ydiff
        gf(I,J)=gf(I,J)*((1+sin(-pi/2+(J-1)*pi/(ydiff)))*0.5);
        gf(I,npts-J)=gf(I,npts-J)*((1+sin(-pi/2+(J-1)*pi/(ydiff)))*0.5);
    end
end
for J=1:ydiff
    for I=1:xdiff
        gf(I,J)=gf(I,J)*((1+sin(-pi/2+(I-1)*pi/(xdiff)))*0.5);
        gf(npts-I,J)=gf(npts-I,J)*((1+sin(-pi/2+(I-1)*pi/(xdiff)))*0.5);
    end
end
for J=ydiff+ny:npts
    for I=1:xdiff
        gf(I,J)=gf(I,J)*((1+sin(-pi/2+(I-1)*pi/(xdiff)))*0.5);
        gf(npts-I,J)=gf(npts-I,J)*((1+sin(-pi/2+(I-1)*pi/(xdiff)))*0.5);
    end
end
for J=ydiff+ny:npts
    for I=xdiff+nx:npts
        gf(I,J)=gf(I,J)*cos((I-xdiff-nx)*pi/(2*xdiff))*cos((J-xdiff-ny)*pi/(2*ydiff));
    end
end
for J=1:ydiff
    for I=1:xdiff
        gf(I,J)=gf(I,J)*cos((I-xdiff)*pi/(2*xdiff))*cos((J-xdiff)*pi/(2*ydiff));
    end
end
for J=1:ydiff
    for I=xdiff+nx:npts
        gf(I,J)=gf(I,J)*cos((I-xdiff-nx)*pi/(2*xdiff))*cos((J-xdiff)*pi/(2*ydiff));
    end
end
for J=ydiff+ny:npts
    for I=1:xdiff
        gf(I,J)=gf(I,J)*cos((I-xdiff)*pi/(2*xdiff))*cos((J-xdiff-ny)*pi/(2*ydiff));
    end
end