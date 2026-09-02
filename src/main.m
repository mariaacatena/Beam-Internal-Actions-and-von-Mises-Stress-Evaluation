% PARAMETERS
L = 2.5; %m
b = 0.25; %m
h = 0.15; %m

N = 800; %N
T = 950; %N

% matrix of external forces and their application points
Fx = [-N 0 0]';
Pfx = [L 0 0]';
Fy = [0 -T 0]';
Pfy = [L 0 0]';
Fz = [0 0 0]';
Pfz = [0 0 0]';

F = [Fx Fy Fz];
Pf = [Pfx Pfy Pfz];

for i = 1:3
    Mf(:,i) = cross(Pf(:,i),F(:,i));  % moment due to each force
end


% INPUT: condition = true for manual input, condition = false to continue
% without input
condition = false
[Cfl Pfl Ct Pt nfl nt] = manualInput(condition);


% EXTERNAL LOADS
F_tot = [0,0,0]';
M_tot = [0,0,0]';

for i = 1:3
    F_tot = F_tot + F(1:3,i);
    M_tot = M_tot + Mf(1:3,i);
end
for(i = 1:nt)
    M_tot = M_tot + Ct(1:3, i);
end
for(i = 1:nfl)
    M_tot = M_tot + Cfl(1:3, i);
end

W_tot = [F_tot;M_tot];

% REACTION LOADS
[R Mr Pr] = reactions(W_tot);

% TOTAL LOADS
forces_block = [F; Pf; zeros(3, size(F, 2))]; 
couples_block = [zeros(3, size([Cfl Ct], 2)); [Pfl Pt]; [Cfl Ct]];
reactions_block = [R; Pr; Mr];

tmp_Loads = [forces_block couples_block reactions_block];

Loads = sortrows(tmp_Loads',4)'; % orded with respect to x

% INTERNAL ACTIONS
[W_F W_M S] = internalActions(Loads);

% PLOT
subplot(4,1,1)
plot(S,W_F(1,:))
grid on
ylabel('N')
xlabel('m')
legend('N')

subplot(4,1,2)
plot(S,W_F(2,:))
hold on
plot(S,W_F(3,:))
grid on
ylabel('N')
xlabel('m')
legend('T_y','T_z')

subplot(4,1,3)
plot(S,W_M(2,:))
hold on
plot(S,W_M(3,:))
grid on
ylabel('Nm')
xlabel('m')
legend('M_y','M_z')

subplot(4,1,4)
plot(S,W_M(1,:))
grid on
ylabel('Nm')
xlabel('m')
legend('M_t')


% STRESS STATE CALCULATION
[sigma_n sigma_my sigma_mz sigma_eq tau_ty tau_tz tau_mx x] = stressState(b, h, L, Loads);

figure
subplot(3, 1, 1)
plot(x, sigma_n);
grid on
ylabel('N/m^2')
xlabel('m')
legend('sigma_N')

subplot(3, 1, 2)
plot(x, tau_ty);
grid on
ylabel('N/m^2')
xlabel('m')
legend('tau_{Ty}')

subplot(3, 1, 3)
plot(x, tau_tz);
grid on
ylabel('N/m^2')
xlabel('m')
legend('tau_{tz}')

figure
subplot(3, 1, 1)
plot(x, tau_mx);
grid on
ylabel('N/m^2')
xlabel('m')
legend('tau_{Mx}')

subplot(3, 1, 2)
plot(x, sigma_my);
grid on
ylabel('N/m^2')
xlabel('m')
legend('sigma_{My}')

subplot(3, 1, 3)
plot(x, sigma_mz);
grid on
ylabel('N/m^2')
xlabel('m')
legend('sigma_{Mz}')

figure
plot(x, sigma_eq);
grid on
ylabel('N/m^2')
xlabel('m')
legend('sigma_{eq}')
