% Given:
data = load('data6.dat');
data2 = data;
t = 1:length(data);

for i = 1:length(data2);
    if data2(i) == -99;
        data2(i) = NaN;
    end 
end
figure(1);
plot(t, data,'b', t, data2, 'r')
legend('Original', 'w/NaNs');
xlim([0 105]);
xlabel('Index');
ylabel('Data Values')
title('Part 1: Iffy Exercises');

% The more efficient way, for reference: 
% data(data == -99) = NaN;

% Part 2 : 

data3 = data;
for i = 1:length(data3);
    if data3(i) == -99;
        data3(i) = (data3(i-1) + data3(i+1))/2;
    end 
end
figure(2);
plot(t, data, 'b', t, data3, 'm');
legend('Original', 'w/Averaging');
xlim([0 105]);
xlabel('Index');
ylabel('Data Values')
title('Part 2:');

% Part 3:  

% Find a root (value of x for which f(x)=0) of f(x) = a x^3 + b x^2 + c x +
% d using Newton's interation: xnew = x - f(x)/f'(x). Then x=xnew. Start
% with x=0 and iterate until f(xnew) < 1.d-4. Use values
% [a,b,c,d]=[0.01,0.1,1,-2]. Plot the polynomial vs x in the range [-10
% 10]. Mark the zero point.

x = 0;
a = 0.01;
b = 0.1;
c = 1;
d = -2;
f = a*x^3 + b*x^2 + c*x + d;

while (abs(f) > 0.0001);
    f = a*x.^3 + b*x.^2 + c*x + d;
    df = 0.03*x^2 + 0.2*x^2 + 1;
    %df = gradient(f);
    xnew = x - f/df;
    x = xnew;
end
x1 = [-10:0.1:10];
f = a*x1.^3 + b*x1.^2 + c*x1 + d;
figure(3);
plot(x1,f);
hold on
scatter(xnew,0);
xlabel('x');
ylabel('f(x)');
title('Part 3: Newton''s interation');
hold off



