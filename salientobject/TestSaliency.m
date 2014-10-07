addpath(genpath('/Users/haojian/Documents/MATLAB/salientobject/'))
addpath([pwd '/']);
addpath([pwd '/MEX/']);
imgExample = imread('BB.jpg');
boxes = runObjectness(imgExample,10);
figure,imshow(imgExample),drawBoxes(boxes(1,:));
figure(2),imshow(imgExample),drawBoxes(boxes);