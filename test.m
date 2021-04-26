s = tf('s');
sys = 1/(s^2 +20*s + 100);

Ku = 1000000;
Tu = 0.006;

Kp = 0.6*Ku;
Ti = Tu/2; Ki = Kp/Ti;
Td = Tu/8; Kd = Kp*Td;

cont = pid(Kp, Ki, Kd);
step(feedback(cont*sys, 1));
