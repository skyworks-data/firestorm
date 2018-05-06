
oneHot = oneHotEncoding(train(:,5));

oneHotBad = oneHot(train.is_attributed == 0,:);
SIZE_BAD = 2000000;
oneHotRealBad = oneHotBad(1:SIZE_BAD,:);
oneHotGood = oneHot(train.is_attributed == 1,:);

shrunk = [oneHotRealBad; oneHotGood];

% Find Fisher's Linear Discriminant Matrix
W = fld(shrunk(:,sum(shrunk) ~=0),[repelem(0,SIZE_BAD),repelem(1,114269)]);

fldData = shrunk(:,sum(shrunk) ~=0)*W';

% See the data in the projected space
hold off;
histogram(fldData(1:SIZE_BAD,:),'Normalization','probability');
hold on;
histogram(fldData(SIZE_BAD+1:end,:),'Normalization','probability');
