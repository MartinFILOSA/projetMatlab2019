function P = deterP(cornerPoints, cornerPixel)
%DETERP Détermine la matrice de passage P
%   cornerPoints : coordonées en 3D
%   cornerPixel : coordonnées en 2D coorespondante dans l'image
    
    n = size(cornerPoints, 2);
    if size(cornerPixel, 2) ~= n
        error('Pas le même nombre de points !');
    end

    A = zeros(2*n, 11);
    B = reshape(cornerPixel, 2*n, 1);
    
    for k = 0:n-1
        P = cornerPoints(:, k+1);
        P_ = cornerPixel(:, k+1);
        x1 = P(1);
        y1 = P(2);
        z1 = P(3);
        x2 = P_(1);
        y2 = P_(2);
        
        A(2*k+1, :) = [ x1, y1, z1, 1,  0,  0,  0, 0, -x1*x2, -y1*x2, -z1*x2 ];
        A(2*k+2, :) = [  0,  0,  0, 0, x1, y1, z1, 1, -x1*y2, -y1*y2, -z1*y2 ];
    end
    
    X = A \ B;
    
    P = zeros(3, 4);
    P(1, 1) = X(1);
    P(1, 2) = X(2);
    P(1, 3) = X(3);
    P(1, 4) = X(4);
    P(2, 1) = X(5);
    P(2, 2) = X(6);
    P(2, 3) = X(7);
    P(2, 4) = X(8);
    P(3, 1) = X(9);
    P(3, 2) = X(10);
    P(3, 3) = X(11);
    P(3, 4) = 1;

end

