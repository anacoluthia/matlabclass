% Part a:
t = 0:0.1:50;
y1 = .15*t + 2*exp(-.06*t).*sin(t);
y2 = 4 - .1*t + 2*exp(-.05*t).*cos(t);
figure(1); plot(y1,t,y2,t);
title('Figure 1');
xlabel('t');
ylabel('y(t)');
print -djpeg fig1.jpg; % Saves figure as a jpeg
% Part b: 
ts = 0:2*pi:50;
y1s = .15*ts + 2*exp(-.06*ts).*sin(ts);
y2s = 4 - .1*ts + 2*exp(-.05*ts).*cos(ts);
figure(2);
subplot(1,2,1)
    plot(y1,t,'k')
    hold on
    plot(y1s,ts,'r+')
    title('Figure 2a')
    hold off
subplot(1,2,2)
    plot(y2,t,'g')
    hold on
    plot(y2s,ts,'bs')
    title('Figure 2b')
    hold off
% Part c:
figure(3); plot(y1,t,'m',y2,t,'g');
hold on
    axis([-10 60 -5 10])
    b=-10:0.1:60; % Create vector spanning x-axis values
    z=ones(1,length(b)); % Create vector of 1's of the same length
    plot(b,z,'k') % Plot of b,z is a line @ y = 1
    text(-4,5,'y1')
    text(3,3,'y2')
% Part d:
y1min = sort(y1);
y2min = sort(y2);
fprintf('The minimum of y1 is %2.3f.\n',y1min(1))
fprintf('The minimum of y2 is %2.3f.\n',y2min(1))



    
    