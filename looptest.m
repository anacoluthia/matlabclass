x = [0:0.1:10];
yp = x.^3;
t = [3 5 8];
m = 3*(t.^2);
for r = 1:3
    yd(r) = (x-r)*m(r)+yp(r);
end
