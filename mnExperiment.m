

numCat = length(unique(train.app)) ...
    + length(unique(train.os)) ...
    + length(unique(train.device)) ...
    + length(unique(train.channel));

alpha = repelem(0.5, 6435);

c = MnClassifier(alpha);
evaluate(c,train(:,2:5), train.is_attributed);