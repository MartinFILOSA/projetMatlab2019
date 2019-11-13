function maskedRGBImage = filterPaper(image)
    I = image;
    
    % Define thresholds for 'Hue'. Modify these values to filter out different range of colors.

    channel1Min = 61/255;
    channel1Max = 169/255;
    % Define thresholds for 'Saturation'
    channel2Min = 83/255;
    channel2Max = 175/255;
    % Define thresholds for 'Value'
    channel3Min = 100/255;
    channel3Max = 195/255;
    % Create mask based on chosen histogram thresholds
    BW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
        (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
        (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
    % Initialize output masked image based on input image.
    maskedRGBImage = ones(size(image));
    % Set background pixels where BW is false to zero.
    maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
