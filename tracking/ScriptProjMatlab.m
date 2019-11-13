clear all;
close all;

v2=VideoReader('vid_in2.mp4');
n = v2.NumberOfFrames;

for i=1:n 
    
    image = read(v2, i);
    H1 = detecteurHarris(image, 2.1, 3.1);
    H2 = detecteurHarris(image, 2.1, 5.1);

    Coins = H1.*abs(H2); 
    
    
    if i==1
        imshow(image);
        [x,y] = ginput(4);
        x1=round(x);
        y1=round(y);
        x2=x1;
        y2=y1;
    end
    
    
    xPredit = round(x2 + (x2-x1)/2);
    yPredit = round(y2 + (y2-y1)/2);
    x1=x2;
    y1=y2;
    [x2, y2] = coordPointsMax(Coins, xPredit, yPredit, 18);
    
    
    F = relierPoints(y1, x1, i);
    imshow(image);
    C(2*i-1,:)=x2;
    C(2*i,:)=y2;  
    
    clear plot;
end

V=VideoWriter('result.avi');
open('result.avi');
writeVideo('result.avi',F);
save('result.mat',C);
