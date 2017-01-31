% Given: 
x = [0:0.1:10];
yp = x.^3;
ym = x.^(-3);

% Part 1: 
figure(1); 
% subplot(1,3,1) % Is there a way to control the size of the plot window
% that appears? --No. 
% Furthermore, is there a way to control where the figures appear, i.e. not
% on top of each other? -- apparently *set* does a lot of this, to be
% covered at a later date
plot(x,yp,'g',x,ym,'m');
ylim([-100 1000]);
title('Plot 1');
xlabel('x');
ylabel('y(x)');
% The grid for the text command does not seem to match that of the plot -
% hence having to offset it. Is this true, and why? -- Whitespace & size of
% text need to be accounted for; *fontsize* can change text size, but then
% offsets need to be altered as well.
text(0.95,1,'X','fontsize', 12);
% Can this text be placed at an angle? -- Yes, need to look up the command
% - 'rotation'
text(1,25,'Intersection', 'rotation', 35); 
% Further note, plots appear differently on different screens.  On my laptop,
% the X & 'Intersection' appeared very small, so I increased the text size.
% On my desktop, 14 seems too big so I have reverted to default.

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
% ylim([-500 1000]) % with the more flexible loop, don't want to set axis
% limits or colors for scalability
hold on 
% ways to do this... the below requires knowing the position of the desired
% x-value within each variable. What I'd like to do is a loop that would
% loop through and calculate the line for x = 3, x = 5, & x = 8 using m =
% 3*x(or t).^2  instead of 'gradient' Need a new variable? => t = 3, 5, 8
% then yd3 = (x-t(1))*m(t) + yp(t)??
t = [3 5 8];
% Using gradient, rather than just the symbolic derivative (3x^2), the
% function is flexible and will still work when yp is changed
m = gradient(yp,x);

hold on 
% More of a fundamental question about loops - Why are the dummy variables
% needed? Why does it not work to say "for each value of t, do this..."

for r = 1:length(t); % -- Serves as a counter i.e how many times to run
    % the loop
    ix = find(x==t(r),1); % finds the indices of the specified entries, 
    % i.e. x(31), and tells it the max values to return, i.e. 1.
    yd = (x-x(ix))*m(ix)+yp(ix);
    plot(x,yd); 
end
hold off
% ===============================
% older version of solution: 
% yd3 = (x-x(31))*yd(31)+yp(31);
% yd5 = (x-x(51))*yd(51)+yp(51);
% yd8 = (x-x(81))*yd(81)+yp(81);
% plot(x,yd3,'m',x,yd5,'g',x,yd8,'c')
% ===============================

text(4.7,-125,'@ x = 8, slope is 192') 
% Note: gtext brings up crosshairs and allows you to click wherever you
% want the text to appear on the plot
text(6.5,100,'@ x = 3, slope is 27')
text(7.3,300,'@ x = 5, slope is 75')
hold off
% Could also automate the text content and placement within the loop - but
% not today.

