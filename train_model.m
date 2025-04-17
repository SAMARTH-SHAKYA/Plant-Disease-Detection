clc; clear;

% Load everything
load('dataStores.mat');
run('preprocess_data.m');
load('cnnLayers.mat');

% Set training options
options = trainingOptions('adam', ...
    'MaxEpochs', 10, ...
    'MiniBatchSize', 16, ...
    'ValidationData', augVal, ...
    'ValidationFrequency', 5, ...
    'Verbose', false, ...
    'Plots', 'training-progress');

% Train the model
net = trainNetwork(augTrain, layers, options);

% Save the trained model
save('trainedModel.mat', 'net');
