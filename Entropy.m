% Gudi Varaprasad
% 19BCE7048

% LAB- L31 + L32
% Lab1 - Entropy & Information
% 23/03/2022

clc;
clear all;
close all;

% Consider the Symbols S = {A, B, C, D, E, F} having probability P = {0.5,
% 0.25, 0.125, 0.05, 0.05, 0.025}. Determine Entropy of Source.

n = input("Enter no. of symbols : "); % 6
p = input("Enter probabilities : "); % [0.5 0.25 0.125 0.05 0.05 0.025]

H = 0;
I = 0;
for i=1:n
    H = H + (-p(i) * log2(p(i)));
    I = I + (-log2(p(i)));
end
fprintf("\nInformation of Source : " + I + " bits");
fprintf("\nEntropy of Source : " + H + " bits/symbol");
fprintf("\nIf symbols rate is 30 symbols/sec, then Rate of Information transmitted is : " + 30*H + " bits/sec");

% Also Determine amount of information contained in the message ABABBA.
msg = "ABABBA";
len = strlength(msg);
p = [0.5 0.25 0.5 0.25 0.25 0.5];

Imsg = 0;
for i=1:len
    Imsg = Imsg + (-log2(p(i)));
end
fprintf("\n\nInformation contained in the message : "+ msg + " is = " + Imsg + " bits");