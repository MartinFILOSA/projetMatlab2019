function img = replaceContent(corners4, destFrame, srcContent, handNonReplacementMask, additionalMask)
%REPLACECONTENT Remplace le contenu du quadrilatère A2 B2 C2 D2
%   Le quadrilatère de destination est délimité par les angles `corner4`
%   qui sont des coordonées dans destFrame.
%
%   Calcule de la transformation pour aller vers ce quadrilatère.
%   Pour chaque pixel de destFrame, on calcule des coordonées.
%   Si ces coordonées corespondes à un pixel dans l'image à intégrer
%   srcContent, on prend ce pixel.
%
%   `nonReplacementMask` permet de définire un mask des pixels à ne pas
%   remplacer. S'il vaut 'false', il n'est pas utilisé.
%
%   `additionalMask` est un mask additionnel valant 0 partout où on ne veut
%   pas effectuer les calculs.

    % déterminer l'homographie
    [ w, h ] = size(srcContent);
    A1 = [ 1 1 ];
    B1 = [ 1 w ];
    C1 = [ h w ];
    D1 = [ h 1 ];
    M = [ A1' B1' C1' D1' ];
    H = deterH(M, corners4);
    %H_1 = inv(H);
    
    %img = destFrame;
    %[ w_, h_, ~ ] = size(destFrame);
    
    minX = floor(min(corners4(1,:)));
    maxX = ceil(max(corners4(1,:)));
    minY = floor(min(corners4(2,:)));
    maxY = ceil(max(corners4(2,:)));
    
    [ X, Y ] = meshgrid(minX:maxX, minY:maxY);
    X = X(:);
    Y = Y(:);
    
    IJs = H \ [ X Y ones((maxX-minX+1)*(maxY-minY+1), 1) ]';
    X = X';
    Y = Y';
    
    s = IJs(3, :);
    I = round(IJs(1, :) ./ s);
    J = round(IJs(2, :) ./ s);
    
    isInContent = (1 <= I & I <= w) & (1 <= J & J <= w);
    ok = isInContent;
    
    I = I(ok);
    J = J(ok);
    X = X(ok);
    Y = Y(ok);
    
    idx = linearIndices(size(srcContent), I, J); % dans source
    idx_ = linearIndices(size(destFrame), X, Y); % dans destination
    
    isOnHand = ismember(idx_, find(handNonReplacementMask)); % indicesNop
    isInRect = (w * 1/8 < I & I <= w * 2/3) & (h * 3/4 < J & J <= h * 1);
    
    okk = ~isInRect | ~isOnHand;
    
    idx = idx(okk);
    idx_ = idx_(okk);
    
%     indicesYup = find(additionalMask);
%     okkk = ismember(idx_, indicesYup);
%     
%     idx = idx(okkk);
%     idx_ = idx_(okkk);
    
    R_ = destFrame(:, :, 1);
    G_ = destFrame(:, :, 2);
    B_ = destFrame(:, :, 3);
    R = srcContent(:, :);
    G = srcContent(:, :);
    B = srcContent(:, :);
    
    R_(idx_) = R(idx);
    G_(idx_) = G(idx);
    B_(idx_) = B(idx);
    img = cat(3, R_, G_, B_);

end

