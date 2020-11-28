clc;
clear;
A=[

5 4 1 1
4 5 1 1
1 1 4 2
1 1 2 4
]
[V D] = eigs(A)
x=[1,1,1,1]';
x=x/norm(x);

% наибольшее собсвтенное значение
for i=1:50
    y=A*x;
    lambda=y'*x;
    x=y/norm(y);
    fprintf('%2.0f %9.5f\n', i, lambda);
end
%наименьшее с.з.
x_max=x
x=[1,1,1,1]';
x=x/norm(x);

for i=1:50
    y=A\x;
    lambda_inv=y'*x;
    x=y/norm(y);
    fprintf('%2.0f %9.5f\n', i, 1/lambda_inv);
end
x_min=x
x=[1,1,1,1]';
x=x/norm(x);
%среднее собственное значение
s=2.1;
for i=1:50
    y=(A-s*eye(4,4))\x;
    lamda_s=y'*x;
    x=y/norm(y);
    lamda=1/(lamda_s)+s;
    fprintf('%2.0f %9.5f\n', i,lamda );
end
x_av=x
x=[1,1,1]';