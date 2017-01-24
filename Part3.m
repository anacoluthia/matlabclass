x = [0:0.1:10];
yp = x.^3;

% Ask about how diff & gradient functions work - why does diff return one less value?
figure(3); plot(x,yp,'b');

plot(x,yp,'b');
yd = gradient(yp,x);
title('Plot 3');
xlabel('x');
ylabel('y(x)');
ylim([-500 1000])
hold on 
% ways to do this... the below requires knowing the position of the desired
% x-value within each variable
% What I'd like to do is a loop that would loop through and calculate the
% line for x = 3, x = 5, & x = 8 using m = 3*x(or t).^2  instead of 'gradient'
% Need a new variable? => t = 3, 5, 8 then yd3 = (x-t(1))*m(t) + yp(t)??
t = [3 5 8];
m = 3*t.^2;
for r = 1:3
    yd(r) = (x-t)*m(t)+yp(t);
end
yd3 = (x-x(31))*yd(31)+yp(31);
yd5 = (x-x(51))*yd(51)+yp(51);
yd8 = (x-x(81))*yd(81)+yp(81);
plot(x,yd3,'m',x,yd5,'g',x,yd8,'c')
hold off

