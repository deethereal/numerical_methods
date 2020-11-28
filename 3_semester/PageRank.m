clear;
clc;
i = [ 2 3 4 4 5 6 1 6 1];
j = [ 1 2 2 3 3 3 4 5 6];
n = 6;
G = sparse(i,j,1,n,n);
full(G);
c = full(sum(G));

p=0.85;
for i=1:n
    for j=1:n
        if c(j)>0
            P(i,j)=p*G(i,j)/c(j)+(1-p)/n;
        else
            P(i,j)=1/n;
        end
    end
end
x=[ones(1,n)]';
x=x/norm(x);
for i=1:50
    y=P*x;
    lambda=y'*x;
    x=y/norm(y);
end
x=x./norm(x,1)
[x_max, i_max]=max(x)