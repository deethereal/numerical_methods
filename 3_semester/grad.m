clear;
clc;
h=1/2;
A=[ -4 1 0
    1 -4 1
    0 1 -4];
b=[ -sqrt(2)/2 -1 -sqrt(2)/2]';
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;
c_j = inv(D) * b;
M_j = - inv(D) * (L + U);
M_gas= -inv(D+L) * U
cgs=inv(L+D)*b;

RHO=max(abs(eig(M_j)));
omega = 2/(1+sqrt(1-RHO^2));
csor=omega*inv(D+L*omega)*b;
Msor=inv(D+omega*L)*[(1-omega)*D-omega*U];
norm_b=norm(b);
i_j=0;
i_gs=0;
u=zeros(1,3)';
while( norm(b-A*u)/norm_b >1e-3)
    i_j=i_j+1;
    u=M_j*u+c_j;
end    
i_j=i_j

u=zeros(1,3)';
while( norm(b-A*u)/norm_b >1e-3)
    i_gs=i_gs+1;
    u=M_gas*u+cgs;
end    
i_gs=i_gs
u=zeros(1,3)';
i_sor=0;
while( norm(b-A*u)/norm_b >1e-3)
    i_sor=i_sor+1;
    u=Msor*u+csor;
end     
i_sor=i_sor
x=[0:h:2]';
y=[0:h:1]';
u=[0 u' 0];
u_0=[sin(pi*x/2)]'
u=[zeros(1,5); u; u_0]
xx=[0:0.1:2];
yy=[0:0.1:1]';
u_f=@(x,y) (1/sinh(pi/2))*sin(pi*x/2).*sinh(pi*(1-y)/2);
u_f(xx,yy);
figure(1)
mesh(xx,yy,u_f(xx,yy))
figure(2)
mesh(x,y,u)
%u_f(h,h)




