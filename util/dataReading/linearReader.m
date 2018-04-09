function [train, test] = linearReader(fileName, numRows, cols)
    % numRows: Number of rows to randomly pull
    % cols:    A 1-D cell array containing type Features
    % TODO: Some optimization of data types being read in may help save space

    dataStore = datastore(fileName);
    dataStore.SelectedVariableNames = cellfun(@(x) x.name, cols, 'UniformOutput',false);
    dataStore.TreatAsMissing = '';
    dataStore.SelectedFormats = cellfun(@(x) x.format, cols, 'UniformOutput',false);
    dataStore.ReadSize = numRows;
    
    train = read(dataStore);
    
    test = readtable('test.csv');   
end