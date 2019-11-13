function mask = findHandMask(frame)
%FINDHANDMASK Summary of this function goes here
%   Detailed explanation goes here

    YCbCr = rgb2ycbcr(frame);
    Cr = YCbCr(:, :, 3);
    
    mask = double(Cr > 123);

end

