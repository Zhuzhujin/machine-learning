function [pcaA,V] = fastPCA(A,k,mA)
m=size(A,1);
Z=(A-repmat(mA,m,1));
T=Z*Z';
[V1,D]=eigs(T,k);
V=Z'*V1;
for i=1:k        
    l=norm(V(:,i));  
    V(:,i)=V(:,i)/l; 
end
pcaA=Z*V;
end