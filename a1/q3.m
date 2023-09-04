% Defining the parameters
x0 = 0;        % Initial x value
y0 = 0.5;      % Initial y value
x_end = 1;     % End x value
h = 0.1;       % Step size

%derivative function
f = @(x, y) y - x;

% Initialize arrays to store x and y values
x_values = x0:h:x_end;
y_values = zeros(size(x_values));
y_values(1) = y0;



% RK2 (Midpoint Method or Heun's Method)
rk2 = @(x_i, y_i, h, f) y_i + h * f(x_i + h / 2, y_i + h / 2 * f(x_i, y_i));

% RK3 (Third-Order Heun Method)
rk3 = @(x_i, y_i, h, f) y_i + h / 6 * (f(x_i, y_i) + 4 * f(x_i + h / 2, y_i + h / 2 * f(x_i, y_i)) + f(x_i + h, y_i - h * f(x_i, y_i) + 2 * h * f(x_i + h / 2, y_i + h / 2 * f(x_i, y_i))) );

% RK4 (Classical Fourth-Order Method)
k1 = f ;
k2 = @(x_i, y_i, h, f) f(x_i + h/2, y_i + h/2 * k1(x_i, y_i)) ;
k3 = @(x_i, y_i, h, f) f(x_i + h/2, y_i + h/2 * k2(x_i, y_i, h, f)) ;
k4 = @(x_i, y_i, h, f) f(x_i + h/2, y_i + h * k3(x_i, y_i, h, f)) ;
rk4 = @(x_i, y_i, h, f) y_i + h/6 * (k1(x_i, y_i) + 2 * k2(x_i, y_i, h, f) + 2 * k3(x_i, y_i, h, f) + k4(x_i, y_i, h, f)) ;


y_exact_at_1 = 1 + 1 - 0.5 * exp(1)

% Implement RK2 method
for i = 1:(length(x_values) - 1)
    x_i = x_values(i);
    y_i = y_values(i);
       
    % Update y using RK2 method
    y_new = rk2(x_i, y_i, h, f);
    
    % Store the new y value
    y_values(i + 1) = y_new;
end

y_rk2_at_1 = y_values(end)


% Implement RK3 method
for i = 1:(length(x_values) - 1)
    x_i = x_values(i);
    y_i = y_values(i);
       
    % Update y using RK3 method
    y_new = rk3(x_i, y_i, h, f);
    
    % Store the new y value
    y_values(i + 1) = y_new;
end

y_rk3_at_1 = y_values(end)


% Implement RK4 method
for i = 1:(length(x_values) - 1)
    x_i = x_values(i);
    y_i = y_values(i);
       
    % Update y using RK4 method
    y_new = rk4(x_i, y_i, h, f);
    
    % Store the new y value
    y_values(i + 1) = y_new;
end

y_rk4_at_1 = y_values(end)

