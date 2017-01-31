% Given:
data = load('NorfolkMeanTemp2005.dat');
year = data(:,1);
month = data(:,2);
temp = data(:,3);
meantemp = sum(temp)/length(temp);
anomaly = temp - meantemp;
save('Eval4');