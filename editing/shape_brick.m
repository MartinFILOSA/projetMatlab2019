function S = shape_brick(x, y, z, w, h, s)
%SHAPE_BRICK Summary of this function goes here
%   Detailed explanation goes here

%     front = shape_rect(w/8, h*7/8, 0,  8, 0, 1.92);
%     left  = shape_rect(w/8, h/2, 0,    0, 8, 1.92);
%     back  = shape_rect(w/8, h/2, 0,    8, 0, 1.92);
%     right = shape_rect(w/8+8, h/2, 0,  0, 8, 1.92);
    
    right  = shape_rect(x  , y  , z  , 0, h, s);
    back   = shape_rect(x  , y  , z  , w, 0, s);
    bottom = shape_rect(x  , y  , z  , w, h, 0);
    
    left   = shape_rect(x+w, y  , z  , 0, h, s);
    front  = shape_rect(x  , y+h, z  , w, 0, s);
    top    = shape_rect(x  , y  , z+s, w, h, 0);
    
    S = shape_cat(right, back, bottom, left, front, top);
%     S = {
%         front{:}
%         left{:}
%         top{:}
%         
%         right{:}
%         back{:}
%         bottom{:}
%     };

end

