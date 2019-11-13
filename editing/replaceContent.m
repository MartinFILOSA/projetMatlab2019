function img = replaceContent(corners4, destFrame, srcContent, handNonReplacementMask, additionalMask)
%REPLACECONTENT Remplace le contenu du quadrilat�re A2 B2 C2 D2
%   Le quadrilat�re de destination est d�limit� par les angles `corner4`
%   qui sont des coordon�es dans destFrame.
%
%   Calcule de la transformation pour aller vers ce quadrilat�re.
%   Pour chaque pixel de destFrame, on calcule des coordon�es.
%   Si ces coordon�es corespondes � un pixel dans l'image � int�grer
%   srcContent, on prend ce pixel.
%
%   `nonReplacementMask` permet de d�finire un mask des pixels � ne pas
%   remplacer. S'il vaut 'false', il n'est pas utilis�.
%
%   `additionalMask` est un mask additionnel valant 0 partout o� on ne veut
%   pas effectuer les calculs.

    % d�terminer l'homographie
    [ w, h ] = size(srcContent);
    A1 = [ 1 1 ];
    B1 = [ 1 w ];
    C1 = [ h w ];
    D1 = [ h 1 ];
    M = [ A1' B1' C1' D1' ];
    H = deterH(M, corners4);
    H_1 = inv(H);
    
    % une grande partie de l'image retroun�e reste inchang�e
    img = destFrame;
    
    % on d�termine la zone dans laquelle on devra remplacer des pixels
    minX = floor(min(corners4(1,:)));
    maxX = ceil(max(corners4(1,:)));
    minY = floor(min(corners4(2,:)));
    maxY = ceil(max(corners4(2,:)));
    for j_ = minY:maxY
        for i_ = minX:maxX
            if additionalMask(i_, j_)
                % calcule les coordon�es corespondantes dans la source
                IJs = H_1 * [ i_ j_ 1 ]';

                s = IJs(3);
                i = IJs(1) / s;
                j = IJs(2) / s;

                isInContent = (1 <= i && i <= w) && (1 <= j && j <= h);

                % si les coordon�es calcul�es sont dans la zone authoris�e
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

