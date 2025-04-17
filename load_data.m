clc; clear; close all;

% Load dataset from folder structure
trainData = imageDatastore('Dataset/Train', ...
    'IncludeSubfolders', true, ...
    'LabelSource', 'foldernames');

valData = imageDatastore('Dataset/Validation', ...
    'IncludeSubfolders', true, ...
    'LabelSource', 'foldernames');

testData = imageDatastore('Dataset/Test', ...
    'IncludeSubfolders', true, ...
    'LabelSource', 'foldernames');

% Check labels
disp('Training Labels:');
disp(countEachLabel(trainData));

% Save datastores to use later
save('dataStores.mat', 'trainData', 'valData', 'testData');
