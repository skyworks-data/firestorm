function [train, test] = loadPartialData(fileName, numRows,cols)
    % fileName: Name of file to read in
    % numRows: Number of rows to randomly pull
    % cols:    A 1-D cell array containing type Feature
    % TODO: Some optimization of data types being read in may help save space
    
%     [~, strRowNum] = system(['wc -l <', fileName]);
%     nTrainRows = str2double(strRowNum)-1;
%     fileID = fopen(fileName);
% 
    NUM_SKIP = 4;
    
    dataStore = datastore(fileName);
    dataStore.TreatAsMissing = '';
    dataStore.ReadSize = 1000000;
	dataStore.SelectedVariableNames = cellfun(@(x) x.name, cols, 'UniformOutput',false);
	dataStore.SelectedFormats = cellfun(@(x) x.format, cols, 'UniformOutput',false);
    
    nPar = numpartitions(dataStore);
    nReads = floor(nPar/NUM_SKIP);
    
    train = [];
    for p = 1:nReads+1
        tic
        train = [train; read(partition(dataStore,nPar,(p-1)*NUM_SKIP+1))];
        toc
    end
    
%     test = readtable('test.csv');
    test = [];
    
end