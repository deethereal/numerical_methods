clc;
clear;

f=@(x,v)[v -sin(x)]';

%Euler
x0=0;
v0=1;
h=0.1;
N=100;
y=[x0,v0]';
Y=[y];
for n=1:N
    y_new=y+h*f(y(1),y(2));
    Y=[Y y_new];
    y=y_new;
end
figure(1)
subplot(2,1,1); %rows/columns/id of picture
plot(Y(1,:),Y(2,:),'*-')

subplot(2,1,2);
T=0:h:N*h;
plot(0.5*Y(2,:).^2-cos(Y(1,:)),T,'o-')


%Leapfrog
v=v0-h*(sin(x0));
x=x0;
V=v0;
X=x0;
for n=1:N
    v_new=v+2*h*(-sin(x));
    x_new=x+2*h*v_new;
    V=[V v_new];
    X=[X x_new];
    x=x_new;
    v=v_new;
end
figure(2)
subplot(2,1,1);
plot(X,V)
subplot(2,1,2);
T = 0:h:10; 
plot(T,(0.5*V.^2 - cos(X)))


%Verlet
v=v0; 
x_old=x0; 
x=x0+h*v+0.5*h^2*(-sin(x0)); 
V=v0; 
X=[x0, x]; 

for n=1:N 
x_new=2*x-x_old+h^2*(-sin(x)); 
v_new=(x_new-x_old)/(2*h); 

V=[V, v_new]; 
X=[X, x_new]; 
x_old=x; 
x=x_new; 
v=v_new; 
end 

figure(3) 
subplot (2, 1, 1) 
plot (X(1:length(X)-1), V) 
subplot(2, 1, 2); 
T = 0:h:N*h; 
plot(T,(0.5*V.^2 - cos(X(1:length(X)-1))))