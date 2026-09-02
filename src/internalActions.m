function [W_F W_M S] = internalActions(Loads)
    [m n] = size(Loads);
    j=1;
    i = 1;
    while i<=n
    
        while (i <= n-1  && Loads(4,i+1) == Loads(4,i))
            i = i+1; % move along x until I find a discontinuity
        end
    
        S(j)=Loads(4,i); 
        W_F(1:3,j) = [0,0,0]'; % resultant force
        W_M(1:3,j) = [0,0,0]'; % resultant moments
    
        for k = 1:i % calculation of resultants upstream of the discontinuity
            W_F(1:3,j) = W_F(1:3,j) - Loads(1:3,k);
            W_M(1:3,j) = W_M(1:3,j) - cross(Loads(4:6,k)-[S(j);0;0],Loads(1:3,k)) - Loads(7:9,k);
        end
    
    
        if i<n %if the end of the beam has not yet been reached, then I calculate the resultants after the discontinuity in the same way
            j = j+1;
            S(j)=Loads(4,i+1);
            W_F(1:3,j) = [0,0,0]'; 
            W_M(1:3,j) = [0,0,0]'; 
    
            for k = 1:i
                W_F(1:3,j) = W_F(1:3,j) - Loads(1:3,k);
                W_M(1:3,j) = W_M(1:3,j) - cross(Loads(4:6,k)-[S(j);0;0],Loads(1:3,k)) - Loads(7:9,k);
            end        
        end
    
        i = i+1;
        j = j+1;
    end
end