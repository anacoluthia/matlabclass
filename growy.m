function dPdt  = growy(t,P)
% dPdt is complicated growth
global g K
  dPdt = g*(1 -P./K)*P;
end
