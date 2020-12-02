clear; clc;
h=1/2;

A = [(-2*(1+h^2))/h^2 - 1  (1+h^2)/h^2 + 1/2  0
    (1+4*h^2)/h^2 - 1  -2*(1+4*h^2)/h^2 - 1  (1+4*h^2)/h^2 + 1
    0  (1+9*h^2)/h^2 - 3/2  -2*(1+9*h^2)/h^2 - 1];
b = [-1*(1+h^2)/h^2 + 1/2 + h^2
    4*h^2
    9*h^2 - 2*(1+9*h^2)/h^2 - 3];

D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;

Mj = -inv(D)*(L + U);
cj = inv(D)*b;
Mgs = -inv(D+L)*U;
cgs = inv(D+L)*b;

radius = max(abs(eig(Mj)));
omega = 2/(1+sqrt(1-(radius^2)));
Msor = inv(D+omega*L)*[(1-omega)*D-omega*U];
csor = omega*inv(D+omega*L)*b;

normb = norm(b);
Nitj = 0;
Nitgs = 0;
Nitsor = 0;
y = zeros(1,3)';

%теперь сравним число итераций для разных методов

%решаем методом Якоби
while(norm(b-A*y)/normb > 1e-3)
    Nitj = Nitj+1;
    y = Mj*y+cj;
end
Nitj = Nitj

%решаем методом Гаусса-Зейделя
y = zeros(1,3)';
while(norm(b-A*y)/normb > 1e-3)
    Nitgs = Nitgs+1;
    y = Mgs*y+cgs;
end
Nitgs = Nitgs

%решаем методом SOR
y = zeros(1,3)';
while(norm(b-A*y)/normb > 1e-3)
    Nitsor = Nitsor+1;
    y = Msor*y+csor;
end
Nitsor = Nitsor

%строим график, сравнивая с верной функцией из условия
y = [1 y' 2]';
xx = 0:0.1:2;
f = @(x) (-sqrt(5)/6)*x + 1/3*sqrt(1+x.^2) + 1/3*(2+x.^2);
x = [0, h, 2*h, 3*h, 4*h]';
plot(xx, f(xx), x, y, 'o')