clc; clear;

inputSize = [224 224 3];

layers = [
    imageInputLayer(inputSize)

    convolution2dLayer(3, 8, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2, 'Stride', 2)

    convolution2dLayer(3, 16, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2, 'Stride', 2)

    fullyConnectedLayer(3)  % 3 classes: Healthy, Powdery, Rust
    softmaxLayer
    classificationLayer
];

save('cnnLayers.mat', 'layers');
