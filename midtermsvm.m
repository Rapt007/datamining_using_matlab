
training=load('/home/rapt/Desktop/learning/datamining/projects/traindata.txt');
testX=load('/home/rapt/Desktop/learning/datamining/projects/testdatanew');

training_label=double(training(1,:));
training_label_vector=training_label';

training_instance=double(training(2:end,:));
training_instance_matrix=training_instance';
test_label=[1 2 3 4 5 6 7 5 6 8 2 3 4 5 6 7 5 6 8 1];
test_label_vector=double(test_label');
test_instance=double(testX(1:end,:));
test_instance_vector=test_instance';


model=svmtrain(training_label_vector,training_instance_matrix,['-s 0 -t 0']);

[predict_label, accuracy,decision]=svmpredict(test_label_vector,test_instance_vector,model);
b=-model.rho;
%alpha=model.sv_coef'*training_label_vector(model.sv_indices);
w=model.SVs'*model.sv_coef;
alpha=model.sv_coef.*training_label_vector(model.sv_indices);
