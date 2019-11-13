clc, clear, close all;


frame = imread('./tst/Capture2.PNG');
[ frameW, frameH, ~ ] = size(frame);

% corners6 est utilisé pour déterminer P
A = [6.189883720930233e+02 5.981976744186047e+02];%getPoint();
B = [2.409883720930234e+02 1.164569767441861e+03];%getPoint();
C = [4.255930232558139e+02 1.523732558139535e+03];%getPoint();
D = [9.065697674418606e+02 8.694534883720931e+02];%getPoint();
E = [4.783372093023256e+02 1.021406976744186e+03];%getPoint();
F = [7.709418604651162e+02 9.021046511627907e+02];%getPoint();
corners6 = [ A' B' C' D' E' F' ];
corners4 = [ A' B' C' D' ];

% positions des structures Legos en 3D et en cm sur la feuille
h = 21;
w = 29.7;

legosize = 0.741;
legoheight = .96;

% lego bleu
back  = shape_brick(w/8           , h/2           , 0, legosize*11, legosize*2 , legoheight*2);
right = shape_brick(w/8           , h/2           , 0, legosize*2 , legosize*11, legoheight*2);
front = shape_brick(w/8           , h/2+legosize*9, 0, legosize*11, legosize*2 , legoheight*2);
left  = shape_brick(w/8+legosize*9, h/2           , 0, legosize*2 , legosize*11, legoheight*2);

legoBleu = shape_cat(back, right, front, left);

% lego blanc
back  = shape_brick(w/2           , h/2-legosize*8, 0, legosize*8, legosize*2, legoheight*3);
right = shape_brick(w/2           , h/2-legosize*8, 0, legosize*2, legosize*8, legoheight*3);
front = shape_brick(w/2           , h/2-legosize*2, 0, legosize*8, legosize*2, legoheight*3);
left  = shape_brick(w/2+legosize*6, h/2-legosize*8, 0, legosize*2, legosize*8, legoheight*3);

legoBlanc = shape_cat(back, right, front, left);

% détermination du mask des structures Legos
legoShapes = shape_cat(legoBleu, legoBlanc);
maskLego = findLegoMask(corners6, frameW, frameH, legoShapes);

% détermination du mask de la main
maskHand = findHandMask(frame);

% remplace le contenu sans écraser ni la main, ni les Legos
content = getContent(1);
result = replaceContent(corners4, frame, content, maskHand, ~maskLego) ;

% affichage
figure, imshow(result);
