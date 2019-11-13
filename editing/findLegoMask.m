function mask = findLegoMask(corners6, width, height, legoQuads)
%FINDLEGOMASK Summary of this function goes here
%   Detailed explanation goes here

    A = [ 0      0      0 ];
    B = [ 29.7   0      0 ];
    C = [ 29.7   21     0 ];
    D = [ 0      21     0 ];
    E = [ 29.7/2 21/2   0.96*3 ];
    F = [ 29.7/8 21*7/8 0.96*2 ];
    cornerPoints = [ A' B' C' D' E' F' ];
    P = deterP(cornerPoints, corners6);
    
    mask = zeros(width, height);
    
    for n = 1:size(legoQuads)
        points = legoQuads{n};
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
        
        A = pixelCoords(:, 1);
        B = pixelCoords(:, 2);
        C = pixelCoords(:, 3);
        D = pixelCoords(:, 4);
        M = [ A B C D ];
        mask = mask | findReplacementMask(M, width, height);
    end

end

