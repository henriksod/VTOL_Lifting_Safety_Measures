syms x y z real

v = [x,y,z]';
simplify((inv(v'*v)*v')*v)
simplify(simplify(v'/(norm(v)^2))*v)