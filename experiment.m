
% rr = randsample(size(data,1), floor(size(train,1)/4));

% tic
% c = LogisticRegressionClassifier;
% [p s] = evaluate(c, [train(1:2000000,[5 8])], train.is_attributed(1:2000000) );
% times = [times; toc];
% c = NBClassifierNative;
% [p s l] = evaluate(c, train(1:1000000,[2 3]), train.is_attributed(1:1000000), 0.33, true);
% toc
% disp(s)
% 
% wls = [2 5];
% preds = [];
% for i = 1:length(wls)
%     c = TreeClassifier;
%     [preds(:,i),~,l] = evaluate(c, train(1:100000,wls(i)), train.is_attributed(1:100000));
% end
% 
% preds = [preds(:,1) preds(:,2)*8];
% predF = max
% predMode = mode(preds,2);
% fastAUC(l,predMode)


c = TreeClassifier;
[~,s,~] = evaluate(c, train(1:100000, [4]), train.is_attributed(1:100000));
disp(s)