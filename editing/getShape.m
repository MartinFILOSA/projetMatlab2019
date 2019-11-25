function polylines = getShape(frameN)
%GETSHAPE Retourne la structure 3D à intégrer en frame N
%   La structure retournée est un ensemble de suite de points

    w = 7;
    h = 5;
    r = 1.5;
    
    px = 20;
    py = 20;
    sz = 3;
    theta = .02;
    %Waterre1
    x1 = (1:200) * 29.7 /2000 + frameN * (29.7/(326 + 10));
    y1 = 21/2 .* ones(1,200) + 0.7 .* cos(pi * frameN / 5 * ones(1,200) + pi / 70 * (1:200));
    z1 = 0 * ones(1,200);
    waterre1 = [ x1 ; y1 ; z1 ];
    
%     x2 = (1:200) * 29.7/2 /200;
%     y2 = (21/2 - 2) .* ones(1,200);
%     z2 = 1 .* cos(pi * frameN / 5 * ones(1,200) + pi/2 + pi / 14 * (1:200));
%     waterre2 = [ x2 ; y2 ; z2 ];
    
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
        
        waterre1;
%         waterre2;
    };

end

