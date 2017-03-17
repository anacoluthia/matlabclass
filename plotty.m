function a = plotty(x,y,c);
% plots stuff
    figure;
    plot(x,y);
    title(char(c{3}));
    xlabel(char(c{1}));
    ylabel(char(c{2}));
end