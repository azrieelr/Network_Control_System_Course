clc; clear; 

% System parameters
lambda = 2; % Must be greater than 1
T = 100; % Simulation time steps
K = 1; % Control gain

% Quantization parameters
delta = 0.5; % Quantization step size

% Initialize variables
x = zeros(T, 1);
u = zeros(T, 1);
y = zeros(T, 1);
v = randn(T, 1); % Measurement noise v
w = randn(T, 1); % Measurement noise w

% Main loop
for k = 1:T-1
    % Quantize the state
    xq = round(x(k)/delta)*delta;

    % Compute the control signal
    u(k) = -K * xq;

    % Update the state
    x(k+1) = lambda * x(k) + u(k) + v(k);

    % Output
    y(k) = x(k) + w(k);
end

% Plot results
figure;
subplot(2,1,1);
plot(1:T, x, 'r', 'LineWidth', 1.5); hold on;
plot(1:T, u, 'b', 'LineWidth', 1.5); hold off;
xlabel('Time Step'); ylabel('State and Control');
legend('x', 'u');

subplot(2,1,2);
plot(1:T, y, 'k', 'LineWidth', 1.5);
xlabel('Time Step'); ylabel('Output');
legend('y');
