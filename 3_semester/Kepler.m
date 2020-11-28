clear;
clc;
N=200;
h=0.02;
r=[0 1]';
v=[2*pi 0]';
R=r;
V=v;
for n=1:N
    rnew=r+h*v;
    vnew=v-4*pi^2*h*r/norm(r)^3;
    V=[V vnew];
    R=[R rnew];
    r=rnew;
    v=vnew;
end
t=[0:h:N*h];
length(R(1,:));
length(t);
plot(t,R(1,:));