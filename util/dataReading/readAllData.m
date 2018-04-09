function data = readAllData(fileName,cols)
    % fileName: Name of file to read in
    % numRows: Number of rows to randomly pull
    % cols:    A 1-D cell array containing type Feature

    dataStore = datastore(fileName);
    dataStore.TreatAsMissing = '';
	dataStore.SelectedVariableNames = cellfun(@(x) x.name, cols, 'UniformOutput',false);
	dataStore.SelectedFormats = cellfun(@(x) x.format, cols, 'UniformOutput',false);
    
    data = readall(dataStore);
end