load('dataset_train_6.mat')  % 1:spoofing   2:jamming  3:multipath
load('dataset_train_6_lable.mat')       % 4:non

X=dataset_train_6';

figure


d3=zeros(size(dataset_train_6_lable));
indx1=find(dataset_train_6_lable==3);
d3(indx1)=1;

plot(X(1,indx1),X(2,indx1),'.y');
hold on

d4=zeros(size(dataset_train_6_lable));
indx1=find(dataset_train_6_lable==4);
d4(indx1)=1;

plot(X(1,indx1),X(2,indx1),'.m');
hold on

d2=zeros(size(dataset_train_6_lable));
indx1=find(dataset_train_6_lable==2);
d2(indx1)=1;

plot(X(1,indx1),X(2,indx1),'.g');
hold on

d1=zeros(size(dataset_train_6_lable));
indx1=find(dataset_train_6_lable==1);
d1(indx1)=1;

plot(X(1,indx1),X(2,indx1),'.');
hold on
