function mask = findReplacementMask(corners, width, height)
%FINDREPLACEMENTMASK Summary of this function goes here
%   Le mask retourner vaux 1 l� o� un appel � la fonction `replaceContent`
%   avec le m�me param�te `corners` agirait.

    mask = replaceContent(corners, zeros(width, height, 3), ones(2), zeros(width, height), ones(width, height));

end

