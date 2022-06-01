% Gudi Varaprasad
% 19BCE7048

% LAB- L31 + L32
% Lab8 - Cyclic coding and decoding
% 04/05/2022

% Write a MATLAB program for Cyclic Coding.

clc;
clear all;
close all;

n = input('Enter the length of codeword : ');
k = input('Enter the length of the message : ');
p = input('Enter the Parity Matrix : ');
G = [eye(k) p];
m = input('Enter the message word');

cyclicPolynomial = cyclpoly(n,k,'max');
disp(cyclicPolynomial);

polynomialToSym = poly2sym(cyclicPolynomial);
disp(polynomialToSym);

encodedMsg = encode(m,n,k,'cyclic',cyclicPolynomial);
disp('Encoded Message : ')
disp(encodedMsg)
% fprintf("\nEncoded Message - " + encodedMsg);

decodedMsg = decode(encodedMsg,n,k,'cyclic',cyclicPolynomial);
disp('Decoded Message : ')
disp(decodedMsg)
% fprintf("\nDecoded Message - " + decodedMsg);