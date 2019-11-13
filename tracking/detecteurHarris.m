function [D] = detecteurHarris(image, sigma1, sigma2)
    
    I = double(image);   %Matrice d'intensité en double 
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);
    I2 = (R+G+B)/3; % on crée une matrice d'intensité de l'image initiale
    
    G = derivFiltreGauss2D(sigma1);
    Ix=conv2(I2,G, 'same'); % on applique le premier filtre selon x
    Iy = conv2(I2,G', 'same'); % de même selon y
    
    Gauss2D = filtreGauss2D(sigma2);
    CovA = conv2((Ix.*Ix),Gauss2D, 'same');
    CovB = conv2((Ix.*Iy),Gauss2D, 'same');
    CovC = conv2((Iy.*Iy),Gauss2D, 'same');
    
    D = CovA.*CovC - CovB.^2 - 0.05.*((CovA + CovC).^2);
    
end