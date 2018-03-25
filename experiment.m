% Add consistent random seeding?

% opts = detectImportOptions('train_sample.csv');
% opts.VariableTypes = arrayfun(@(x) x.format, enumeration('Feature'), 'UniformOutput',false)';
% 
% train = readtable('train_sample.csv', opts);
% sortedTrain = sortrows(train,Feature.ClickTime.name);

nb = fitcnb(data(:,2:5),data(:,end),'CategoricalPredictors','all');

pred = predict(nb, test(:,2:5));
roc(data.is_attributed(end-1000000:end)',double(pred'))

is_attributed = pred;
click_id = ids;
click_id = click_id.click_id;
submission = table(click_id,is_attributed);
writetable(submission, 'submission.csv');