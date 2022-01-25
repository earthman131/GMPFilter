%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Preferential filtering method - Step 2 Preferential filtering method
% Author: Lianghui Guo (guolh@cugb.edu.cn)
% Organization: China University of Geosciences (Beijing), School of Geophysics and Information Technology
% Compiled version: MATLAB R2017b
% Reference:
%       Lianghui Guo, Xiaohong Meng, Lei Shi, et al. Preferential filtering method and its application to Bouguer gravity anomaly of Chinese contient.
%       Chinese Journal of Geophysics-Chinese Edition, 2012, 55(12):4078-4088.
%       Lianghui Guo, Xiaohong Meng. Preferential filtering for gravity anomaly separation. Computers & Geosciences, 2013, 51: 247-254
% Description of the input parameters: 
%       infile1£ºanomaly data
%       infile2£ºpower spectrum fitting data
%       f1£ºfrequency band of preferential filtering method, used for low pass filtering
% Description of the output parameters: 
%       outfile: result file
% Description of primary identifiers£º
%       x, y: x, y verctor
%       nx, ny: number of points in x and y directions
%       dx, dy: spacing in x and y directions
%       m: total number of frequency band
%       h: intial depth
%       ss: equivalent layer power spectral density function
% Description of subroutine function: 
%       readgrd.m: read surfer text grd file
%       readtxt.m: read txt file
%       g_pu.m:  preferential filtering 
%       taper2d.m: cosine attenuation edge extension
%       savegrd.m: save surfer text grd file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%% I/O parameters %%%%%%%%%%%%%
infile1 = 'mc_gn2e.grd'; 
infile2 = 'mc_gn2e_psp.txt'; 
f1 = 1; 
outfile = 'mc_gn2e_pu.grd'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[g,x,y,nx,ny,dx,dy] = readgrd(infile1);
[m,h,ss] = readtxt(infile2);
[X,Y] = meshgrid(x,y);
nmax = max([nx ny]);
npts = 2^nextpow2(nmax); 
dr = 2*pi/((npts-1)*dx); 
% preferential filtering
gpu = g_pu(g,npts,ss,m,h,f1,nx,ny,dr);
% save
savegrd(gpu,x,y,nx,ny,outfile);