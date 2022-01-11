function [m,h,ss] = readtxt(infile)
fp=fopen(infile,'rt');
m=fscanf(fp,'%d',1);
for i=1:m
    h(i)=fscanf(fp,'%g',1);
end
for i=1:m
    ss(i)=fscanf(fp,'%g',1);
end
fclose(fp);