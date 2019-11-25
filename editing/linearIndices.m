function ndx = linearIndices(siz, v1, v2)
%LINEARINDICES Summary of this function goes here
%   Detailed explanation goes here

    ndx = double(v1) + (double(v2) - 1).*siz(1);

end

