function [sigma_n sigma_my sigma_mz sigma_eq tau_ty tau_tz tau_mx x] = stressState(b, h, L, Loads)
    [m n] = size(Loads);
    step = 0.01;
    x = 0:step:L;
    y = 0:step:h;
    
    c1 = 1/(3 + 1.8/(b/h));
    
    sigma_n = zeros(size(x)); 
    tau_ty = zeros(size(x));
    tau_tz = zeros(size(x));
    sigma_my = zeros(size(x));
    sigma_mz = zeros(size(x));
    sigma_eq = zeros(size(x));
    tau_mx = zeros(size(x));
    
    i=1;
    j=1;
    N_parziale = 0;
    Ty_parziale = 0;
    Tz_parziale = 0;
    Mx_parziale = 0;
    My_parziale = 0;
    Mz_parziale = 0;
    
    while(i<=length(x))
    
        if(i>1)
            My_parziale = My_parziale - Tz_parziale * step; %step is the distance between two consecutive points of x
            Mz_parziale = Mz_parziale - Ty_parziale * step;
        end
    
        while(j<=n && Loads(4,j)<=x(i)) %update the loads once reached
            N_parziale = N_parziale - Loads(1, j);
            Ty_parziale = Ty_parziale - Loads(2, j);
            Tz_parziale = Tz_parziale - Loads(3, j);
            Mx_parziale = Mx_parziale - Loads(7, j);
            My_parziale = My_parziale - Loads(8, j);
            Mz_parziale = Mz_parziale - Loads(9, j);
    
            j = j+1;
        end
    
        sigma_n(i) =  N_parziale/(b*h);
        tau_ty(i) = 3*Ty_parziale/(2*b*h); %calculated in y=0
        tau_tz(i) = 3*Tz_parziale/(2*b*h);
        tau_mx(i) = Mx_parziale/(c1*b*h^2);
        sigma_my(i) = 6*My_parziale/(b*h^2); %calculated in y=h/2
        sigma_mz(i) = 6*Mz_parziale/(b^2*h); 
    
        sigma_eq(i) = sqrt((sigma_n(i)+sigma_my(i)+sigma_mz(i))^2+ 3*(tau_ty(i)+tau_tz(i)+tau_mx(i))^2);
    
        i=i+1;
    
    end
end