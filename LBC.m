% Gudi Varaprasad
% 19BCE7048

% LAB- L31 + L32
% Lab6 - Linear Block Coding
% 27/04/2022

clc;
clear all;
close all;

% Transmitter end

n = input("Enter total no. of bits in codeword : "); % 6
k = input("Enter no. of Information Bits : "); % 4
id = eye(k);
p = n - k;
fprintf("\nNo. of Parity bits = " + p +"\n");

temp = [ones(1,k-1) zeros(k-length(ones(1,k-1)))];
parityMatrix = [temp;];

% Parity bits calculation
for i = 1:n-k-1
    temp1=temp(k);
    for j=k:-1:2
        temp(j)=temp(j-1);
    end
    temp(1)=temp1;
    parityMatrix=[parityMatrix;temp];
end

parityMatrix=parityMatrix';
disp('Parity Matrix :')
disp(parityMatrix)

generatorMatrix=[parityMatrix id];
disp('Generator Matrix :')
disp(generatorMatrix)

data = 0:power(2,k) - 1;
data = dec2bin(data) - 48;

% Channel code = Dataword * Generator Matrix
codewords=[];
for i = 1:length(data)
    codewords = [codewords;mod(data(i,:)*generatorMatrix,2)];
end

disp('Transmitted Codewords are :')
disp(codewords)