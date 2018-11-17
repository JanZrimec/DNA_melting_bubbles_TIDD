function name=serv_name2(job,sekv,n,W,T,wide)

sekv=[sekv(1,end-wide+1:end),sekv(1,1:end),sekv(1,1:W-1+wide)];
G=cell(n,2+2*wide);
dG = G_NN(sekv);
PBD = zeros(1,n);
        
for i=1:n
    G{i,wide+1}=sum(dG(i-1+wide+1:i-1+wide+W-1)); 
    for l=1:wide  
        G{i,l}=dG(i-1+l);
        G{i,wide+1+l}=dG(i-1+wide+W-1+l);
    end
    G{i,2*wide+2}=PBD(i);
end

w1=floor(wide/10);
w2=wide-w1*10;
name=sprintf('job%d_W%d_T%d_w%d%d_rand.arff',job,W,T,w1,w2);
dlmcell(name,G,', ')

text=['@RELATION PBDNN' 10];
    
for i=1:wide+1
    curr=sprintf('@ATTRIBUTE NN%d	numeric',i-wide);
    text=[text 10 curr];
end

for i=1:wide
    curr=sprintf('@ATTRIBUTE NN%d	numeric',i+W-1);
    text=[text 10 curr];
end

text=[text 10 '@ATTRIBUTE class	numeric' 10 10 '@DATA'];
dlmwrite(name,[text 13 10 fileread(name)],'delimiter','');

