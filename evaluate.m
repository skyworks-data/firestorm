function [P, S] = evaluate(classifier, data, labels, p, shuffleData)
    
    if ~istable(labels)
        labels = table(labels);
    end
    
    dataTable = [data labels];
            
    if exist('shuffleData', 'var') && shuffleData
        disp('Shuffling Data...')
        dataTable = shuffleRows(dataTable);
    end
    
    if ~exist('p', 'var')
        p = 0.3;
    end
    
    % Split Data
    disp('Splitting Data...')
    N = height(dataTable);
    train = dataTable(1:floor(N*(1-p)),:);
    test = dataTable(ceil(N*(1-p)):end,:);
    
    % Train
    disp('Training Model...')
    model = classifier.fitmodel(train(:,1:end-1), table2array(train(:,end)));
    
    % Predict
    disp('Making Prediction...')
    P = model.predict(test(:,1:end-1));
    
    % Evaluate
    S = fastAUC(table2array(test(:,end)), P);
end

