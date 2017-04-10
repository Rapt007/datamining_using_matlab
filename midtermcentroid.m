%centroid classifier.
function result=midtermcentroid(filepath,testfilepath)

pre_traindata=load(filepath); %load command help to load the data from text file to matlab and turns it into a matrix.
pre_testdata =load(testfilepath);
 
train_maindata=pre_traindata(2:end,:);%extracting rows from 2 till end with all columns from pre_traindata.

test_maindata=pre_testdata(1:end,:);%extracting rows from 2 till end with all columns from pre_testdata.

class_label=pre_traindata(1,:);%extracting the first row from pre_traindata matrix.

sample_size=size(unique(class_label),2);%making the class label unique to get the number of distinct classes.

class_size=size(class_label,2)/sample_size;%getting the count of each class label.



for i=1:sample_size
a=find(class_label==i);
centroid_matrix(:,i)=mean(train_maindata(:,a),2);
end

%calculating distances between test_maindata matrix and centroid_matrix in order to make sample_dist matrix through which we can compute the min_dist matrix lateron in the program.
for i=1:size(test_maindata,2)
test_col=test_maindata(:,i);% extracting columns everytime loop runs from a test_maindata matrix.
for j=1:size(centroid_matrix,2)
centroid_col=centroid_matrix(:,j);% extracting columns everytime loop runs from a centroid_matrix
sample_dist(i,j)=sqrt(sum((test_col-centroid_col).^2)); %getting the distance .
end
end

%getting min distances to find the label or class which is closest to test points.

for i=1:size(sample_dist,1)
[value idx]=min(sample_dist(i,:));%getting the min value in every row so that to find the closest centroid.
min_dist(i)=value; % storing minimum values in min_dist matrix.
label(i)=idx;% getting the class which is closest through the index of closest centroid.
end

result=label;
end













