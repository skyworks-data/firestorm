% downloads = train(train.is_attributed == 1,:);
% fraud = train(train.is_attributed == 0,:);

downloads = train(train.is_attributed == 1,:);
fraud = train(train.is_attributed == 0,:);


%% IP
ipFraudProb = histcounts(double(fraud.ip),...
    'Normalization','probability',...
    'BinMethod','integers')';

ipDownloadProb = histcounts(double(downloads.ip),...
    'Normalization','probability',...
    'BinMethod','integers')';

%%%%%%%% GOOD REASON NOT TO USE IP!!! %%%%%%%%%
hold off;
plot(smooth(ipDownloadProb,100,'lowess'));
hold on;
plot(smooth(ipFraudProb,100,'lowess'))
legend('Download','Fraud');


%% App
appFraudProb = histcounts(double(fraud.app),...
    'BinMethod','integers',...
    'Normalization','probability')';

appDownloadProb = histcounts(double(downloads.app),...
    'BinMethod','integers',...
    'Normalization','probability')';

hold off;
plot(0:length(appDownloadProb)-1,appDownloadProb);
hold on;
plot(0:length(appFraudProb)-1,appFraudProb);
legend('Download','Fraud');



%% OS
osFraudProb = histcounts(double(fraud.os),...
    'Normalization','probability',...
    'BinMethod','integers')';

osDownloadProb = histcounts(double(downloads.os),...
    'Normalization','probability',...
    'BinMethod','integers')';

hold off;
plot(0:length(osDownloadProb)-1,osDownloadProb);
hold on;
plot(0:length(osFraudProb)-1,osFraudProb);
legend('Download','Fraud');


%% Device
% deviceFraudCleaned = fraud.device(fraud.device ~= 1 & fraud.device ~= 2 & fraud.device ~= 0);
% deviceDownloadCleaned = downloads.device(downloads.device ~= 1 & downloads.device ~= 2 & downloads.device ~= 0);
deviceFraudProb = histcounts(double(fraud.device),...
    'Normalization','probability',...
    'BinMethod','integers')';

deviceDownloadProb = histcounts(double(downloads.device),...
    'Normalization','probability',...
    'BinMethod','integers')';

hold off;
plot(0:length(deviceDownloadProb)-1,deviceDownloadProb);
hold on;
plot(0:length(deviceFraudProb)-1,deviceFraudProb);
legend('Download','Fraud');

bar(categorical({'Download', 'Fraud'}), ...
    [length(unique(downloads.device)) length(unique(fraud.device))])
title('Number of unique devices');

% Only 1713 devices in both classes!
length(intersect(unique(downloads.device), unique(fraud.device)))


%% Channel
channelFraudProb = histcounts(double(fraud.channel),...
    'Normalization','probability',...
    'BinMethod','integers')';

channelDownloadProb = histcounts(double(downloads.channel),...
    'Normalization','probability',...
    'BinMethod','integers')';

hold off;
plot(0:length(channelDownloadProb)-1,channelDownloadProb);
hold on;
plot(0:length(channelFraudProb)-1,channelFraudProb);
legend('Download','Fraud');


%% Click time

% THERE IS A *SLIGHT* CORRELATION BETWEEN TIME AND FRAUD
clickTimeFraudProb = histcounts(double(fraud.click_time),'Normalization','probability','BinMethod','integers');
clickTimeDownloadProb = histcounts(double(downloads.click_time),'Normalization','probability','BinMethod','integers');
hold off;
plot(smooth(clickTimeFraudProb,1000,'lowess'));
hold on;
plot(smooth(clickTimeDownloadProb,1000,'lowess'));
legend('Fraud', 'Download');

pred = train.click_time < 47000 & train.click_time > 3630;
fastAUC(train.is_attributed(train.click_time < 47000 & train.click_time > 3630),pred(train.click_time < 47000 & train.click_time > 3630))

%% Attributed time


