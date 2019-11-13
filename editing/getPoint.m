function P = getPoint()
%GETPOINT Demande un point à l'utilisateur
%   Les coordonées retourné sont inversées par rapport à la fonction ginput
%   de matlab de façon à avoir x a l'horizontal et y à la verticale.
%   (Non, le repère n'est pas directe.)

    [ y, x ] = ginput(1);
    P = [ x y ];

end

