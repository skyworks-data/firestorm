% Add consistent random seeding?

% opts = detectImportOptions('train_sample.csv');
% opts.VariableTypes = arrayfun(@(x) x.format, enumeration('Feature'), 'UniformOutput',false)';
% 
% train = readtable('train_sample.csv', opts);
% sortedTrain = sortrows(train,Feature.ClickTime.name);

nb = fitcnb(train(1:6000,2:5),train(1:6000,end),'Prior','empirical','CategoricalPredictors','all');

pred = predict(nb,train(6001:end,2:5));
roc(train.is_attributed(6001:end)',double(pred'))

