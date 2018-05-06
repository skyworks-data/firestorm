% FILE PURPOSE: - Create a simple way to test models by splitting the data
%                 into test and train, fitting a model, making a prediction
%                 and calculating the AUC

function [P, S, L, T] = evaluate(classifier, data, labels, p, shuffleData)
    % p: Percentage of data to hold out for testing
    
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
    classifier.fitmodel(train(:,1:end-1), table2array(train(:,end)));
    
    % Predict
    disp('Making Prediction...')
    P = classifier.predict(test(:,1:end-1));
    
    % Evaluate
    disp('Evaluating AUC...')
    S = fastAUC(table2array(test(:,end)), P);
    
    % Return labels
    L = table2array(test(:,end));
end

