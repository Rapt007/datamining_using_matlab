nba=load('NBA.mat')
nba=nba.nbawithoutDuplicatesNumericOnlySorted;
nba_withoutrank=nba(:,3:end);
nba_labels=nba(:,2);
k=5;
%doing Fstats
for i=1:size(nba_withoutrank,2)
    rows1=find(nba_labels==1); 
    rows2=find(nba_labels==2);
    rows3=find(nba_labels==3);
    rows4=find(nba_labels==4);
    rows5=find(nba_labels==5);
    
    nba_1=nba_withoutrank(rows1,i);
    nba_2=nba_withoutrank(rows2,i);
    nba_3=nba_withoutrank(rows3,i);
    nba_4=nba_withoutrank(rows4,i);
    nba_5=nba_withoutrank(rows5,i);

    mean_nba1=mean(nba_1);
    mean_nba2=mean(nba_2);
    mean_nba3=mean(nba_3);
    mean_nba4=mean(nba_4);
    mean_nba5=mean(nba_5);
    
    var_nb1=var(nba_1);
    var_nb2=var(nba_2);
    var_nb3=var(nba_3);
    var_nb4=var(nba_4);
    var_nb5=var(nba_5);
    avg_total=mean(nba_withoutrank(:,i));
    
    %calculating Fvalue
    f(i)=(((length(rows1)*((mean_nba1-avg_total)^2)) +(length(rows2)*((mean_nba2-avg_total)^2)) +(length(rows3)*((mean_nba3-avg_total)^2)) +(length(rows4)*((mean_nba4-avg_total)^2))+(length(rows5)*((mean_nba5-avg_total)^2)))/(k-1))/((((length(rows1)-1)*var_nb1)+((length(rows2)-1)*var_nb2)+((length(rows3)-1)*var_nb3)+((length(rows4)-1)*var_nb4)+((length(rows5)-1)*var_nb5))/(size(nba,1)-k));

end

[fsorted,idx]=sort(f);
idxnew=fliplr(idx);
idxnew=idxnew(1:10);

nba1=nba(:,2:end);
nba1=nba1';
traindata=nba1(idxnew,1:400);
testdata=nba1(idxnew,401:476);
classlabels=nba1(1,401:476);

result=knn_function(traindata,testdata,3);
% resultsvm=svm_classifier_function(traindata,testdata,classlabels);

