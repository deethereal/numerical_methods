clear;
clc;

func =@(t,y) -8*y-40*(3*exp(-t/8)-1);

y_0 = 100;
N = 9;
h = 1/N;

Y = y_0;
y = y_0;
%явно
%for n=1:(6*N)
    %y_new = y + h * func((n-1)*h, y);
    %y = y_new;
    %Y = [Y, y];
%end

%неявно
for n=1:6*N
    fun =@(y_new) y_new - y - h * func(n*h, y_new);
    y_new = fzero(fun, y);
    y = y_new;
    Y = [Y, y];
end    

hold on
t = 0:h:6;
plot(t,Y, 'o-');
tt = 0:0.01:6;
funcY =@(t) (2315/21)*exp(-8*t) - (320/21)*exp(-t/8) + 5;
plot (tt, funcY(tt))
