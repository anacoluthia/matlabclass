x = [0:0.1:10];
yp = x.^3;
ym = x.^(-3);

% Part 1: 
figure(1); 
% subplot(1,3,1) % Is there a way to control the size of the plot window
% that appears?
plot(x,yp,'g',x,ym,'m');
ylim([-100 1000]);
title('Plot 1');
xlabel('x');
ylabel('y(x)');
% The grid for the text command does not seem to match that of the plot -
% hence having to offset it. Is this true, and why?
text(0.95,1,'X');
text(0.95,-50,'Intersection');

% Part 2:
figure(2); 
%subplot(1,3,2)
semilogy(x,yp,'r',x,ym,'b');
title('Plot 2');
xlabel('x');
ylabel('log y(x)');
text(0.8,1.05,'"X" still marks the spot'); 

% Part 3:
figure(3); 
%subplot(1,3,3)
plot(x,yp)
title('Plot 3');
xlabel('x');
ylabel('y(x)');
%ylim([-500 1000])
hold on 
% ways to do this... the below requires knowing the position of the desired
% x-value within each variable
% What I'd like to do is a loop that would loop through and calculate the
% line for x = 3, x = 5, & x = 8 using m = 3*x(or t).^2  instead of 'gradient'
% Need a new variable? => t = 3, 5, 8 then yd3 = (x-t(1))*m(t) + yp(t)??
t = [3 5 8];
% Using grasdient, rather than just the symbolic derivative (3x^2) the
% function is flexible and will still work when yp is changed
m = gradient(yp,x);

hold on 
for r = 1:length(t);
    ix = find(x==t(r),1);
    yd = (x-x(ix))*m(ix)+yp(ix);
    plot(x,yd); 
end
hold off
% yd3 = (x-x(31))*yd(31)+yp(31);
% yd5 = (x-x(51))*yd(51)+yp(51);
% yd8 = (x-x(81))*yd(81)+yp(81);
% plot(x,yd3,'m',x,yd5,'g',x,yd8,'c')
text(4.7,-125,'@ x = 8, slope is 192')
text(6.5,100,'@ x = 3, slope is 27')
text(7.3,300,'@ x = 5, slope is 75')
hold off


