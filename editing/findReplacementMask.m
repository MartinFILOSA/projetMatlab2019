function mask = findReplacementMask(corners, width, height)
%FINDREPLACEMENTMASK Summary of this function goes here
%   Le mask retourner vaux 1 là où un appel à la fonction `replaceContent`
%   avec le même paramète `corners` agirait.

    mask = replaceContent(corners, zeros(width, height, 3), ones(2), zeros(width, height), ones(width, height));

end

