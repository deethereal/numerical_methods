  H = [8 10 15 20 30 40 60 80];
B=[13.0 14.0 15.4 16.3 17.2 17.8 18.5 18.8];
m=length(H);

y=  H./B;
t=H;
det=m*sum(t.*t)-(sum(t))^2;
a=(sum(y)*sum(t.*t)-sum(t.*y)*sum(t))/det
b=(m*sum(t.*y)-sum(t)*sum(y))/det


F= @(x) a+b*x
x= 0:100;
F_res=F(x);
plot(t,y,'o',x,F_res) 