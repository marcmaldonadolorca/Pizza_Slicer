
outputFolder = fullfile(pwd);




classes = [
    
    "Pepperoni"
    "Background"
    
    ];

labelIDs = { ...
      % "Sky"
      [
      255 255 255; ... % "Sky"
      ]
      [
      0 0 0;
      ]
      };

imgDirTest = fullfile(outputFolder,'syntheticDataset/test/images');
imgDirTrain = fullfile(outputFolder,'syntheticDataset/train/images');
labelDirTest = fullfile(outputFolder,'syntheticDataset/test/aceitunas');
labelDirTrain = fullfile(outputFolder,'syntheticDataset/train/aceitunas');






imdsTrain = imageDatastore(imgDirTrain);
imdsTest = imageDatastore(imgDirTest);
pxdsTrain = pixelLabelDatastore(labelDirTrain,classes,labelIDs);
pxdsTest = pixelLabelDatastore(labelDirTest,classes,labelIDs);

tbl = countEachLabel(pxdsTrain);

tempFiles = imdsTest.Files;
lx = (length(tempFiles));
half = ceil(lx/2); %for odd number of bit-stream length
tempFilesTest = tempFiles(1:half);
tempFilesValidation = tempFiles(half + 1:lx);

imdsTest = imageDatastore(tempFilesTest);
imdsVal = imageDatastore(tempFilesValidation);

tempFiles = pxdsTest.Files;
lx = (length(tempFiles));
half = ceil(lx/2); %for odd number of bit-stream length
tempFilesTest = tempFiles(1:half);
tempFilesValidation = tempFiles(half + 1:lx);

pxdsTest = pixelLabelDatastore(tempFilesTest, classes, labelIDs);
pxdsVal = pixelLabelDatastore(tempFilesValidation, classes, labelIDs);
pxdsTrain = pixelLabelDatastore(pxdsTrain.Files, classes, labelIDs);


numTrainingImages = numel(imdsTrain.Files);
numValImages = numel(imdsVal.Files);
numTestingImages = numel(imdsTest.Files);


% Specify the network image size. This is typically the same as the traing image sizes.
imageSize = [257 257 3];

% Specify the number of classes.
numClasses = numel(classes);

% Create DeepLab v3+.
lgraph = deeplabv3plusLayers(imageSize, numClasses, "resnet18");

imageFreq = tbl.PixelCount ./ tbl.ImagePixelCount;
classWeights = median(imageFreq) ./ imageFreq;

pxLayer = pixelClassificationLayer('Name','labels','Classes',tbl.Name,'ClassWeights',classWeights);
lgraph = replaceLayer(lgraph,"classification",pxLayer);

% Define validation data.
pximdsVal = pixelLabelImageDatastore(imdsVal,pxdsVal);

% Define training options. 
options = trainingOptions('sgdm', ...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropPeriod',10,...
    'LearnRateDropFactor',0.3,...
    'Momentum',0.9, ...
    'InitialLearnRate',1e-3, ...
    'L2Regularization',0.005, ...
    'ValidationData',pximdsVal,...
    'MaxEpochs',30, ...  
    'MiniBatchSize',8, ...
    'Shuffle','every-epoch', ...
    'CheckpointPath', tempdir, ...
    'VerboseFrequency',2,...
    'Plots','training-progress',...
    'ValidationPatience', 4);

augmenter = imageDataAugmenter('RandXReflection',true,...
   'RandXTranslation',[-10 10],'RandYTranslation',[-10 10]);

pximds = pixelLabelImageDatastore(imdsTrain,pxdsTrain);
   
[net, info] = trainNetwork(pximds,lgraph,options);


I = readimage(imdsTest,35);
C = semanticseg(I, net);

B = labeloverlay(I,C);
imshow(B)


expectedResult = readimage(pxdsTest,35);
actual = uint8(C);
expected = uint8(expectedResult);
imshowpair(actual, expected)
iou = jaccard(C,expectedResult);
table(classes,iou)

pxdsResults = semanticseg(imdsTest,net, ...
    'MiniBatchSize',4, ...
    'WriteLocation',tempdir, ...
    'Verbose',false);
metrics = evaluateSemanticSegmentation(pxdsResults,pxdsTest,'Verbose',false);
metrics.DataSetMetrics
metrics.ClassMetrics

export = strcat(outputFolder,'/pepperoni.onnx');
disp(net);
save('net.mat', 'net');
%exportONNXNetwork(net,export);
%pretrainedNetwork = fullfile(pretrainedFolder,'deeplabv3plusResnet18CamVid.mat'); 