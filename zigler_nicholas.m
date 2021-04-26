%% Setup the transfer function
s = tf('s');
sys = 1/(s^2 +20*s + 100);
%% Evaluate the step response of system
figure
step(sys);

%% From the step response, find the values of K, L, T
K = 0.01;
L = 0.03;
T = 0.4 - L;

%% Calculate the values of a, Ti, Td
a = K*L/T;
Ti = 2*L;
Td = L/2;

%% Compute the Kp, Ki, Kd
Kp = 1.2/a;
Ki = Kp/Ti;
Kd = Kp*Td;

%% Step response of PID controller
cont = pid(Kp, Ki, Kd);

figure
step(feedback(cont*sys, 1));