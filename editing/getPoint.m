function P = getPoint()
%GETPOINT Demande un point � l'utilisateur
%   Les coordon�es retourn� sont invers�es par rapport � la fonction ginput
%   de matlab de fa�on � avoir x a l'horizontal et y � la verticale.
%   (Non, le rep�re n'est pas directe.)

    [ y, x ] = ginput(1);
    P = [ x y ];

end

