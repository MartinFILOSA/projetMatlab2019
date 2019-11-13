clc, clear, close all;


frame = imread('./tst/Capture2.PNG');
%figure, imshow(frame);
A = [6.189883720930233e+02 5.981976744186047e+02];%getPoint();
B = [2.409883720930234e+02 1.164569767441861e+03];%getPoint();
C = [4.255930232558139e+02 1.523732558139535e+03];%getPoint();
D = [9.065697674418606e+02 8.694534883720931e+02];%getPoint();
E = [4.783372093023256e+02 1.021406976744186e+03];%getPoint();
F = [7.709418604651162e+02 9.021046511627907e+02];%getPoint();
corners6 = [ A' B' C' D' E' F' ];

shape = getShape(1);

result = integrateShape(corners6, frame, shape);

figure, imshow(result);
