x = [0:0.1:10];
yp = x.^3;
t = [3 5 8 6 9];
m = gradient(yp,x);
plot(x,yp)
hold on 
for r = 1:length(t);
    ix = find(x==t(r),1);
    yd = (x-x(ix))*m(ix)+yp(ix);
    plot(x,yd); 
end
hold off