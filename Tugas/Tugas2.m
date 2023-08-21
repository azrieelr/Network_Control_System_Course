clc; clear; clf

% Plant transfer function
H = tf([2],[1 1],'InputDelay',10);
J = tf([2],[1 1]);

% Step function as set point
SP = 1;

% PI controller
Kp = 1.2;
Ki = 2.0;
C = tf([Kp Ki],[1 0]);

% Open-loop transfer function
G = series(C,H);
G2 = series(C,J);

% Closed-loop system
sys = feedback(G,1);
sys2 = feedback(G2,1);

% Step response of the closed-loop system
t = 0:0.01:50;
[y,t] = step(SP*sys,t);
[y2,t] = step(SP*sys2,t);

% Plot the step response
figure(1)
plot(t,y2);
hold on
plot(t,y);
legend('Without Delay','With Delay')
xlabel('Time (s)');
ylabel('Output');
title('Step Response of Closed-Loop System');

figure(2)
bode(sys)
figure(3)
bode(sys2)