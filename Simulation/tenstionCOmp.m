
g = 9.81;
M = 1;
m = 4;
ell = 2;
mu = [0,0,1]';
dX = [0,0,0]';
drho = [0,0,0]';
F = [0,0,m*g]';

T = abs((M/(M+m))*(mu'*F+(m/ell)*norm(dX-drho)^2))