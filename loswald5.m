% Given:
data = load('NorfolkMeanTemp.dat');
year = data(:,1);
month = data(:,2);
time = year + month/12;
temp = data(:,3);

% Part 1: 
m = [1 3 6 9];
for r = 1:length(m);
    TA = temp(find(month == m(r)));
    monMean(r) = mean(TA);
    monStd(r) = std(TA);
end
figure(1);
errorbar(m,monMean,monStd,'*', 'MarkerSize', 12);
ylabel('Temperature, °F');
xlabel('Month');
title('Norfolk mean temps w/deviation');

% Part 2: 
% Failed attempt to use a loop - Why wouldn't this work?
% m = [1 6];
% for r = 1,length(m);
%     mon = find(month == m(r));
%     anomaly = temp(mon)- mean(temp(mon)); % diff btwn that yr & all yrs
%     mon_anom(m) = mean(abs(anomaly)); % monthly mean abs diff
% end 

Jan = find(month == 1);
Jun = find(month == 6);
JanAnom = temp(Jan) - mean(temp(Jan));
JunAnom = temp(Jun) - mean(temp(Jun));
time1 = time(Jan);
time6 = time(Jun);
JanFit = polyfit(time1,JanAnom,1);
JunFit = polyfit(time6,JunAnom,1);
JanVal = polyval(JanFit,time6);
JunVal = polyval(JunFit,time6);
J = polyval(JanFit,time1);
figure(2);
plot(time1,JanVal, 'b', time6, JunVal, 'r');
hold on 
plot(time1, JanAnom,'c', time6, JunAnom, 'm');
ylabel('Temp anomaly, °F');
xlabel('Time');
title('Climate change is more complicated than a single dataset in Norfolk, VA');
legend('Jan trend', 'Jun trend')
text(1960,10,'Jan gets colder -','fontsize',12);
text(1985, -7, '- Jun gets warmer','fontsize',12);
hold off

% Fit annual cycles to the Norfolk mean temperature. Plot the original data
% and the seasonal pattern. Compare the annual seasonal cycle to the means
% of the individual months.

% Part 3: 
% Reused code from Eval 4 to plot mean vs month
 for i = 1:12;
     m = find(month == i);
     meantemp(i) = mean(temp(m)); % meantemp is monthly average across 
     % all years
 end
mon = 1:12;
figure(3);
plot(mon, meantemp);
hold on
xlim([0.5 12.5]);

T = 1;
R = [ones(size(time)) cos(2*pi*time/T) sin(2*pi*time/T)];

CF = R\temp;
% a=CF(1);
% b=CF(2);
% c=CF(3);
xf=R*CF;   % reconstruct the fitted function
e=temp-xf;    % error of the fit
varExp = (var(temp) - var(e))/var(temp); % fraction variance explained
  
% R = [ones(size(time)) time.^1  time.^2];
% p2=R\temp;  %  calculates a quadratic polynomial fit

plot(mon, xf(1:12));
ylabel('Temp, °F');
xlabel('Month');
title('Monthly average vs fit over 65 yrs at ORF');
legend('Monthly average', 'Trigonometric fit', 'Location', 'NorthWest');
hold off
