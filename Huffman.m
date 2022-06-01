
% Gudi Varaprasad
% 19BCE7048

% LAB- L31 + L32
% Lab3 - Huffman Coding
% 30/03/2022

clc;
clear all;
close all;

% Apply Huffman Coding for given Symbols S = {S1, S2, S3, S4, S5} having
% probabilities {0.1, 0.2, 0.4, 0.2, 0.1} respectively.

myProb=input('Enter the probabilities:'); % [0.1 0.2 0.4 0.2 0.1]
p = sort(myProb, 'descend')
n = length(p);
symbols = [1:n];

[dict , avglen]=huffmandict(symbols,p);
temp = dict;
t = dict(:,2);
for i = 1:length(temp)
    temp{i,2}=num2str(temp{i,2});
end
disp('Huffman Coding - Codeword Table : ');
disp(temp);

H=0;
Z=0;
for k = 1:n
    H = H + ( p(k) * log2(1/p(k) ) ); 
 end
fprintf(1, "\n\nEntropy, H(X) = " + H + " bits/symbol");

fprintf("\n\nAverage Length = " + avglen);

N = H/avglen;
fprintf("\n\nEfficiency = " + N*100 + "%%");

Red = 1-N;
fprintf("\n\nRedundancy = " + Red*100 + "%%");

% codevar = 0;
% for k = 1:n
%    codevar = codevar + (p(k) * ((l(k) - avglen)).^2); 
% end
% 
% fprintf("\n\nCode Variance = " + codevar);