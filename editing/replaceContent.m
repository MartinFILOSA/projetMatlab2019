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
    H_1 = inv(H);
    
    % une grande partie de l'image retrounée reste inchangée
    img = destFrame;
    
    % on détermine la zone dans laquelle on devra remplacer des pixels
    minX = floor(min(corners4(1,:)));
    maxX = ceil(max(corners4(1,:)));
    minY = floor(min(corners4(2,:)));
    maxY = ceil(max(corners4(2,:)));
    for j_ = minY:maxY
        for i_ = minX:maxX
            if additionalMask(i_, j_)
                % calcule les coordonées corespondantes dans la source
                IJs = H_1 * [ i_ j_ 1 ]';

                s = IJs(3);
                i = IJs(1) / s;
                j = IJs(2) / s;

                isInContent = (1 <= i && i <= w) && (1 <= j && j <= h);

                % si les coordonées calculées sont dans la zone authorisée
                if isInContent
                    isOnHand = handNonReplacementMask(i_, j_);
                    isInRect = (w * 1/4 < i && i <= w * 2/3) && (h * 3/4 < j && j <= h * 1);

                    % si on est hors du rectange de la main ou que le
                    % masque vaut FAUX
                    if ~isInRect || ~isOnHand
                        img(i_, j_, :) = srcContent(round(i), round(j), :);
                    end
                end % isInContent
            end % additionalMask
        end % for
        %fprintf('%f%%\n', (j_-minY) / (maxY-minY) * 100);
    end % for

end

