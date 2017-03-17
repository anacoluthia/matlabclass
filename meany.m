function a = meany(x,y);
% Does stuff that other things already do - mean, std, & scaling
    m = mean(x);
    s = std(x); 
    scale = (x-m)./s;
    figure;
    subplot(2,1,1)
    plot(y,x);
    title('Original Data');
    subplot(2,1,2);
    plot(y, scale)
    title('Scaled Data');
end