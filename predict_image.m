clc; clear;

% Load trained model
load('trainedModel.mat', 'net');

% Select image
[filename, pathname] = uigetfile({'*.jpg;*.jpeg;*.png'}, 'Select a plant image');
if isequal(filename, 0)
    disp('No image selected.');
    return;
end

imgPath = fullfile(pathname, filename);
img = imread(imgPath);

% Resize for model input
imgResized = imresize(img, [224 224]);

% Predict
predictedLabel = classify(net, imgResized);

% Decide if Healthy or Diseased
if contains(lower(string(predictedLabel)), 'healthy')
    result = '🌿 Healthy';
else
    result = '⚠️ Diseased';
end

% Show result
imshow(img);
title(['Prediction: ' result ' (' char(predictedLabel) ')'], 'FontSize', 16);
