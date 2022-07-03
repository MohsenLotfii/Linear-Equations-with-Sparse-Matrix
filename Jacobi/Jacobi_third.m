% Created by: 'Mohsen Lotfi'
% Last Revised: 26 Des 2017
% Persian Gulf University, Bushehr, Iran
tic
% clear work space
clear all
clc
close all
%% Iterative Methode 

% define variables 
m=('input m')
N=10^m;
h=10/N;
Nx = N;          % number of nodes in the x direction
Ny = N;          % number of nodes in the y direction
tol = 1d-6 ;     % tolerance
err = 1 ;        % error

% Define u array
u = [ones(1,20);zeros(19,20)];
ukp1 = u; % u_k+1

% iterative jacobi until convergance 

while err > tol
    % Update iteration counter
    k = k + 1;
    % loop through computational nodes
for  j = 2 : Ny-1
    for  i = 2 : Nx-1
        a(ij)=(sqrt(pi))*(exp(-1*((i-j).^2)*(h.^2)));
        b(i)=(i/N)*(1-(i/N));
    end
end
    % calculate error
    err = sqrt(sum(sum((ukp1-u).^2)));
    
    % update u
    u = ukp1 ; 
end


toc 