clc; clear;

% Load image datastores
load('dataStores.mat', 'trainData', 'valData');

inputSize = [224 224 3];

% Resize images for CNN
augTrain = augmentedImageDatastore(inputSize, trainData);
augVal = augmentedImageDatastore(inputSize, valData);
