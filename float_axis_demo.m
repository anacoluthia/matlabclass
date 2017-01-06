[cast date time press sigma temp csal coxy]=textread('hotdemo_ctd1.csv', '%f %f %f %f %f %f %f %f','headerlines',1,'delimiter',',');
%%%% put the headers for each column in the bracket
%%%% use the function textread and type in the file name
%%%% put a "%f" for each of the headers then copy the rest of the code
%%%floataxisX figure
% ymin=0;
% ymax=3000;% to define the y min and max of the depth
station=1;
ind1=find(cast==1);
figure;
hl1=plot(temp(ind1),press(ind1),'b-');% plot temperature vs pressure
set(hl1,'LineWidth',1);
ax1=gca;% assign current axis handle to variable for later reference if needed
set(ax1,'XMinorTick','on','ydir','reverse', 'box','on','xcolor',get(hl1,'color'));% set properties of the axes
htitle = title(['HOT station # ',num2str(station)]);% add title to plot 
% If you want station and date stamp use: htitle = title(['num2str(Station(1)),'  ', datestr(now)]);
set(hl1,'LineWidth',1);
xlabel('Temperature (Celsius)');
ylabel('Pressure (dbar)');
set(gca,'YLim',[0 3000]); %this sets the Ymin and Ymax
set(gca,'XLim',[0 3000]); %this sets the Xmin and Xmax
% add 1st floating axis for the second parameter plotted
[hl2,ax2,ax3] = floatAxisX(coxy(ind1),press(ind1),'r-','oxygen (umol/L)');
set(ax2,'ydir','reverse');
set(hl2,'LineWidth',1.5);%set the width of the lines
% add 2nd floating axis for the third parameter plotted
get(ax1);
[hl3,ax4,ax5] = floatAxisX(csal(ind1),press(ind1),'k-','salinity');
set(ax4,'ydir','reverse');
set(hl3,'LineWidth',1.5);
 
print('-djpeg',['HOTstn',num2str(station),'.jpg'])
%print('-depsc',['HOTstn',num2str(station),'.eps'])
%print('-dpdf',['HOTstn',num2str(station),'.pdf'])
