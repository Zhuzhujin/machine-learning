clear all
close all
clear 
clc

tic

load Q
load Q1

class = 500;   % input images
M = 20;     %Input class
N = class/M;    %Input images in each class;


H1 = 1;
H2 = 100;
H3 = H2-H1+1;
for tt = H1:H2
z = Q1(:,tt); 

% z = Q(:,ra2);

for s = 1:M  % 1-40
    t = (s-1)*N+1; % 1 26 51 ...
    q = s*N; % 25 50 75 ...
        D = Q(:,t:q);
        for i = 1:N-1      % 1-24
            for j = i+1:N   % 2-25
                    T = D(:,j)-D(:,i);   % z2-z1
                    if  z == D(:,i)
                        zp = D(:,i);   % zp = z1
                    elseif z == D(:,j)
                           zp = D(:,j);   % zp = z2
                    else
                        T1 = z-D(:,i);  % z-z1 
                        G1 = dot(T1,T);
                        G2 = dot(T,T);
                        GAMA = G1/G2;
                        zp = D(:,i) + GAMA*T;
%                         GAMA1(i,j) = G1/G2;
                    end
                d(i,j) = sqrt(sum(abs(z - zp).^2));
                [m1,n1] = size(d); 
                S = reshape(d,m1*n1,1);   
            end
 
        end
    SS(:,s) = S;
    dd(:,t:q) = d;
    
end


SSS(1,:) = SS(25,:);
SSS(2:3,:) = SS(49:50,:);
SSS(4:6,:) = SS(73:75,:);
SSS(7:10,:) = SS(97:100,:);
SSS(11:15,:) = SS(121:125,:);
SSS(16:21,:) = SS(145:150,:);
SSS(22:28,:) = SS(169:175,:);
SSS(29:36,:) = SS(193:200,:);
SSS(37:45,:) = SS(217:225,:);
SSS(46:55,:) = SS(241:250,:);
SSS(56:66,:) = SS(265:275,:);
SSS(67:78,:) = SS(289:300,:);
SSS(79:91,:) = SS(313:325,:);
SSS(92:105,:) = SS(337:350,:);
SSS(106:120,:) = SS(361:375,:);
SSS(121:136,:) = SS(385:400,:);
SSS(137:153,:) = SS(409:425,:);
SSS(154:171,:) = SS(433:450,:);
SSS(172:190,:) = SS(457:475,:);
SSS(191:210,:) = SS(481:500,:);
SSS(211:231,:) = SS(505:525,:);
SSS(232:253,:) = SS(529:550,:);
SSS(254:276,:) = SS(553:575,:);
SSS(277:300,:) = SS(577:600,:);


[m2,n2] = size(SSS);
S_final = reshape(SSS,m2*n2,1);

[junk,idx] = sort(S_final);
idx1 = idx(1,1);

% % % % % % % % % % % % % % % % 

r = 300;
for i =1:40
    if idx1 >= r*(i-1)+1 && idx1 <= r*(i)
        idx2 = i;
    end
end

r = 25; 
for i =2:42
    if tt >= r*(i-2)+1 && tt <= r*(i-1)+1
        ra3 = i-1;
    end
end
% % % % % % % % % % % % % % % % % % 



% idx2
% 
DATA(tt,1) = ra3;
DATA(tt,2) = idx2;

count = 0;
if  idx2  == ra3
    count = (count+1);
    cou(tt,:) = count;

end

end

% % % % % % % % % % % % % % % % % % % % % % % % % rr
count1 = sum(cou);
percent = (count1/H3)*100 ;
TIME = toc;
fprintf('Recognition Testing_Times¡G%.3f (times)\n',tt);
fprintf('Recognition Rate¡G%.3f (percent)\n',percent);
fprintf('Recognition Time¡G%.3f (s)\n',TIME);      

% % % % % % % % % Conclusion % % % % % % % % % % % % 
%  times      percent     time
%   100        89 %     111.307  sec
%   200        85 %     220.229  sec
%   300        86 %     330.480  sec
%   400        87.25%   443.754  sec
%   500        89.8%    550.263  sec 
% % % % % % % % % % % % % % % % % % % % % % % % % % r
% % % % % Recognition Testing_Times¡G100.000 (times)
% % % % % Recognition Rate¡G89.000 (percent)
% % % % % Recognition Time¡G56.534 (s)
% % % % % % % % % % % % % % % % % % % % % % 
grid on
plot(SSS(1:10,1),SSS(11:20,1),'+',SSS(1:10,2),SSS(11:20,2),'o',SSS(1:10,3),SSS(11:20,3),'*')
title('2-D-Main of LDA parameters');
grid on
