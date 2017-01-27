x = [0:0.1:10];
yp = sin(1./x);
t = [3 5 8 4 7];
%m = 3*(t.^2);
m = gradient(yp,x);
figure(3); plot(x,yp,'b');
hold on
for r = 1:length(t)
    ix = find(x==t(r));
    yd = (x-t(r))*m(ix)+yp(ix);
    fprintf('y = (x-%f)*%f+%f\n',t(r),m(ix),yp(ix));
    plot(x,yd)
end
text(4.7,-125,'@ x = 8, slope is 192')
text(6.5,100,'@ x = 3, slope is 27')
text(7.3,300,'@ x = 5, slope is 75')
hold off