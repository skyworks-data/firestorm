% load('AllTrainCompressed.mat');
% train = data;
% clear data;
Mdl = TreeBagger(5, train, 'is_attributed ~ app + os + device + channel + click_time', 'OOBPrediction', 'On', 'Method', 'classification');
 
save 'rf_model.mat' Mdl;