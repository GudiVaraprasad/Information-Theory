
% Gudi Varaprasad
% 19BCE7048

% LAB- L31 + L32
% Lab2 - Discrete Memory Less Channel
% 23/03/2022

clc;
clear all;
close all;

% Consider any type of Channel. Determination of various entropies 
% H(X), H(Y), H(X|Y), H(Y|X), H(X,Y), H(Y,X) and mutual information 
% I(X,Y) of the given channel. If symbols rate is 30 symbols/sec, then 
% find the average rate of Information transmitted across the channel ?

nChannels = input('Enter number of channels : '); % 2
sum = 0;
N1 = nChannels;
N2 = nChannels;

for i = 1:N1
    for j = 1:N2
       Cmatrix(i,j)=input('Enter the element : '); % 0.8 0.2 0.2 0.8
    end
end

fprintf("\n\nChannel Matrix, P(Y|X) = ");
Cmatrix = reshape(Cmatrix, N1, N2); % Channel Matrix
x = 1;
y = nChannels;

for i = 1:x
    for j = 1:y
        initialProb(i,j) = input('initial probability X[] = '); % 0.4 0.6
    end
end
x = reshape(initialProb, x, y);
y = x * Cmatrix;

for n = 1 : nChannels
    if(x(n) == 0)
        break;
    end
    Hx = sum + (x(n)*log2(1/x(n)));
    sum = Hx;
end

fprintf("\n\nEntropy of Source, H(X) = " + Hx + " bits/symbol");

sum = 0;
for n = 1:nChannels
    if(y(n) == 0)
        break;
    end
    Hy = sum+(y(n)*log2(1/y(n)));
    sum = Hy;
end
fprintf("\n\nEntropy of Output, H(Y) = " + Hy + " bits/symbol");


for i = 1:N1
    for j = 1:N2
        Q(i,j) = Cmatrix(i,j) * x(i);
    end
end
% disp('P(X,Y): ');

sum = 0;
for i = 1:N1
    for j = 1:N2
        if(Q(i,j) == 0)
            break;
        end
        Hxy = sum + (Q(i,j)*log2(1/Q(i,j)));
        sum = Hxy;
    end
end
fprintf("\n\nJoint Entropy, H(X,Y) = " + Hxy + " bits/symbol");

% H(X|Y) = H(X,Y) - H(Y)
HxCy = Hxy-Hy;
fprintf("\n\nInformation Loss, H(X|Y) = " + HxCy + " bits/symbol");

% H(Y|X) = H(X,Y) - H(X)
HyCx = Hxy - Hx;
fprintf("\n\nH(Y|X) = " + HyCx + " bits/symbol");

% I(X,Y) = H(X) - H(X|Y)
Ixy=Hx-HxCy;
fprintf("\n\nMutual Information, I(X,Y) = " + Ixy + " bits");

% Transmitted Information = H(X) - H(X|Y)
TransInfo = Hx - HxCy;
fprintf("\n\nTransmitted Information = " + TransInfo + " bits/symbol");

% Average rate of Information transmitted across the channel is = [H(X) - H(X|Y)] * r
r = 30;
Dt = 30*TransInfo;
fprintf("\n\nIf symbols rate is 30 symbols/sec, then average rate of Information transmitted across the channel is : " + Dt + " bits/sec");