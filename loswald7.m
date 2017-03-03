% Given:
data = load('E7.dat');
t = data(:,1);
ob1 = data(:,2);
ob2 = data(:,3);
ob3 = data(:,4);

% Part 1:

M = [ob1 ob2 ob3];  %  combine data into a matrix
cxy=corr(M);  % cxy is a 3x3 matrix
figure(1);
plot(t, ob1, t, ob2, t, ob3);
hold on 
legend('Obs 1', 'Obs 2', 'Obs 3');
text(275,12, 'Col 1 to col 2 corr = -0.476');
text(275,11, 'Col 1 to col 3 corr = -0.724');
text(275,10, 'Col 2 to col 3 corr = -0.172');
hold off

% Part 2: 

% dt is the time interval of the data (assumed to be constant)
dt = t(2)-t(1);  % dt = 1, not needed in this case.
Am = mean(ob1);
Bm = mean(ob2);
N = length(ob1);
As = std(ob1); 
Bs = std(ob2); 
Aa = (ob1-Am)/As; 
Ba = (ob2-Bm)/Bs; %  anomaly from mean and normalize to std
maxlag=round(N/2); % largest shift is by half the record length
[cAB lag]=xcorr(Aa,Ba,maxlag,'unbiased');
maxL = find(cAB == max(cAB));
maxLd = lag(maxL);
figure(2)
subplot(2, 1, 1)
plot(t, ob1, t, ob2);
hold on
title('E7 data 1&2');
xlabel('Time, days');
ylabel('Units not specified')
legend('Col 2 data', 'Col 3 data');
hold off
subplot(2,1,2)
plot(lag*dt,cAB)
hold on
title('Lagged correlation');
xlabel('lag (time units)');
text(25,0.5, 'Lag is -139 days');
hold off

% Part 3: 

% Use a cell array to hold the time vector and three observations in the
% data file. Write a routine, using for loops, to calculate the lagged
% correlation between all pairs of observations. Plot the three sets of
% lagged correlation on three different panels of a 4 panel plot. Plot the
% original data in the 4th panel.

p3 = cell(4,1);
p3{1} = ob1;
p3{2} = ob2;
p3{3} = ob3;
p3{4} = t;
k=1; 
figure(3);

for i = 1:3;
    for j = i+1:3; % 2nd loop makes sure we don't look at duplicate correlations
        Am = mean(p3{i});
        Bm = mean(p3{j});
        N = length(p3{i});
        As = std(p3{i});
        Bs = std(p3{j});
        Aa = (p3{i}-Am)/As;
        Ba = (p3{j}-Bm)/Bs; 
        maxlag = round(N/2);
        [cAB lag]=xcorr(Aa,Ba,maxlag,'unbiased');
        maxL = find(cAB == max(cAB));
        maxLd(k) = lag(maxL);
        subplot(4,1,k);
        plot(lag, cAB);
        hold on 
        legend(strcat('Lag',{' '},num2str([i,j],' Obs %d')), 'Location', 'BestOutside');
        % In this case, setting legend outside of the plot was the only way
        % to avoid it sitting over data
        k = k+1;
       
    end
end

subplot(4,1,4)
plot(t,ob1, t, ob2, t, ob3);
xlim([0 370]); 
title('Original data');
xlabel('Days');
hold off
disp(['Lag for corr 1 is ', num2str(maxLd(1, 1)]);
