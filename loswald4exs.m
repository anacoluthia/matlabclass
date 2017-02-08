% Given:
data = load('NorfolkMeanTemp2005.dat');
year = data(:,1);
month = data(:,2);
time = year + month/12;
temp = data(:,3);
meantemp = sum(temp)/length(temp);
anomaly = temp - meantemp;
ix = find(month == 2);
ig = find(month == 8);
Feb = temp(ix);
FebAvg = sum(Feb)/length(Feb);
Aug = temp(ig);
AugAvg = sum(Aug)/length(Aug);
timeF = time(ix);
timeA = time(ig);
zF = ones(1,length(Feb));
zA = ones(1,length(Aug));
avgF = zF*FebAvg;
avgA = zA*AugAvg;
plot(timeF, Feb, timeA, Aug);
hold on 
plot(timeF, avgF, timeA, avgA);
xlabel('Month');
ylabel('Temp, degrees F')
hold off

% ============= Part 4.1 ======
% plot(time, temp, 'r');
% hold on 
% z = ones(1,length(month));
% avg = z*meantemp;
% plot(time, avg);
% xlabel('Month');
% ylabel('Temp, degrees F')
% hold off
% save('Eval4');