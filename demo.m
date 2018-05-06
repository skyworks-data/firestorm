% FILE PURPOSE: Show a few models being run

train = load('RandQuarterTrainCompressed.mat');

disp("Running Decision Tree...");
c = TreeClassifier;
[~,s,~] = evaluate(c, train(1:1000000, 2), train.is_attributed(1:1000000));
disp(s);

disp("Running Naive Bayes...");
c = NBClassifierNative;
[~,s,~] = evaluate(c, train(1:1000000, [2 5]), train.is_attributed(1:1000000));
disp(s);

disp("Running Logistic Regression...");
c = LogisticRegressionClassifier;
[~,s,~] = evaluate(c, train(1:1000000, [2 5 8]), train.is_attributed(1:1000000));
disp(s);

disp("Running Random Forest...");
c = RandomForestClassifier;
[~,s,~] = evaluate(c, train(1:1000000, 5), train.is_attributed(1:1000000));
disp(s);

disp("Running Tree Bagger...");
c = TreeBaggerClassifier;
[p,s,l] = evaluate(c, train(1:1000000, 5), train.is_attributed(1:1000000));
disp(s);
