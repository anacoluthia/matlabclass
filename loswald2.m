%Evaluation 2

%Part 1:  
radii = [7:6:32];
radii = 7 + 6*(0:4);
% question - is there a way to tell it "give me 5 values with this
% interval" without having to know the upper limit?
area = pi.*radii.^2;
circum = 2*pi.*radii;
disp('  ');
disp(['For Part 1, the areas are ' num2str(area)]);
disp(['and the circumferences are ' num2str(circum)]);
disp('  ');

%Part 2:
sqsidecircum = circum./4;
sqsidearea = sqrt(area);
disp(['For Part 2, the first squares have side lengths of ' num2str(sqsidecircum)]);
disp(['and the second squares have side lengths of ' num2str(sqsidearea)]);
disp('  ');

%Part 3:
width = sqrt(area./1.61);
height = 1.61.*width;
disp(['For Part 3, the widths are ' num2str(width)]);
disp(['and the heights are ' num2str(height)]);
disp('  ');