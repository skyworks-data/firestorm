function [train, test] = loadPartialData(fileName, numRows,cols)
    % fileName: Name of file to read in
    % numRows: Number of rows to randomly pull
    % cols:    A 1-D cell array containing type Features
    % TODO: Some optimization of data types being read in may help save space
    
%     [~, strRowNum] = system(['wc -l <', fileName]);
%     nTrainRows = str2double(strRowNum)-1;
%     fileID = fopen(fileName);
% 
%     csvFormat = cell2mat(arrayfun(@(x) x.format, enumeration('Feature'), 'UniformOutput',false)');
% 
%     train = [];
%     tic
%     for i = 1:numRows
%         train = [train; textscan(fileID, csvFormat, 10000, ...
%                  'Delimiter', ',', ...
%                  'HeaderLines', 100)];
%     end
%     toc
    dataStore = datastore(fileName);
    dataStore.VariableNames = arrayfun(@(x) x.name, enumeration('Feature'), 'UniformOutput',false);
    dataStore.TreatAsMissing = '';
    dataStore.ReadSize = 1000000;
	dataStore.SelectedVariableNames = cellfun(@(x) x.name, cols, 'UniformOutput',false);
	dataStore.SelectedFormats = cellfun(@(x) x.format, cols, 'UniformOutput',false);
    
    
    train = [];
    for i = 1:200
%         dataStore.NumHeaderLines = randi([1 nTrainRows]);
        tic
%         train = [train; readtable('train.csv', opts)];
        train = read(dataStore);
        size(train)
        toc
    end
    
%     test = readtable('test.csv');
    test = [];
    
end