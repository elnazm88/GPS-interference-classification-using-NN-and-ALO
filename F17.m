function z = F17(x)
zarayeb=x;
% % o=x(1)*sin(4*x(2))+1.1*x(2)*sin(2*x(2));
% % MLP is (2,4,4)
n1=2;
n2=4;
n3=4;

load('dataset_train_6.mat')
load('dataset_train_6_lable.mat')

X=dataset_train_6';
high=[30;30];
low=[0;0];
maxx=max(X,[],2);
minx=min(X,[],2);
s=(high-low)./(maxx-minx);
o=(low.*maxx-high.*minx)./(maxx-minx);
ss=repmat(s,1,size(X,2));
oo=repmat(o,1,size(X,2));
X=X.*ss+oo;

d1=zeros(size(dataset_train_6_lable));
indx1=find(dataset_train_6_lable==1);
d1(indx1)=1;

d2=zeros(size(dataset_train_6_lable));
indx1=find(dataset_train_6_lable==2);
d2(indx1)=1;

d3=zeros(size(dataset_train_6_lable));
indx1=find(dataset_train_6_lable==3);
d3(indx1)=1;

d4=zeros(size(dataset_train_6_lable));
indx1=find(dataset_train_6_lable==4);
d4(indx1)=1;

d=[d1 d2 d3 d4]';

wji=zarayeb(1:n1*n2);
wji=reshape(wji,n2,n1);

tet=(zarayeb(n1*n2+1:n1*n2+n2))';

wwji=(zarayeb(n1*n2+n2+1:end))';
wwji=reshape(wwji,n3,n2);

teta=repmat(tet,1,size(X,2));

v=wji*X+teta;

% q=v.*(exp(-.5*v.*v));
% q=(1+exp(-1.*v)).^(-1);
% q=exp(-.5*v.*v);
q=v.*exp(-.5*v.*v); % Wavelet – wavelet & wavelet-sigmoid
% q=(1+exp(-1.*v)).^(-1); % sigmoid – wavelet
% qq=wwji

% q=(exp(-.5*v.*v));
% qq=prod(q);
sai=wwji*q;
% sai_2=psai;
% yy=1+exp(-1*qq);

% % yy=1+exp(-1*sai);       % n3*N
% % y=yy.^(-1);

% y=exp(-.5*sai.*sai);
% y=sai.*exp(-.5*sai.*sai); % Wavelet – wavelet & sigmoid – wavelet
y=(1+exp(-1.*sai)).^(-1);   % Wavelet – sigmoid

indd=y>.5;

% save indd indd 

% e=d-y;
e=d-indd;
E=(e*e').*eye(n3);
% z=sum(sum(E));

% z=zarayeb*zarayeb';

y3=y;
ans=max(y3,[],1);
ans=repmat(ans,4,1);
y4=(ans==y);
y5=double(y4);

ee=d-y5;
EE=(ee*ee').*eye(n3);
z=sum(sum(EE));
EEE=(ee*ee');
y6=y5;
save  y6 y6
% save EEE EEE
end

