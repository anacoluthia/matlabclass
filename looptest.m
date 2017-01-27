x = [0:0.1:10];
yp = x.^3;
<<<<<<< Updated upstream
t = [3 5 8 6 9];
m = gradient(yp,x);
plot(x,yp)
hold on 
for r = 1:length(t);
    ix = find(x==t(r),1);
    yd = (x-x(ix))*m(ix)+yp(ix);
    plot(x,yd); 
=======
t = [3 5 8 4 7];
m = 3*(t.^2);
figure(3); plot(x,yp,'b');
hold on
for r = 1:length(t)
    ix = find(x==t(r));
    yd = (x-t(r))*m(r)+yp(ix);
    fprintf('y = (x-%f)*%f+%f\n',t(r),m(r),yp(ix));
    plot(x,yd)
>>>>>>> Stashed changes
end
hold off