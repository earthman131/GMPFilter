function savetxt(outfile,m,h,ss)
fp=fopen(outfile,'wt');
fprintf(fp,'%d\n',m);
for i=1:m
    fprintf(fp,'%g\t',h(i));
end
fprintf(fp,'\n');
for i=1:m
    fprintf(fp,'%g\t',ss(i));
end
fprintf(fp,'\n');
fclose(fp);
