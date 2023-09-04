% Define the parameters
x0 = 0;        % Initial x value
y0 = 0.5;      % Initial y value
x_end = 1;     % End x value
h1 = 0.1;      % step size
h2 = 0.05;     % step size 2

% slope function 
f = @(x_i, y_i) y_i - x_i ;

% Forward Euler
forward_euler = @(x_i, y_i, h, f) y_i + h*(f(x_i, y_i)) ;


% Initialize arrays to store x and y values
x_values_h1 = x0:h1:x_end;
x_values_h2 = x0:h2:x_end;
y_values_h1 = zeros(size(x_values_h1));
y_values_h1(1) = y0;
y_values_h2 = zeros(size(x_values_h2));
y_values_h2(1) = y0;

% Implement Euler's method for h=0.1
h = 0.1 ;
for i = 1:(length(x_values_h1) - 1)
    x_i = x_values_h1(i);
    y_i = y_values_h1(i);
    
    % Update y using Euler's method
    y_new = forward_euler(x_i, y_i, h, f);
    
    % Store the new y value
    y_values_h1(i + 1) = y_new;
end

% Implement Euler's method for h=0.1
h = 0.05 ;
for i = 1:(length(x_values_h2) - 1)
    x_i = x_values_h2(i);
    y_i = y_values_h2(i);
    
    % Update y using Euler's method
    y_new = forward_euler(x_i, y_i, h, f);
    
    % Store the new y value
    y_values_h2(i + 1) = y_new;
end


% Generate a finer grid of x-values for the exact solution
x_values_exact = x0:0.01:x_end;

% Calculate the exact solution on the finer grid
exact_solution = x_values_exact + 1 - 0.5 * exp(x_values_exact);

y_n_exact = exact_solution(end)

y_1_h1 = y_values_h1(end)

y_1_h2 = y_values_h2(end)

% Plot the results
figure;
plot(x_values_h1, y_values_h1, 'b.') ;
hold on;
plot(x_values_h2, y_values_h2, 'g.') ;
hold on;
plot(x_values_exact, exact_solution), legend('euler at h=0.1', 'euler at h=0.05', 'Exact') ;
xlabel('x');
ylabel('y');
title('Euler Method vs Exact Solution');
legend('Location', 'Northwest');
grid on;

