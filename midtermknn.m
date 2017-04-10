function [result]=midtermknn(filepath,testfilepath,l)
%train data 
pre_traindata=load(filepath);  %load command help to load the data from text file to matlab and turns it into a matrix.

% Test data loading 
pre_testdata =load(testfilepath);

%extracting rows from 2 till end with all columns from pre_train data.
train_main=pre_traindata(2:end,:);

%extracting rows from 2 till end with all columns from pre_testdata.
test_main=pre_testdata(1:end,:);

%extracting the first row from pre_traindata matrix.
class_label= pre_traindata(1,:);

%distance=0;
for i=1:size(test_main,2)
test_col=test_main(:,i); %creating a column vector from test_main matrix
for k=1:size(train_main,2)
train_col=train_main(:,k);%creating a column vector from train_main matrix
sample_dist(i,k)=sqrt(sum((test_col-train_col).^2));%creating a matrix of sample_distance by computing distances
end
 end
 
[~,idx]=sort(sample_dist,2);
a=idx(1:size(test_main,2),1:l);
for i=1:size(test_main,2)
class_labels(i)=mode(class_label(a(i,1:l)));
end
result=class_labels;
end














