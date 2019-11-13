function [ res ] = filtreGauss2D(sigma)

[x,y] = meshgrid(-ceil(3*sigma):ceil(3*sigma));

res = 1/(2*pi*(sigma.^2)).*exp(-(x.^2+y.^2)/(2*(sigma.^2)));

end

