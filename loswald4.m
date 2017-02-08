% Given:
data = load('NorfolkMeanTemp.dat');
year = data(:,1);
month = data(:,2);
time = year + month/12;
temp = data(:,3);
% Part 1:  
ix = find(month == 2);
ig = find(month == 8);
Feb = temp(ix);
FebAvg = mean(Feb);
Aug = temp(ig);
AugAvg = mean(Aug);
timeF = time(ix);
timeA = time(ig);
zF = ones(1,length(Feb));
zA = ones(1,length(Aug));
avgF = zF*FebAvg;
avgA = zA*AugAvg;
Diff = AugAvg - FebAvg;
% zd = ones(1,length(time));
% zd1 = zd * Diff;
figure(1);
plot(timeF, Feb, timeA, Aug);
hold on 
plot(timeF, avgF, timeA, avgA);
% plot(time, zd1);
xlabel('Month');
ylabel('Temp,°F') % alt+248 inserts degree symbol
title('February & August');
% It was STUPIDLY hard to figure out how to parse this - I still don't
% understand what %s does, or why the examples had %s followed by %d;
% changing %s to %d in the below causes the text to repeat
Diffstr = sprintf('*Avg difference btwn Feb & Aug is %s °F', num2str(Diff,'%2.2f'));
text(1945, 63, Diffstr);
legend('February', 'August', 'Location', 'Best');
hold off

% Part 2:  
 for i = 1:12;
     m = find(month == i);
     meantemp(i) = mean(temp(m)); % meantemp is monthly average across 
     % all years
 end
mon = 1:12;
figure(2);
plot(mon, meantemp);
hold on
xlim([0.5 12.5]);
xlabel('Month'); % Any easy way to convert to Jan, Feb, ... ?
ylabel('Temp, °F')
title('Monthly Average Temp, 1946 - 2010');
maxT = max(meantemp);
minT = min(meantemp);
maxTT = find(meantemp == maxT);
minTT = find(meantemp == minT);
plot(maxTT, maxT, 'r*','MarkerSize',13);
plot(minTT, minT, 'b*','MarkerSize',13);
legend('Average','Warmest, July','Coldest, January', 'Location', 'NorthWest')
hold off

% Part 3:
for i = 1:12;
    m = find(month == i);
    anomaly = temp(m)- meantemp(i); % diff btwn that yr & all yrs
    mon_anom(i) = mean(abs(anomaly)); % monthly mean abs diff
end 
figure(3);
plot(mon, mon_anom);
hold on 
xlabel('Month');
ylabel('Mean Monthly Absolute Temp Anomaly, °F');
title('Norfolk Mean Absolute Monthly Anomaly over 65 Years');
maxAnom = max(mon_anom);
minAnom = min(mon_anom);
maxAT = find(mon_anom == maxAnom);
minAT = find(mon_anom == minAnom);
plot(maxAT, maxAnom, 'r*','MarkerSize',13);
plot(minAT, minAnom, 'b*','MarkerSize',13);
legend('Abs Anomaly','Most variability','Least variability')
hold off
 