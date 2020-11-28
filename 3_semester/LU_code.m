clc;
clear;
A=[
 2 4 -6;
1 5 3;
1 3 2;];
b1=[1 0 0]';
b2=[0 1 0]';
b3=[0 0 1]';
[L,U]=lu(A);
%AX=I
[L U]=lu(A)
y1=L\b1 ;
x1=(U\y1);
y2=L\b2 ;
x2=(U\y2);
y3=L\b3 ;
x3=U\y3;
inv_A=[x1 x2 x3]
inv(A)