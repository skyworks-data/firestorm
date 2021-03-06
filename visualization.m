% FILE PURPOSE: - Visualize and understand the distribution of data in both]
%                 positive and negative classes

train = load('RandQuarterTrainCompressed.mat');

%% Split the dat into the two classes
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
uniqueIpD = unique(downloads.ip);
uniqueIpF = unique(fraud.ip);
hold off;
plot(uniqueIpD,smooth(ipDownloadProb,100,'lowess'),'LineWidth',1.5);
hold on;
plot(uniqueIpF,smooth(ipFraudProb,100,'lowess'),'LineWidth',1.5)
legend('Download','Fraud');


%% App
appFraudProb = histcounts(double(fraud.app),...
    'BinMethod','integers',...
    'Normalization','probability')';

appDownloadProb = histcounts(double(downloads.app),...
    'BinMethod','integers',...
    'Normalization','probability')';

hold off;
plot(0:length(appDownloadProb)-1,appDownloadProb,'LineWidth',1.5);
hold on;
plot(0:length(appFraudProb)-1,appFraudProb,'LineWidth',1.5);
legend('Download','Fraud');



%% OS
osFraudProb = histcounts(double(fraud.os),...
    'Normalization','probability',...
    'BinMethod','integers')';

osDownloadProb = histcounts(double(downloads.os),...
    'Normalization','probability',...
    'BinMethod','integers')';

hold off;
plot(0:length(osDownloadProb)-1,osDownloadProb,'LineWidth',1.5);
hold on;
plot(0:length(osFraudProb)-1,osFraudProb,'LineWidth',1.5);
legend('Download','Fraud');


%% Device
deviceFraudProb = histcounts(double(fraud.device),...
    'Normalization','probability',...
    'BinMethod','integers')';

deviceDownloadProb = histcounts(double(downloads.device),...
    'Normalization','probability',...
    'BinMethod','integers')';

hold off;
plot(0:length(deviceDownloadProb)-1,deviceDownloadProb,'LineWidth',1.5);
hold on;
plot(0:length(deviceFraudProb)-1,deviceFraudProb,'LineWidth',1.5);
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
plot(0:length(channelDownloadProb)-1,channelDownloadProb,'LineWidth',1.5);
hold on;
plot(0:length(channelFraudProb)-1,channelFraudProb,'LineWidth',1.5);
legend('Download','Fraud');


%% Click time

% THERE IS A *SLIGHT* CORRELATION BETWEEN TIME AND FRAUD
clickTimeFraudProb = histcounts(double(fraud.click_time),'Normalization','probability','BinMethod','integers');
clickTimeDownloadProb = histcounts(double(downloads.click_time),'Normalization','probability','BinMethod','integers');
hold off;
plot(smooth(clickTimeFraudProb,1000,'lowess'),'LineWidth',1.5);
hold on;
plot(smooth(clickTimeDownloadProb,1000,'lowess'),'LineWidth',1.5);
legend('Fraud', 'Download');

pred = train.click_time < 47000 & train.click_time > 3630;
fastAUC(train.is_attributed(train.click_time < 47000 & train.click_time > 3630),pred(train.click_time < 47000 & train.click_time > 3630))


