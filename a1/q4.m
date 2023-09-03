% Define the parameters
x0 = 0;        % Initial x value
y0 = 0.5;      % Initial y value
x_end = 1;     % End x value
h_ar = [0.1, 0.05, 0.025, 0.0125]       % Step size

%derivative function
f = @(x, y) y - x;

% Initialize arrays to store x and y values
%x_values = x0:h:x_end;
%y_values = zeros(size(x_values));
% y_values(1) = y0;

% Forward Euler
forward_euler = @(x_i, y_i, h, f) y_i + h*(f(x_i, y_i)) ;

% Backward Euler particular to this IVP
back_euler = @(x_i, y_i, h) (y_i - h * (x_i + h) )/(1 - h);

% RK2 
rk2 = @(x_i, y_i, h, f) y_i + h * f(x_i + h / 2, y_i + h / 2 * f(x_i, y_i));

% RK3 
rk3 = @(x_i, y_i, h, f) y_i + h / 6 * (f(x_i, y_i) + 4 * f(x_i + h / 2, y_i + h / 2 * f(x_i, y_i)) + f(x_i + h, y_i - h * f(x_i, y_i) + 2 * h * f(x_i + h / 2, y_i + h / 2 * f(x_i, y_i))) );

% RK4 
k1 = f ;
k2 = @(x_i, y_i, h, f) f(x_i + h/2, y_i + h/2 * k1(x_i, y_i)) ;
k3 = @(x_i, y_i, h, f) f(x_i + h/2, y_i + h/2 * k2(x_i, y_i, h, f)) ;
k4 = @(x_i, y_i, h, f) f(x_i + h/2, y_i + h * k3(x_i, y_i, h, f)) ;
rk4 = @(x_i, y_i, h, f) y_i + h/6 * (k1(x_i, y_i) + 2 * k2(x_i, y_i, h, f) + 2 * k3(x_i, y_i, h, f) + k4(x_i, y_i, h, f)) ;


y_exact_at_1 = 1 + 1 - 0.5 * exp(1) ;
y_rk2_at_1 = 1:4 ; 
y_rk3_at_1 = 1:4 ;
y_rk4_at_1 = 1:4 ; 
y_fe_at_1 = 1:4 ;
y_be_at_1 = 1:4 ;

for j = 1:4

    h = h_ar(j);
    x_values = x0:h:x_end;
    y_values = zeros(size(x_values));
    y_values(1) = y0;

    % Implement Forward Euler method
    for i = 1:(length(x_values) - 1)
        x_i = x_values(i);
        y_i = y_values(i);
           
        % Update y using RK4 method
        y_new = forward_euler(x_i, y_i, h, f);
        
        % Store the new y value
        y_values(i + 1) = y_new;
    end
    
    y_fe_at_1(j) = y_values(end) ;

    
    %Implement Backward Euler method
    for i = 1:(length(x_values) - 1)
        x_i = x_values(i);
        y_i = y_values(i);
           
        % Update y using RK4 method
        y_new = back_euler(x_i, y_i, h);
        
        % Store the new y value
        y_values(i + 1) = y_new;
    end
    
    y_be_at_1(j) = y_values(end) ;


    % Implement RK2 method
    for i = 1:(length(x_values) - 1)
        x_i = x_values(i);
        y_i = y_values(i);
           
        % Update y using RK2 method
        y_new = rk2(x_i, y_i, h, f);
        
        % Store the new y value
        y_values(i + 1) = y_new;
    end
    
    y_rk2_at_1(j) = y_values(end) ;
    
    
    % Implement RK3 method
    for i = 1:(length(x_values) - 1)
        x_i = x_values(i);
        y_i = y_values(i);
           
        % Update y using RK3 method
        y_new = rk3(x_i, y_i, h, f);
        
        % Store the new y value
        y_values(i + 1) = y_new;
    end
    
    y_rk3_at_1(j) = y_values(end) ;
    
    
    % Implement RK4 method
    for i = 1:(length(x_values) - 1)
        x_i = x_values(i);
        y_i = y_values(i);
           
        % Update y using RK4 method
        y_new = rk4(x_i, y_i, h, f);
        
        % Store the new y value
        y_values(i + 1) = y_new;
    end
    
    y_rk4_at_1(j) = y_values(end) ;
    

end
    


y_exact_at_1
y_fe_at_1
y_be_at_1
y_rk2_at_1
y_rk3_at_1
y_rk4_at_1
