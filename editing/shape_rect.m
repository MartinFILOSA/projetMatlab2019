function S = shape_rect(x, y, z, w, h, s)
%SHAPE_RECT Summary of this function goes here
%   Detailed explanation goes here

    if w == 0
        S = {
            [
                [ x y   z   ]
                [ x y+h z   ]
                [ x y+h z+s ]
                [ x y   z+s ]
            ]'
        };
        return
    end
    if h == 0
        S = {
            [
                [ x   y z   ]
                [ x   y z+s ]
                [ x+w y z+s ]
                [ x+w y z   ]
            ]'
        };
        return
    end
    if s == 0
        S = {
            [
                [ x   y   z ]
                [ x   y+h z ]
                [ x+w y+h z ]
                [ x+w y   z ]
            ]'
        };
        return
    end

end

