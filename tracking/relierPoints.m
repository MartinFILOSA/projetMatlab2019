function [ F ] = relierPoints( x2, y2, i )
   
    hold on, plot(y2,x2,'r+', 'MarkerSize', 20);  

     x3 = x2;
     y3 = y2;
     x3(3) = x2(4);
     y3(3) = y2(4);
     x3(4) = x2(3);
     y3(4) = y2(3);     
     x3(5) = x2(1);
     y3(5) = y2(1);
     
     plot(y3,x3,'r','LineWidth',2);
     hold off;
     F(i) = getframe(gcf); % pour la vid�o
     drawnow

end