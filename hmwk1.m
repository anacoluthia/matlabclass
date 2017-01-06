% Part a:
x = 0:0.5:100;
y=exp(-.01*x).*x.^2;
figure(1); plot(x,y); % Use of figure command puts plot in separate window
% Part b:
title('Figure(1)'); % Title, xlabel, & ylabel apply to current plot
xlabel('x');
ylabel('y(x)');
% Part c:
yp = y + 0.01;
figure(2); semilogy(x,yp);
title('Figure(2)');
xlabel('x');
ylabel('log y(x)');
% Part d:
figure(3);loglog(x,yp);
title('Figure(3)');
xlabel('log x');
ylabel('log y(x)');

