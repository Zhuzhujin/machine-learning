function showImg(A,B)
faceW = 32; 
faceH = 32; 
Y1 = reshape(A,[faceH,faceW]);
Y2 = reshape(B,[faceH,faceW]);
%figure(1)
subplot(2,2,1);imagesc(Y1),title('ѵ��ͼ��');colormap(gray) %��ʾԭʼͼ��
%figure(2)
subplot(2,2,2);imagesc(Y2),title('����ͼ��');colormap(gray) %��ʾ�����طָ�ͼ��
%imagesc(Y);colormap(gray);
end