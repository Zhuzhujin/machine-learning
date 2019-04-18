function showImg(A,B)
faceW = 32; 
faceH = 32; 
Y1 = reshape(A,[faceH,faceW]);
Y2 = reshape(B,[faceH,faceW]);
%figure(1)
subplot(2,2,1);imagesc(Y1),title('ÑµÁ·Í¼Ïñ');colormap(gray) %ÏÔÊ¾Ô­Ê¼Í¼Ïñ
%figure(2)
subplot(2,2,2);imagesc(Y2),title('²âÊÔÍ¼Ïñ');colormap(gray) %ÏÔÊ¾³¬ÏñËØ·Ö¸îÍ¼Ïñ
%imagesc(Y);colormap(gray);
end