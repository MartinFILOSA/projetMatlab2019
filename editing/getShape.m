function polylines = getShape(frameN)
%GETSHAPE Retourne la structure 3D à intégrer en frame N
%   La structure retournée est un ensemble de suite de points

    w = 7;
    h = 5;
    r = 3;

    polylines = {
        [ % le sol
            [ 0 0 0 ]
            [ w 0 0 ]
            [ w w 0 ]
            [ 0 w 0 ]
            [ 0 0 0 ]
        ]'
        [ % le plafond
            [ 0 0 h ]
            [ w 0 h ]
            [ w w h ]
            [ 0 w h ]
            [ 0 0 h ]
        ]' ;
    };

end

