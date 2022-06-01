% Gudi Varaprasad
% 19BCE7048

% LAB- L31 + L32
% Lab9 - Convolution Code
% 18/05/2022

clc
clear all
currentMsgBit = input('Enter Current Message Bit : '); % [1 1 0 1];
m1 = 0;
m2 = 0;

x = [];
for k = 1:length(currentMsgBit);
    fprintf('For Shift - %d : \n',k);
    m = currentMsgBit(k);

    fprintf('m = %d \nm1 = %d \nm2 = %d \n',m,m1,m2);
    temp = bitxor(m,m1);
    x1 = bitxor(temp,m2);
    x2 = bitxor(m,m2);
    
    fprintf('x1 = %d \nx2 = %d \n',x1,x2);
    x(length(x) + 1) = x1;
    x(length(x) + 1) = x2;
    m2 = m1;
    m1 = m;
    disp(' ');
end

disp('Output :');
disp(x);