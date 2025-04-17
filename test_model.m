clc; clear;

% Load model and test set
load('trainedModel.mat');
load('dataStores.mat', 'testData');

% Resize test images
augTest = augmentedImageDatastore([224 224 3], testData);

% Predict labels
predictedLabels = classify(net, augTest);

% Calculate accuracy
accuracy = mean(predictedLabels == testData.Labels);
fprintf('Test Accuracy: %.2f%%\n', accuracy * 100);

% Plot confusion matrix
figure;
plotconfusion(testData.Labels, predictedLabels);
