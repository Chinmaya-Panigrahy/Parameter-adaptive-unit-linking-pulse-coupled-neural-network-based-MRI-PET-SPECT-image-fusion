
%This package contains the matlab code of the following paper:

%Panigrahy, C., Seal, A., Gonzalo-Martín, C., Pathak, P., & Jalal, A. S. (2023). 
%Parameter adaptive unit-linking pulse coupled neural network based MRI–PET/SPECT image fusion. Biomedical Signal Processing and Control, 83, 104659. 
%DOI: 10.1016/j.bspc.2023.104659.
 clear all
 P=imread('MRI.png');  % A MxN matrix
 figure, imshow(P) 
 Q=imread('PET.png');  % A MxNx3 matrix
 figure, imshow(Q) 
  if size(Q,3)==3       % For MRI-PET/SPECT Image Fusion
        tic
        P=double(P)/255;
        Q=double(Q)/255;
        Q_YUV=ConvertRGBtoYUV(Q);
        Q_Y=Q_YUV(:,:,1);
        [hei, wid]=size(P);
        F_Y=FUSION_NSST_PAULPCNN(P,Q_Y);  % Performing Image Fusion
        F_YUV=zeros(hei,wid,3);
        F_YUV(:,:,1)=F_Y;
        F_YUV(:,:,2)=Q_YUV(:,:,2);
        F_YUV(:,:,3)=Q_YUV(:,:,3);
        F=ConvertYUVtoRGB(F_YUV);
        F=uint8(F*255);
        toc
        figure, imshow(F)          
  else                       % For Medical Image Fusion where both the source images are gray-scale                       
        tic
        P=double(P)/255;
        Q=double(Q)/255;
        F=FUSION_NSST_PAULPCNN(P,Q);   % Performing Image Fusion
        F=uint8(F*255);
        toc
        figure, imshow(F) 
  end
       
   

         

