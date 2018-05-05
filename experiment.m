

oneHot = oneHotEncoding(train(:,5));

[vv, dd] = eig(theCov);

proj3D = oneHot(:,means > 0.01)*vv(:,end-1:end);

in = proj3D(train.is_attributed == 1,:);
out = proj3D(train.is_attributed == 0,:);


plot3(in(:,1),in(:,2),in(:,3),'.');
hold on;
plot3(out(:,1),out(:,2),out(:,3),'.')


% oneHotBad = oneHot(train.is_attributed == 0,:);
SIZE_BAD = 2000000;
oneHotRealBad = oneHotBad(1:SIZE_BAD,:);
oneHotGood = oneHot(train.is_attributed == 1,:);

shrunk = [oneHotRealBad; oneHotGood];
[vv, dd] = eig(cov(shrunk));
proj = shrunk*vv(:,end-2:end);

dude = zscore(shrunk);
[U,S,V] = svd(dude,'econ');
V = V';
approx = U(:,1:2)*(S(1:2,1:2)*V(1:2,:));

W = fld(approx(:,sum(shrunk) ~=0),[repelem(0,SIZE_BAD),repelem(1,114269)]);
% W = fld(oneHot(:,sums > 50000), train.is_attributed);

fldData = approx(:,sum(shrunk) ~=0)*W';

histogram(fldData(1:SIZE_BAD,:),'Normalization','probability');
hold on;
histogram(fldData(SIZE_BAD+1:end,:),'Normalization','probability');


plot3(proj(1:114269,1),proj(1:114269,2),proj(1:114269,3),'.');
hold on;
plot3(proj(114270:end,1),proj(114270:end,2),proj(114270:end,3),'.');