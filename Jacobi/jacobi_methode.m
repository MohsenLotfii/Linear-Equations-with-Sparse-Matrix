%===================== "Conduction Heat Transfer 2D" =====================%
% --- Solving the 2-D Poisson equation by the Finite Difference Method ---%
% -- Numerical scheme used is a second order central difference in space -%
% -------------------------(5-point difference)---------------------------%
%=========================================================================%
% Created by: 'Mohsen Lotfi'
% Last Revised: 20 April 2017
% Persian Gulf University, Bushehr, Iran

tic
    
% clear work space
clear
clc

% define variables 
Nx = 20 ;        % number of nodes in the x direction
Ny = 20 ;        % number of nodes in the y direction
tol = 1d-6 ;     % tolerance
err = 1 ;        % error
k = 0 ;          % iteration counter

% define u array
u = [200*ones(1,20); zeros(19,20)];

ukp1 = u; % u_k+1

% iterate jacobi until convergance 
while err > tol
    
    % update iteration counter 
    k = k + 1;
    
    % loop through computational nodes
    for j = 2 : Ny - 1
        for i = 2 : Nx - 1
            ukp1(i,j)= 0.25*(u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j-1));
        end
    end
    
    % calculate error
    err = sqrt(sum(sum((ukp1-u).^2)));
    
    % update u
    u = ukp1 ;
end

u_numerical1 = u;

% Plotting the solution
figure(1)
contourf(u); title('Temperature plot (contourf)')
colorbar

figure(2)
contour(u); title('Temperature plot (contour)')
colorbar

toc
