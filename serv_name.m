function name=serv_name(W,T,wide)
format long
w1=floor(wide/10);
w2=wide-w1*10;
name=sprintf('count_W%d_sum_T%d_w%d%d_rand.arff',W,T,w1,w2);
end