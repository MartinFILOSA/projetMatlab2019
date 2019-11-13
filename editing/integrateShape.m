function img = integrateShape(corners6, frame, polylines)
%INTEGRESHAPE Summary of this function goes here
%   points définit une liste de points à relier 2 par 2 pour former
%   l'image 3D.
%   corners6 est la liste des les coodonées des 6 points dans l'image.
    
    % points en 3D associé à chaque corner dans le repère 3D de la feuille
    A = [ 0      0      0 ];
    B = [ 29.7   0      0 ];
    C = [ 29.7   21     0 ];
    D = [ 0      21     0 ];
    E = [ 29.7/2 21/2   0.96*3 ];
    F = [ 29.7/8 21*7/8 0.96*2 ];
    cornerPoints = [ A' B' C' D' E' F' ];
    P = deterP(cornerPoints, corners6);

    %%imshow(frame);
    img = frame;
    
    for n = 1:size(polylines)
        points = polylines{n};
        nbPoints = size(points, 2);

        pixelCoords = zeros(2, nbPoints);
        for k = 1:nbPoints
            % points de coordonnées (x, y, z) en 3D
            point = points(:, k);
            x = point(1);
            y = point(2);
            z = point(3);

            % passé en 2D dans l'image
            res = P * [ x y z 1 ]';
            s = res(3);
            i = res(1) / s;
            j = res(2) / s;

            % ses coodonnées dans la frame
            pixelCoords(:, k) = [ i j ];
        end
        
        %%line(pixelCoords(2, :), pixelCoords(1, :));
        img = drawLines(img, pixelCoords(1, :), pixelCoords(2, :), 0, 0, 255, 0);
    end
    
    % TODO: sans utiliser getframe
    % récupère l'image depuis le résultat affiché
    %%F = getframe;
    %%img = frame2im(F);

end

