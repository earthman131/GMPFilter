%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Preferential filtering method - Step 1 Power spectrum analysis
% Author: Lianghui Guo (guolh@cugb.edu.cn)
% Organization: China University of Geosciences (Beijing), School of Geophysics and Information Technology
% Compiled version: MATLAB R2017b
% Reference: 
%       Lianghui Guo, Xiaohong Meng, Lei Shi, et al. Preferential filtering method and its application to Bouguer gravity anomaly of Chinese contient.
%       Chinese Journal of Geophysics, 2012, 55(12):4078-4088.
% Description of the input parameters: 
%       infile: anomaly data after edge expansion
%       m: total number of frequency band
%       fb: percentage of frequency cutoff points, from low to high
% Description of the output parameters:
%       outfile: result file
% Description of primary identifiers£º
%       x, y: x, y verctor
%       nx, ny: number of points in x and y directions
%       dx, dy: spacing in x and y directions
%       h: initial depth
%       ss: equivalent layer power spectral density function
% Description of subroutine function: 
%       readgrd.m: read surfer text grd file
%       psa.m: power spectrum analysis
%       get_h.m: fitting radial logarithmic power spectrum and solving initial depth
%       get_p.m: power spectral density function
%       savetxt.m: save power spectrum fitting data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%% I/O parameters %%%%%%%%%%%%%
infile = 'mc_gn2e.grd';
m = 3; 
fb = [6 25]; 
outfile = 'mc_gn2e_psp.txt'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[g,x,y,nx,ny,dx,dy] = readgrd( infile );
[X,Y] = meshgrid(x,y);
% power spectrum analysis
[h,ss] = psa(g,nx,ny,dx,m,fb);
% save
savetxt(outfile,m,h,ss)
