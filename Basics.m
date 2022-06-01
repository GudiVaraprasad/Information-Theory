% Gudi Varaprasad
% 19BCE7048

% LAB- L31 + L32
% Lab0 - Basics of MATLAB
% 09/03/2022

clc;
clear all;
close all;

% Q.1.Create a 3x4 matrix for the following :
% 1. random matrix 
rand(3,4)

% 2. zero matrix 
zeros(3,4)

% 3. ones matrix 
ones(3,4)

% 4. identity matrix
eye(3,4)

%------------------------------------------------------------------------%

% Q.2.Write a command to delete 3rd row and 5th column of 6x6 matrix. 

mymatrix = magic(6)
mymatrix(3,:) = []
mymatrix(:,5) = []

%------------------------------------------------------------------------%

% Q.3.Given the coordinates (x,y) of the centre of a circle and its radius, 
% write a program which will determine a point lies inside the circle, 
% on the circle or outside the circle.

x=2;
y=3;
a=-1;
b=2;
r=6;
if (x-a)^2+(y-a)^2 > r^2
    fprintf("Outside")
elseif (x-a)^2+(y-a)^2 < r^2
    fprintf("Inside")
else
    fprintf("On the circle")
end

%------------------------------------------------------------------------%

% Q.4.Generate and Display a sequence of 10 numbers
1:10

% Q.5.Display a sequene of 20 numbers with an interval of 2
1:2:40

% Q.6.Generate and Display a sequence of squares of first 20 numbers
myseq = 1:20
sqSeq = (myseq).^2

% Q.7.Write a program to arrange the given sequence in descending order
myseq = [5, 1 ,2, 3, 4]
DOseq = sort(myseq, 'descend')

%------------------------------------------------------------------------%