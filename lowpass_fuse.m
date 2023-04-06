function fusion=lowpass_fuse(X1,X2)
%DWRE
e1=DWRE(X1);
e2=DWRE(X2);
map=(e1>=e2);
fusion=map.*X1+~map.*X2;
end