%Minh Nguyen (301539625)
%Running all the code at the same time will give a messy image
%In case you check my code, please run it part by part.



data = "CA4data.xlsx";
D=xlsread(data);
h=D(:,1);
k=D(:,2);
g=D(:,3);

l=ones(45,1);

A=cat(2,l,h);

% %Q1a

eig(A'*A)

ATA1=inv(A'*A);

x1=ATA1*A'*g;
g1=A*x1;
x=0:0.2:12;
gg= x1(1,1)+ x1(2,1)*x;


plot(x,gg)
h0=(50-x1(1,1))/(x1(2,1)); % min estimated hours needed to pass

plot(h,g,'k.')
hold on
plot(x,gg)
hold on
axis([0 15 20 100])
hold on
xlabel('hours per week'); ylabel('grade')


%Q1b
l=ones(45,1);

A2=cat(2,A,h.^2);
eig(A2'*A2)

x2=(inv(A2'*A2))*A2'*g;

x=0:0.2:12;
g2= x2(1,1)+ x2(2,1)*x+ x2(3,1)*(x.^2);
plot(x,g2)

syms n
eqn = x2(1,1)+ x2(2,1)*n+ x2(3,1)*n^2 == 50;
h02=round(solve(eqn,n),4,"significant"); % choose 4.634 

plot(h,g,'k.')
hold on
plot(x,g2)
hold on
axis([0 15 20 100])
hold on
xlabel('hours per week'); ylabel('grade')

%Q2
plot3(h,k,g,'k.')
grid on

M=cat(2,A,k);

v=inv(M'*M)*M'*g;
a=v(1,1);
b=v(2,1);
c=v(3,1);

plot3(h,k,g,'k.')
axis([0; 15; 20; 100; 20; 100])
grid on
hold on

x=0:.1:15; y=0:1:100;

[X,Y]=meshgrid(x,y);
ggg=a+b*X+c*Y;
mesh(x,y,ggg);
grid on
hold on

xlabel('hours per week'); 
ylabel('grade in Math 152');
zlabel('grade in Math 232');

[X,Y] = meshgrid(1:100,1:100);
Z=50*ones(length(X),length(Y));
surf(X,Y,Z);

x=1:100;
m=81.8123-4.6933*x;
plot3(x,m,Z)

