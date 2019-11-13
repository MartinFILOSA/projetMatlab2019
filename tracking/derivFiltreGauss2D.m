function [G]=derivFiltreGauss2D(sigma)

    [x,y] = meshgrid(-ceil(3*sigma):ceil(3*sigma));

    G = -(x/(2*pi*(sigma^4))).*exp(-(x.^2+y.^2)/(2*(sigma^2)));

end