figure(1)
subplot(1,3,1)
   plot(IO3DeficitnM,SigmaTheta,'r+')
   axis ij
   ylabel('Sigma-T')
   xlabel('IO3 Deficit, nM')
   set(gca,'xaxisLocation','top')
   
subplot(1,3,2)
   plot(DeltaNO3,SigmaTheta,'bo')
   axis ij
   xlabel('NO3 Deficit, nM')
   set(gca,'xaxisLocation','top')
   axis([-35 5 24.5 28])
subplot(1,3,3)
   plot(ExcessInM,SigmaTheta,'gd')
   axis ij
   xlabel('Excess I-, nM')
   set(gca,'xaxisLocation','top')