clc, clear, close all;


resultFileName = 'sortie/test3';
doReplaceContent = 0;
doIntegrateShape = 1;

load('tracking/result6.mat');
points = C;

v = VideoWriter(resultFileName);
v2 = VideoReader('video.mp4');

userpath(strcat(pwd, '\editing'));

open(v);

nbFrame = size(C, 1) / 2; %n = v2.NumberOfFrames;
for k = 1:nbFrame
    Ys = points(2*k-1, :);
    Xs = points(2*k, :);
    
    A = [ Xs(1) Ys(1) ];
    B = [ Xs(2) Ys(2) ];
    C = [ Xs(3) Ys(3) ];
    D = [ Xs(4) Ys(4) ];
    E = [ Xs(5) Ys(5) ];
    F = [ Xs(6) Ys(6) ];
    
    corners4 = [ A' B' C' D' ];
    corners6 = [ A' B' C' D' E' F' ];
    
    frame = read(v2, k);
    
    if doReplaceContent
        content = getContent(k);
        mask = findHandMask(frame);

        frame = replaceContent(M, frame, content, mask, ones(size(mask)));
    end
    
    if doIntegrateShape
        shape = getShape(k);

        frame = integrateShape(corners6, frame, shape);
    end
    
    writeVideo(v, frame);
    fprintf('Frame %d sur %d (%f%%)\n', k, nbFrame, k/nbFrame*100);
end

close(v);
%open(strcat(resultFileName, '.avi'));
