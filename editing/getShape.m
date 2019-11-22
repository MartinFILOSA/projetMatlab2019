function polylines = getShape(frameN)
%GETSHAPE Retourne la structure 3D à intégrer en frame N
%   La structure retournée est un ensemble de suite de points

    w = 8;
    h = 2;
    r = 1.5;
    
    px = 20;
    py = 20;
    sz = 3;
    theta = .02;

    polylines = {
        [ % sol
            [ 0 0 0 ]
            [ w 0 0 ]
            [ w w 0 ]
            [ 0 w 0 ]
            [ 0 0 0 ]
        ]'
        [ % plafond
            [ 0 0 h ]
            [ w 0 h ]
            [ w w h ]
            [ 0 w h ]
            [ 0 0 h ]
        ]'
        % verticales
        [ [ 0 0 0 ] ; [ 0 0 h ] ]'
        [ [ w 0 0 ] ; [ w 0 h ] ]'
        [ [ w w 0 ] ; [ w w h ] ]'
        [ [ 0 w 0 ] ; [ 0 w h ] ]'
        % toit
        [ % avant
            [ 0   0 h   ]
            [ w/2 0 h+r ]
            [ w   0 h   ]
        ]'
        [ % arrière
            [ 0   w h   ]
            [ w/2 w h+r ]
            [ w   w h   ]
        ]'
        [ [ w/2 0 h+r ] ; [ w/2 w h+r ] ]'
        
        % jsp
        [ [ px py 0 ] ; [ px+sz*cos(theta*frameN) py+sz*sin(theta*frameN) 0 ] ]'
        [ [ px py 0 ] ; [ px py sz/4 ] ]'
    };

end

