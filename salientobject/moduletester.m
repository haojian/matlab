%module tester

addpath(genpath('/Users/haojian/Documents/MATLAB/salientobject/'))
addpath([pwd '/']);
addpath([pwd '/MEX/']);
imgExample = imread('BB.jpg');
boxes = runObjectness(imgExample,10);

