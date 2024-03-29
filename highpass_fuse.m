function result=highpass_fuse(matrixA,matrixB)
matrixA1=abs(matrixA);
matrixB1=abs(matrixB);
%% parameter settings
Para1.iterTimes=150;
Para2.iterTimes=150;

stt1=std2(matrixA1);
stt2=std2(matrixB1);

S21=max(max(matrixA1));
S22=max(max(matrixB1));

S11=graythresh(matrixA1);
S12=graythresh(matrixB1);

Para1.alpha_u=log10(1.0/stt1);
Para2.alpha_u=log10(1.0/stt2);
Para1.lambda=(S21/S11-1.0)/6;
Para2.lambda=(S22/S12-1.0)/6;
Para1.V_e=exp(-Para1.alpha_u)+S21/S11;
Para2.V_e=exp(-Para2.alpha_u)+S22/S12;
m1=(1-exp(-3* Para1.alpha_u))/(1- exp(-Para1.alpha_u))+(S21/S11-1)*exp(-Para1.alpha_u);
m2=(1-exp(-3* Para2.alpha_u))/(1- exp(-Para2.alpha_u))+(S22/S12-1)*exp(-Para2.alpha_u);
Para1.alpha_e=log( Para1.V_e / (S11 * m1));
Para2.alpha_e=log( Para2.V_e / (S12 * m2));
%%
PCNN_times1 = PAULPCNN(matrixA,Para1);
PCNN_times2 = PAULPCNN(matrixB,Para2);
map=(PCNN_times1>=PCNN_times2);
%%
result=map.*matrixA+~map.*matrixB;
end