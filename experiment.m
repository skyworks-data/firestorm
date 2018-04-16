% load('RandQuarterTrainCompressed.mat');

% data = randTrainCompressed(:, [2, 3, 4, 5]);
% labels = randTrainCompressed.is_attributed;
% clear randTrainCompressed;

[P, S] = evaluate(RFClassifier, data, labels);
