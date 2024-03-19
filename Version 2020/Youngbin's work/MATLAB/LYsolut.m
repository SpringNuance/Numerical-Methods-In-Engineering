function[L,U,X]=LYsolut(A,B)
%The input numbers seemed to have not given the correct output. I am not
%sure where the code went wrong exactly.
A=[1 2 -2; 1 1 3; 1 0 -2];
B=[9; 23; 11];
[m, n]=size(A);
if (m ~= n )
disp ( 'error: Matrix must be square' );
return;
end
  %LU decomposition
  L=zeros(m,m);
  for i=1:m
  % Solving for L
  for k=1:i-1
      L(i,k)=A(i,k);
  for j=1:k-1
      L(i,k)= L(i,k)-L(i,j)*U(j,k);
  end
  L(i,k) = L(i,k)/U(k,k);
  end
  % Solving for U
  U=zeros(m,m);
  for k=i:m
      U(i,k) = A(i,k);
  for j=1:i-1
      U(i,k)= U(i,k)-L(i,j)*U(j,k);
  end
  end
  end
  for i=1:m
      L(i,i)=1;
  end
  
  % Solving 'Ly=b'
  y=zeros(m,1);
  y(1)=B(1)/L(1,1);
  for i=2:m
      y(i)=-L(i,1)*y(1);
  for k=2:i-1
      y(i)=y(i)-L(i,k)*y(k);
      y(i)=(B(i)+y(i))/L(i,i);
  end
  end
  
% Use the upper values to solve Ux = y
x=zeros(m,1);
x(m)=y(m)/U(m,m);
i=m-1;
q=0;
while  (i~= 0)
  x(i)=-U(i,m)*x(m);
   q=i+1;
      while (q~=m)
          x(i)=x(i)-U(i,q)*x(q);
          q=q+1;
      end
    x(i)=(y(i)+x(i))/U(i,i);
    i=i-1;
end
X = x;
% I tried using the one below but produced the same output. 
%for i=2:m
%x(i)=-U(i,1)*x(1);

%for k=i:m
%    x(i)=x(i)-U(i,k)*x(k);
%    x(i)=(y(i)+x(i))/U(i,i);
%end
%end
%X = x;
   