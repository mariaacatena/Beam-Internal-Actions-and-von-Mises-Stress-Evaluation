function [R Mr Pr] = reactions(W_tot)
    Rx = [1 0 0]';
    Mrx = [1 0 0]';
    Prx = [0 0 0]';
    Ry = [0 1 0]';
    Mry = [0 1 0]';
    Pry = [0 0 0]';
    Rz = [0 0 1]';
    Mrz = [0 0 1]';
    Prz = [0 0 0]';
    
    R = [Rx Ry Rz]; % constraint forces
    Mr = [Mrx, Mry, Mrz]; % generic constraint moments
    Pr = [Prx Pry Prz]; % application points
    
    
    A = [R, zeros(3,3); zeros(3,3), Mr];
    
    %solve the equilibrium equations to find the constraint force coefficients
    Norm_r = -inv(A)*W_tot;
end