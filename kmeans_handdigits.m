iris_data=load('handdigits.txt');
iris_datalabels=iris_data(1,:);
iris_dataset=iris_data(2:end,:);
clustering=kmeans(iris_dataset',26);
clustering1=clustering';
% matrix=zeros(26,39)

% for i=1:size(clustering,1)
%     a=iris_datalabels(i);
%     b=clustering(i);
%     if (a==b)
%         confusion_matrix(a,b)=confusion_matrix(a,b)+1;
%     end
%     if(b==a+1 || b==a-1)
%         confusion_matrix(a,b)=confusion_matrix(a,b)+1;
%     end
%     if(b==a+2 || b==a-2 )
%         confusion_matrix(a,b)=confusion_matrix(a,b)+1;
%     end
%     
% end
 confusion_matrix1=confusionmat(iris_datalabels,clustering);
result=munkres(-confusion_matrix1);
% result3=munkres(~confusion_matrix);
confusion_matrix=confusion_matrix1(:,result)
total=sum(sum(confusion_matrix));
diagonal_sum=trace(confusion_matrix);
accuracy=diagonal_sum/total;


        
        