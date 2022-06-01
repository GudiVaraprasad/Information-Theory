% Gudi Varaprasad
% 19BCE7048

% LAB- L31 + L32
% Lab4 - Arithmetic Encoding
% 06/04/2022

% Write a program for Arithmetic Encoding and find the tag value for the 
% string "BACBA". Given Probabilities - P(A) = 0.5, P(B) = 0.3, P(C) = 0.2.


% givenTag = input(prompt);
givenTag = 'BACBA';
fprintf("\nGiven Tag to encode is - " + givenTag);

tagLen = length(givenTag);
fprintf("\nLength of Tag = " + tagLen + "\n\n");

uniqChar = unique(givenTag);
uniqCharLen = length(uniqChar);

givenProb = input("Enter probabilities : "); % [0.5 0.3 0.2]

for i = 1 : uniqCharLen
    z(i) = length(strfind(givenTag, uniqChar(i)));
    p(i) = z(i) / tagLen;
end

temp1 = cumsum(givenProb);
temp2 = [0 temp1];

for i = 1 : uniqCharLen
    AE_Table(i, 1) = temp2(i);
    AE_Table(i, 2) = temp1(i);
end

disp('Arithmetic Encoding Table : ');
disp(AE_Table);

low = 0;
high = 1;
for i = 1 : tagLen
    for j = 1 : uniqCharLen
	    if givenTag(i) == uniqChar(j);
		    pos = j;
		    j = j + 1;
		    range = high - low;
		    high = low + (range .* AE_Table(pos, 2));
		    low = low + (range .* AE_Table(pos, 1));
		    i = i + 1;
		    break
	    end
    end
end

tagValue = (low + high) / 2;
fprintf("\nTag value is = " + tagValue); % 0.63725
