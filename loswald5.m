% Given:
data = load('NorfolkMeanTemp.dat');
year = data(:,1);
month = data(:,2);
time = year + month/12;
temp = data(:,3);

% % Part 1: 
% m = [1 3 6 9];
% for r = 1:length(m);
%     TA = temp(find(month == m(r)));
%     monMean(r) = mean(TA);
%     monStd(r) = std(TA);
% end
% figure(1);
% errorbar(m,monMean,monStd,'*', 'MarkerSize', 12);
% ylabel('Temperature, °F');
% xlabel('Month');
% title('Norfolk mean temps w/deviation');
% 
% % Part 2: 
% % m = [1 6];
% % for r = 1,length(m);
% %     mon = find(month == m(r));
% %     anomaly = temp(mon)- mean(temp(mon)); % diff btwn that yr & all yrs
% %     mon_anom(m) = mean(abs(anomaly)); % monthly mean abs diff
% % end 
% % figure(2);
% 
% Jan = find(month == 1);
% Jun = find(month == 6);
% JanAnom = temp(Jan) - mean(temp(Jan));
% JunAnom = temp(Jun) - mean(temp(Jun));
% time1 = time(Jan);
% time6 = time(Jun);
% JanFit = polyfit(time1,JanAnom,1);
% JunFit = polyfit(time6,JunAnom,1);
% JanVal = polyval(JanFit,time6);
% JunVal = polyval(JunFit,time6);
% J = polyval(JanFit,time1);
% figure(2);
% plot(time1,JanVal, 'b', time6, JunVal, 'r');
% hold on 
% plot(time1, JanAnom,'c', time6, JunAnom, 'm');
% ylabel('Temp anomaly, °F');
% xlabel('Time');
% title('Climate change is more complicated than a single dataset in Norfolk, VA');
% text(1960,10,'Jan gets colder -','fontsize',12);
% text(1985, -7, 'Jun gets warmer','fontsize',12);
% hold off

% Fit annual cycles to the Norfolk mean temperature. Plot the original data
% and the seasonal pattern. Compare the annual seasonal cycle to the means
% of the individual months.

% Part 3: 
figure(3);
plot(time, temp);

T = 12;
t = 1:12;
R = [ ones(size(t)) cos(2*pi*t/T) sin(2*pi*t/T)];

CF = R\x;
a=CF(1);
b=CF(2);
c=CF(3);
xf=R*CF;   % reconstruct the fitted function
e=x-xf;    % error of the fit
  
R = [ones(size(t)) t.^1  t.^2];
p2=R\x;  %  calculates a quadratic polynomial fit

