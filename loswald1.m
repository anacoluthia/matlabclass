%Part 1:
%radius of earth
radkm = 6371;
%calculate circumference of a circle
distancekm = 2*pi*radkm;
%convert km to mi
distancemi = distancekm/1.609;

%Part 2:
%given
df = 1000;
ds = 1024; 
dg = 737;
volume = 0.2*0.3*1.5; 
%calculate weight of each
wfresh = df*volume; 
wsea = ds*volume;
wgas = dg*volume;
wmix = (wfresh*(1/3)) + (wsea*(1/3)) + (wgas*(1/3));

%Part 3:
%given
A = [957167,141886];
B = [485376,421761];
C = [800280,915736];
%Distance in km btwn each 
AB = (pdist2(A,B))/1000;
AC = (pdist2(A,C))/1000;
BC = (pdist2(B,C))/1000;
%Closest is the min of the three, but how to disp variable name instead of
%value??
Closest = min([AB AC BC]);
%could use a loop to check value then store as a string, but that seems
%overly complicated
if Closest == AC 
   Closest = 'AC';
elseif Closest == AB
   Closest = 'AB';
elseif Closest == BC
   Closest = 'BC';
end
    
