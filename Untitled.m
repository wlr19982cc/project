A=[0.03,58.9;
5.32,-6.10;];
b=[59.2;47.0;];
n=length(b);
for k=1:n-1
 bb=A;
 bb(bb==0)=Inf; 
[mainElement,index]=min(abs(A(k:n,k)));
index=index+k-1;
if abs(mainElement)==0
disp('no unique solution exists');
break;
elseif index>k
temp=A(k,:);
A(k,:)=A(index,:);
A(index,:)=temp;
tempt=b(k,:);
b(k,:)=b(index,:);
b(index,:)=tempt;
end
for i=k+1:n
m(i,k)=A(i,k)/A(k,k);
A(i,k:n)=A(i,k:n)-m(i,k)*A(k,k:n);
b(i)=b(i)-m(i,k)*b(k);
end
end
b(n)=b(n)/A(n,n);
for i=n-1:-1:1
b(i)=(b(i)-sum(A(i,i+1:n).*b(i+1:n)'))/A(i,i);
end
x=b
