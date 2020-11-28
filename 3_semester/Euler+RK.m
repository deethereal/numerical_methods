clear;
clc;
f=@(t,y) t*exp(3*t) - 2*y;
analfun=@(t) 0.2*t.*exp(3*t)-0.04*exp(3*t)+0.04*exp(-2*t);
h=0.1;
%üÊÌÅÒ 
xx= 0:0.01:1;
Y = []; 
y = 0; 
X = 0:h:1; 
for t = 0:h:1;
   y = y + h*f(t,y);
   Y = [Y y]; 
end
hold on 
plot(X, Y,  '*', 'Linewidth', 2)

%òÕÎÇÅ-ëÕÔÔ 2-ÇÏ ÐÏÒÑÄÏË
Y=[]
for t = 0:h:1;
   k_1 = h*f(t,y);
   k_2 = h*f(t+0.5*h, y+(k_1*0.5));
   y = y + k_2;
   Y = [Y y]; 
end
plot(X, Y, 'o')
plot(xx, analfun(xx),'Linewidth', 2)
xlabel('x')
ylabel('y')
hold off

%!
