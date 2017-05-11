iris_data=load('Iris.txt');
iris_main=iris_data(:,1:end-1);
k=3;
iris_labels=iris_data(:,end);
for i=1:size(iris_main,2)
    rows1=find(iris_labels==1);
    rows2=find(iris_labels==2);
    rows3=find(iris_labels==3);
    
    nba_1=iris_main(rows1,i);
    nba_2=iris_main(rows2,i);
    nba_3=iris_main(rows3,i);
   
    mean_nba1=mean(nba_1);
    mean_nba2=mean(nba_2);
    mean_nba3=mean(nba_3);
    
    var_nb1=var(nba_1);
    var_nb2=var(nba_2);
    var_nb3=var(nba_3);
    
    avg_total=mean(iris_main(:,i));

f_value(i)=(((length(rows1)*((mean_nba1-avg_total)^2)) +(length(rows2)*((mean_nba2-avg_total)^2)) +(length(rows3)*((mean_nba3-avg_total)^2)))/(k-1))/((((length(rows1)-1)*var_nb1)+((length(rows2)-1)*var_nb2)+((length(rows3)-1)*var_nb3))/(length(iris_main)-k));
end
