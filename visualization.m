downloads = train(train.is_attributed == 1,:);
fraud = train(train.is_attributed == 0,:);

%% IP



%% App
appFraudProb = histcounts(train.os(train.is_attributed==0),...
    'Normalization','probability',...
    'BinMethod','integers')';

appDownloadProb = histcounts(train.os(train.is_attributed==1),...
    'Normalization','probability',...
    'BinMethod','integers')';

means = [];
means(1,find(appFraudProb)) = appFraudProb(appFraudProb ~= 0);
means(2,find(appDownloadProb)) = appDownloadProb(appDownloadProb ~= 0);
plot(means');


%% OS
osFraudProb = histcounts(train.os(train.is_attributed==0),...
    'Normalization','probability',...
    'BinMethod','integers')';

osDownloadProb = histcounts(train.os(train.is_attributed==1),...
    'Normalization','probability',...
    'BinMethod','integers')';

means = [];
means(1,find(osFraudProb)) = osFraudProb(osFraudProb ~= 0);
means(2,find(osDownloadProb)) = osDownloadProb(osDownloadProb ~= 0);
plot(means');


%% Device
deviceFraudProb = histcounts(train.device(train.is_attributed==0),...
    'Normalization','probability',...
    'BinMethod','integers')';

deviceDownloadProb = histcounts(train.device(train.is_attributed==1),...
    'Normalization','probability',...
    'BinMethod','integers')';

means = [];
means(1,find(deviceFraudProb)) = deviceFraudProb(deviceFraudProb ~= 0);
means(2,find(deviceDownloadProb)) = deviceDownloadProb(deviceDownloadProb ~= 0);
plot(means');
legend('Fraud', 'Download');

bar(categorical({'Download', 'Fraud'}), ...
    [length(unique(downloads.device)) length(unique(fraud.device))])
title('Number of unique devices');

% Only 898 devices in both classes!
length(intersect(unique(downloads.device), unique(fraud.device)));


%% Channel
channelFraudProb = histcounts(train.channel(train.is_attributed==0),...
    'Normalization','probability',...
    'BinMethod','integers')';

channelDownloadProb = histcounts(train.channel(train.is_attributed==1),...
    'Normalization','probability',...
    'BinMethod','integers')';

means = [];
means(1,find(channelFraudProb)) = channelFraudProb(channelFraudProb ~= 0);
means(2,find(channelDownloadProb)) = channelDownloadProb(channelDownloadProb ~= 0);
plot(means');
legend('Fraud', 'Download');


%% Click time

T = convertDates(train);
histogram(T.click_time(T.is_attributed==1),'Normalization','probability','BinWidth',2000)
figure(2), histogram(T.click_time(T.is_attributed==0),'Normalization','probability','BinWidth',2000)




%% Attributed time


