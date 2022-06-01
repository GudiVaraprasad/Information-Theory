% Gudi Varaprasad
% 19BCE7048

% LAB- L31 + L32
% Lab5 - Arithmetic Decoding
% 06/04/2022

% Write a program for Arithmetic Decoding and find the tag for "0.63725".
% Given Probabilities - P(A) = 0.5, P(B) = 0.3, P(C) = 0.2.

clc;
clear all;
close all;
str = 'BACBA';
len = length(str);
u = unique(str);
len_unique = length(u);
for i = 1 : len_unique
    p(i)=input('prob ');
    if(p(i)==0)
        break;
    end
end
display(p);
x = cumsum(p);
newx = [0 x];
display(x);
display(newx);
for i = 1 : len_unique
interval(i, 1) = newx(i);
interval(i, 2) = x(i);
end
low = 0;
high = 1;
for i = 1 : len
for j = 1 : len_unique
	if str(i) == u(j);
		pos = j;
		j = j + 1;
		%display(pos);
		range = high - low;
		high = low + (range .* interval(pos, 2));
		low = low + (range .* interval(pos, 1));
		i = i + 1;
		break
	end
end
end
tag = (low+high)/2;
display(tag);

str = '';
for i = 1 : len
for j = 1 : len_unique
	if tag > interval(j, 1) && tag < interval(j, 2)
		pos = j;
		tag = (tag - interval(pos, 1)) / p(j);
		% Geeting the matched tag
		% value character
		decoded_str = u(pos);
		% String concatenating
		% 'decoded_str' into 'str'
		str = strcat(str, decoded_str);
		break
	end
end
end
disp(str)