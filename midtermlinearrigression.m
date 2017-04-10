 pre_traindata=load('/home/rapt/Desktop/learning/datamining/projects/traindata.txt');

pre_testdata=load('/home/rapt/Desktop/learning/datamining/projects/testdatanew');
first_traindata=pre_traindata(1,:);

test_maindata=pre_testdata(1:end,:);
train_maindata=pre_traindata(2:end,:);


size_first=size(first_traindata,2);
distinct_classes=size(unique(first_traindata),2);

for i=1:distinct_classes
  for j=1:size(first_traindata,2)
      if i==first_traindata(j)
      indicator_matrix(i,j)=1;
      else 
      indicator_matrix(i,j)=0;
      end 
  end 
end


b=pinv(train_maindata')*indicator_matrix';
a=b'*test_maindata;
[m n]=max(a,[],1);1
label=n;
disp(label);
