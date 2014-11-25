clear all
close all
clc

% Open image
I = imread('p000861532001.jpg');
% I = imread('coins.jpg');

% Convert to grayscale
I_gray = rgb2gray(I);

% Show image
figure(1);
imshow(I_gray)
title('Image with objects')

% mask is the initial contour state
mask = zeros(size(I_gray));
mask(25:end-25,25:end-25) = 1;

% Show mask
figure(2);
imshow(mask);
title('Initial contour location')

% bw is a mask of the detected objects
numIter = 2500;
bw = activecontour(I_gray, mask, numIter);

% Show detected objects
figure(3);
imshow(bw);
title('Detected objects')

% Remove small connected components
% that are less than 100 pixels
bw = bwareaopen(bw, 100);

% Show result
figure(4);
imshow(bw);
title('After removing small components')

% Only keep the coins, remove the rest
I_clean = I;
bw_rgb(:,:,1) = bw;
bw_rgb(:,:,2) = bw;
bw_rgb(:,:,3) = bw;
I_clean(~bw_rgb) = 0;
I_clean = reshape(I_clean, size(I));

% Show result
figure(5);
imshow(I_clean);
title('Coins and nothing else')

% Find a bouding box for each coin
bb = regionprops(bw, 'BoundingBox');

% For all coins
for i=1:numel(bb)
    % Get coordinates of bounding box
    coords = floor( bb(i).BoundingBox );
    x1 = coords(1);
    x2 = coords(1) + coords(3);
    y1 = coords(2);
    y2 = coords(2) + coords(4);
    
    % Crop image for each coin
    cropped{i} = I_clean( y1:y2, x1:x2, : );
    
    % Show bounding boxes on mask
    figure(4);
    rectangle('Position',[x1,y1,x2-x1,y2-y1], 'EdgeColor', 'r', 'LineWidth', 2)
end

% Show each cropped image
figure(6);
subplot(2,2,1)
imshow(cropped{1})
subplot(2,2,2)
imshow(cropped{2})
subplot(2,2,3)
imshow(cropped{3})
subplot(2,2,4)
imshow(cropped{4})
