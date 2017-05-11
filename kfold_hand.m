traindata=load('handdigits.txt');
observations=size(traindata,2);
k=5;
c=cvpartition(observations,'kfold',k);
result1=zeros(k,size(find(test(c,1)==1),1));
% 
% addpath('E:\datamining_chrisding\datasets\libsvm-3.22\matlab');

 
 

for m=1:k
    testindices=test(c,m);
    testcols=find(testindices==1);
    class_labels=traindata(1,testcols);
    test_maindata=traindata(:,testcols);
    traincols=find(testindices==0);
    train_maindata=traindata(:,traincols);
    result1=knn_function(train_maindata,test_maindata,3);
    count=0;
   meansq=sum((result1-class_labels).^2)/length(result1);
   a=class_labels-result1
   for i=1:length(a)
       if(a(i)==0)
           count=count+1;
       end
   end
   
    result2=linear_regression_classifier_function(train_maindata,test_maindata);
    count1=0;
    meansq1=sum((result2-class_labels).^2)/length(result2);
    a1=class_labels-result2
   for i=1:length(a1)
       if(a1(i)==0)
           count1=count1+1;
       end
   end
    result3=centroid_function(train_maindata,test_maindata);
    count2=0;
    meansq2=(sum((result3-class_labels).^2))/length(result3);
    a2=class_labels-result3
   for i=1:length(a2)
       if(a2(i)==0)
           count2=count2+1;
       end
   end
    result4=svm_classifier_function(train_maindata,test_maindata,class_labels);
    count3=0;
    meansq3=(sum((result4-class_labels).^2))/length(result4);
    
    a3=class_labels-result4
   for i=1:length(a3)
       if(a3(i)==0)
           count3=count3+1;
       end
   end
    
%     disp(count)
    accuracy(m)=count/size(result1,2);
    accuracy1inear(m)=count1/size(result2,2);
    accuracycenter(m)=count2/size(result3,2);
    accuracysvm(m)=count3/size(result4,2);
    mean_sq(m)=meansq;
    mean_sq1(m)=meansq1;
    mean_sq2(m)=meansq2;
    mean_sq3(m)=meansq3;
   
    
    
     
end
    average=mean(accuracy(:))*100;
    averagelinear=mean(accuracy1inear(:))*100;
    averagecenter=mean(accuracycenter(:))*100;
    averagesvm=mean(accuracysvm(:))*100;
    avgmean1=mean(mean_sq);
    avgmean2=mean(mean_sq1);
    avgmean3=mean(mean_sq2);
    avgmean4=mean(mean_sq3);

