function e = DWRE(matrix)
w=[1/(1+sqrt(2)),1/2,1/(1+sqrt(2));1/2,1,1/2;1/(1+sqrt(2)),1/2,1/(1+sqrt(2))];
u=matrix.*matrix;
e = conv2(u, w, 'same'); 






