% Gudi Varaprasad
% 19BCE7048

% LAB- L31 + L32
% Lab7 - Syndrome Decoding
% 04/05/2022

% Write a MATLAB program for Syndrome Decoding.

clc;
clear all;
close all;

k = input('Enter Information Bits = '); % 3

n = input('Enter Dimension of block code = '); % 6

parityMatrix = input('Enter Parity Matrix : '); % [1 0 1; 0 1 1; 1 1 1]
GenMatrix = [eye(k) parityMatrix];

message = input('Enter The Message = '); % [1 1 0 1 0]
CodeWord = encode(message, n, k,'linear', GenMatrix);

H = [parityMatrix' eye(n - k )];
lookupTable = syndtable(H);

RecievedCode = input('Enter The Recived Code Word : '); % [1 1 0 1 0 1]
SyndromeBinary = rem(RecievedCode*H',2);
SyndromeDecimal = bi2de(SyndromeBinary,'left-msb');

if(SyndromeDecimal == 0)
 disp('Valid Codeword')
else
 disp('Invalid Codeword')
 ErrorPattern = lookupTable(SyndromeDecimal+1,:)
 CC = rem(RecievedCode + ErrorPattern, 2);
end

D = decode(CodeWord, n, k, 'linear', GenMatrix)