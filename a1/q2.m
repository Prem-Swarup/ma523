% Define the parameters
h = 0.1;       % Step size
x0 = 0;        % Initial x value
y0 = 0.5;      % Initial y value
x_end = 1;     % End x value

% Initialize arrays to store x and y values
x_values_euler = x0:h:x_end;
y_values_euler = zeros(size(x_values_euler));
y_values_euler(1) = y0;

y_exact_at_1 = 1 + 1 - 0.5 * exp(1) 


% Implement Modified Euler's method
for i = 1:(length(x_values_euler) - 1)
    x_i = x_values_euler(i);
    y_i = y_values_euler(i);
    
    % Calculate the slope using the given differential equation
    slope = y_i - x_i;
    
    % Update y using Euler's method
    y_new = (y_i + (h/2) * slope - (h/2)*(x_i+h))/(1-h/2);
    
    % Store the new y value
    y_values_euler(i + 1) = y_new;
end

y_modified_euler_at_1 = y_values_euler(end)


% slope function 
f = @(x_i, y_i) y_i - x_i ;

% Forward Euler
forward_euler = @(x_i, y_i, h, f) y_i + h*(f(x_i, y_i)) ;

% Backward Euler particular to this IVP
back_euler = @(x_i, y_i, h) (y_i - h * (x_i + h) )/(1 - h);


% Implement Forward Euler's method
for i = 1:(length(x_values_euler) - 1)
    x_i = x_values_euler(i);
    y_i = y_values_euler(i);
    
    % Update y using Euler's method
    y_new = forward_euler(x_i, y_i, h, f) ;
    
    % Store the new y value
    y_values_euler(i + 1) = y_new;
end

y_fe_at_1 = y_values_euler(end)


% Implement Backward Euler's method
for i = 1:(length(x_values_euler) - 1)
    x_i = x_values_euler(i);
    y_i = y_values_euler(i);
    
    % Update y using Euler's method
    y_new = back_euler(x_i, y_i, h) ;
    
    % Store the new y value
    y_values_euler(i + 1) = y_new;
end

y_be_at_1 = y_values_euler(end)

