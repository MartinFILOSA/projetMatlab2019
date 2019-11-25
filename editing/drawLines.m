function img = drawLines(frame, Xs, Ys, r, g, b, a)
%DRAWLINES Summary of this function goes here
%   Detailed explanation goes here

    R = frame(:, :, 1);
    G = frame(:, :, 2);
    B = frame(:, :, 3);
    a = a / 255;
    
    nLignes = size(Xs, 2) - 1;
    
    for k = 1:nLignes
        ax = Xs(k);
        ay = Ys(k);
        bx = Xs(k+1);
        by = Ys(k+1);

        dx = bx - ax;
        dy = by - ay;
        mag = abs(dx) + abs(dy); %sqrt(dx * dx + dy * dy);

        ux = dx / mag;
        uy = dy / mag;

        nPoints = round(mag);

        beta = ((1:nPoints)-1) * mag / nPoints;
        px = ax + ux * beta;
        py = ay + uy * beta;

        i1 = linearIndices(size(B), round(px), round(py));
        i2 = linearIndices(size(B), round(px-uy), round(py+ux));
        i3 = linearIndices(size(B), round(px+uy), round(py-ux));

        I = cat(2, i1, i2, i3);

        R(I) = R(I) * a + r * (1-a);
        G(I) = G(I) * a + g * (1-a);
        B(I) = B(I) * a + b * (1-a);
    end
    
    img = cat(3, R, G, B);

end

