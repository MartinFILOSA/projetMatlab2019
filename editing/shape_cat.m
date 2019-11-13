function S = shape_cat(varargin)
%SHAPE_CAT Summary of this function goes here
%   Detailed explanation goes here
    
    S = {};
    c = 1;
    
    for k = 1:nargin
        shape = varargin{k};
        for j = 1:size(shape, 1)
            S{c} = shape{j};
            c = c+1;
        end
    end
    
    S = S';

end

