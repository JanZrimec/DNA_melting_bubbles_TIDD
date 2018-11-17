function out=weka_run(sekv,W,T,wide)

% Main file for prediction of TIDD based on Weka models built by M5P algorithm (see Zrimec, 2015) 

% sekv	.. nucleotide sequence (capital letters, ATGC only)
% W	.. destabilization width
% T	.. destabilization treshold
% wide	.. number of included neighboring regions (see Figure 1)

% treshold
tr = [0.1,0.5,1.0,1.5];

n=length(sekv);
name = serv_name(W,find(tr==T),wide);
name2 = serv_name2(1,sekv,n,W,find(tr==T),wide);
name3 = 'job.out';

command = ['java -cp weka.jar weka.classifiers.trees.M5P -t ',name,' -T ',name2,' -classifications "weka.classifiers.evaluation.output.prediction.CSV -file ',name3,'"'];
[~]=system(command);
result=dlmread(name3,',',1,0);
out=result(:,3);

end
