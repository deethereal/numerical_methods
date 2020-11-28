clear;
clc;
x0=0;
v0=1;
h=0.15;
a=0.1;
N=1000;

y=[x0,v0]';
Y=y;
Y_norm=norm(y);


%явно
% for n=1:N
%     y_new=y+h*[y(2),-y(1)-a*y(2)]';
%     Y=[Y y_new];
%     Y_norm=[Y_norm norm(y_new)];
%     y=y_new;
% end


%невяно

J=[0 1
    -1 -a];
I=eye(2,2);
%  for n=1:N
%     y_new=(I-h*J)\y;
%     Y=[Y y_new];
%     Y_norm=[Y_norm norm(y_new)];
%     y=y_new;
% end

%метод трапеции
for n=1:N
    y_new=(I-0.5*h*J)\(I+0.5*h*J)*y;
    Y=[Y y_new];
    Y_norm=[Y_norm norm(y_new)];
    y=y_new;
end

Y=Y';
figure(1)
plot(Y,'o-')
figure(2)
plot(1:length(Y),Y_norm)
