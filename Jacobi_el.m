
clc;
clear;% 10x1 + 5x2 = 6,
% 5x1 + 10x2 ? 4x3 = 25,
% ? 4x2 + 8x3 ? x4 = ?11,
% ? x3 + 5x4 = ?11.
format short
x= [0 0 0 0]';
xnew=x;
eps=1e-5;

xnew(1)=0.1*(6-5*x(2));
xnew(2)=0.1*(25-5*x(1)+4*x(3));
xnew(3)=0.125*(-11-4*x(2)+x(4));
xnew(4)=0.2*(-11+x(3));
x=xnew;
while (norm(xnew-x,inf)/norm(xnew,inf) < eps)
    x=xnew;
    xnew(1)=0.1*(6-5*x(2));
    xnew(2)=0.1*(25-5*x(1)+4*x(3));
    xnew(3)=0.125*(-11-4*x(2)+x(4));
    xnew(4)=0.2*(-11+x(3));

end
xnew
