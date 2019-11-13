clc, clear, close all;


frame = imread('./tst/Capture1.PNG');
%figure, imshow(frame);
A2 = [457.250000000000 635.750000000000];%getPoint();
B2 = [1.797500000000003e+02 1.237250000000000e+03];%getPoint();
C2 = [4.182500000000002e+02 1.481750000000000e+03];%getPoint();
D2 = [7.692500000000001e+02 7.482500000000001e+02];%getPoint();
M2 = [ A2' B2' C2' D2' ];

content = getContent(1);
mask = findHandMask(frame);

result = replaceContent(M2, frame, content, mask, ones(size(mask))) ;

figure, imshow(result);
