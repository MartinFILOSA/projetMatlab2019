clc, clear, close all;


load('tracking/result.mat');
points = C;

v = VideoWriter('sortie/test2');
v2 = VideoReader('video.mp4');

userpath(strcat(pwd, '\editing'));

open(v);

nbFrame = size(C, 1) / 2; %n = v2.NumberOfFrames;
for k = 1:nbFrame
    Ys = points(2*k-1, :);
    Xs = points(2*k, :);
    
    A = [ Xs(1) Ys(1) ];
    B = [ Xs(2) Ys(2) ];
    D = [ Xs(3) Ys(3) ];
    C = [ Xs(4) Ys(4) ];
    
    M = [ A' B' C' D' ];
    
    frame = read(v2, k);
    
    content = getContent(1);
    mask = findHandMask(frame);

    result = replaceContent(M, frame, content, mask, ones(size(mask))) ;
    
    writeVideo(v, result);
    fprintf('%f%%\n', k / nbFrame * 100);
end

close(v);
