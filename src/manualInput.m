function [Cfl Pfl Ct Pt nfl nt] = manualInput(condition)
    if(condition)
        nfl = input('Number of bending moments: ');
        Cfl = zeros(3, nfl); % Mx, My, Mz
        Pfl = zeros(3, nfl); %x,y,z punto di applicazione
        for i = 1:nfl
            %M = [My, Mz, x];
            inputMf = input('Insert a bending moment [My, Mz, x]: ');
            Cfl(:, i) =  [0, inputMf(1), inputMf(2)];
            Pfl(:, i) = [inputMf(3) 0 0];
        end
    
        nt = input('Number of torques: ');
        Ct = zeros(3, nt); %Mx, My, Mz
        Pt = zeros(3, nt); %x,y,z application points
        for i = 1:nt
            %M = [Mx, x];
            inputMt= input('Insert a torque [Mx, x]: ');
            Ct(:, i) =  [inputMt(1), 0, 0];
            Pt(:, i) = [inputMt(2) 0 0];
        end
    else
        nfl = 2;
        Cfl = [0 0; 100 250; 100 -50];      
        Pfl = [200 -100; 0 0; 0 0];   
        nt = 2;
        Ct = [100 200; 0 0; 0 0];           
        Pt = [70 -50; 0 0; 0 0];
    end
end