function H = deterH(cornersSrc, cornersDest)
%DETERH Détermine la transformation H
%   H est la transformation qui pour chaque coordonée dans l'image source
%   donne sa coordonée dans l'image destination ; en particulier :
%
%       A1, B1, C1, D1 = cornersSrc
%       A2, B2, C2, D2 = cornersDest
%
%       A2 = H x A1
%       B2 = H x B1
%       C2 = H x C1
%       D2 = H x D1
    
    n = size(cornersSrc, 2);
    if size(cornersDest, 2) ~= n
        error('Pas le même nombre de points !');
    end

    A = zeros(2*n, 8);
    B = reshape(cornersDest, 2*n, 1);
    
    for k = 0:n-1
        P = cornersSrc(:, k+1);
        P_ = cornersDest(:, k+1);
        x1 = P(1);
        y1 = P(2);
        x2 = P_(1);
        y2 = P_(2);
        
        A(2*k+1, :) = [ x1, y1, 1,  0,  0, 0, -x1*x2, -y1*x2 ];
        A(2*k+2, :) = [  0,  0, 0, x1, y1, 1, -x1*y2, -y1*y2 ];
    end
    
    X = A \ B;
    %H = reshape([ X ; 1 ], 3, 3);
    H = zeros(3, 3);
    H(1, 1) = X(1);
    H(1, 2) = X(2);
    H(1, 3) = X(3);
    H(2, 1) = X(4);
    H(2, 2) = X(5);
    H(2, 3) = X(6);
    H(3, 1) = X(7);
    H(3, 2) = X(8);
    H(3, 3) = 1;

end

