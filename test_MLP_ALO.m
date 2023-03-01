%% test_MLP
clear all;
close all;
% clc

% load zarayeb_dataset3.mat
% load zarayeb_dataset3_2.mat

% load zarayeb_train_dataset4.mat
% load zarayeb_train_dataset3_3.mat
% load zarayeb_jadid
% load zarayeb_jadid_2
% load zarayeb_jadid_3
% load zarayeb_jadid_4  % Wavelet – wavelet
% load zarayeb_jadid_5  % Sigmoid – wavelet
% load zarayeb_jadid_6    % wavelet - Sigmoid
load zarayeb_train_dataset5

load dataset_5_lable_test.mat
load dataset_test_5.mat



X=dataset_test_5;

high=[30;30];
low=[0;0];
maxx=max(X,[],2);
minx=min(X,[],2);
s=(high-low)./(maxx-minx);
o=(low.*maxx-high.*minx)./(maxx-minx);
ss=repmat(s,1,size(X,2));
oo=repmat(o,1,size(X,2));
X=X.*ss+oo;

d1=zeros(size(dataset_5_lable_test));
indx1=find(dataset_5_lable_test==1);
d1(indx1)=1;

d2=zeros(size(dataset_5_lable_test));
indx1=find(dataset_5_lable_test==2);
d2(indx1)=1;

d3=zeros(size(dataset_5_lable_test));
indx1=find(dataset_5_lable_test==3);
d3(indx1)=1;

d4=zeros(size(dataset_5_lable_test));
indx1=find(dataset_5_lable_test==4);
d4(indx1)=1;

d=[d1;d2;d3;d4];


% MLP is (2,4,4)


n1=2;
n2=4;
n3=4;

% zarayeb=zarayeb_train_dataset3_3;
% zarayeb=zarayeb_jadid';
% zarayeb=zarayeb_jadid_2';
% zarayeb=zarayeb_jadid_3';
% zarayeb=zarayeb_jadid_4';%Wavelet – wavelet
% zarayeb=zarayeb_jadid_5';  % Sigmoid – wavelet
% zarayeb=zarayeb_jadid_6';  %  wavelet - Sigmoid
zarayeb=zarayeb_train_dataset5';

wji=zarayeb(1:n1*n2);
wji=reshape(wji,n2,n1);

tet=(zarayeb(n1*n2+1:n1*n2+n2));

wwji=(zarayeb(n1*n2+n2+1:end))';
wwji=reshape(wwji,n3,n2);

teta=repmat(tet,1,size(X,2));

v=wji*X+teta;

q=v.*(exp(-.5*v.*v));

% qq=wwji

% q=(exp(-.5*v.*v));
% qq=prod(q);
sai=wwji*q;
% sai_2=psai;
% yy=1+exp(-1*qq);
yy=1+exp(-1*sai);       % n3*N
y=yy.^(-1);

indd=y>.5;

% save indd indd 

% e=d-y;
e=d-indd;
E=(e*e').*eye(n3);
z=sum(sum(E));

y3=y;
ans=max(y3,[],1);
ans=repmat(ans,4,1);
y4=(ans==y);
y5=double(y4);
for i=1:4
   for j=1:4
      y6(i,j)=sum(y5(i,:).*d(j,:)); 
   end
end
y7=sum(y6);
y8=repmat(y7,4,1);
y9=y6./y8;
% ee=d-y5;
% EE=(ee*ee').*eye(n3);
% zz=sum(sum(EE));
% EEE=(ee*ee');
