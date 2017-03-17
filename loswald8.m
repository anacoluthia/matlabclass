% Given:
data = load('E7.dat');
t = data(:,1);
ob1 = data(:,2);
ob2 = data(:,3);
ob3 = data(:,4);

% Part 1:

c = cell(3,1);
c{1} = 'time, days';
c{2} = 'Unspecified units';
c{3} = 'Another dumb plot';

plotty(t,ob1,c);

% Part 2:  

meany(ob3, t);

% Part 3: 

% Write a script to calculate the solution to the logistic ODE. dP/dt =
% g*(1 -P/K)*P for g=0.2 and K=10. Let time (years) run from 0 to 10. The
% initial population is 2. Plot the solution. Estimate the time that it
% takes for the solution to come to a steady state.

global g K;
g = 0.2;
K = 10;

tspan = [0 60]; % time span for the solution.
Po = 2; % Initial population

[t P] = ode45(@growy, tspan, Po);   % solve the equation

q = K-P;
r = find(q < 0.1, 1);
s = find(q < 0.001, 1);
u = P(r);
v = P(s);
w = t(r);
z = t(s);

figure(3);
plot(t,P,'r');
hold on
ylim([1.9 10.1]);
xlabel('t, years');
ylabel('Population');
title('Logistic ODE Solution');
plot(w,u,'ko');
plot(z, v,'bo');
legend('dP/dT', 'Getting close, 31.25 yrs', 'Closer still, 53.75 yrs')
hold off

