classdef MnClassifier < Classifier
    %UNTITLED18 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        alpha
    end
    
    methods
        function MN = MnClassifier(alpha)
            MN.alpha = alpha;
        end
        
        function model = fitmodel(this, data, labels)
            means = [];
            for i = 1:width(data)
                
                means0 = histcounts(table2array(data(labels==0,i)),...
                    'BinMethod','integers');
                
                means1 = histcounts(table2array(data(labels==1,i)),...
                    'BinMethod','integers');
                
                meansx = zeros(2,max([length(means0) length(means1)]));
                meansx(1,find(means0)) = means0(means0 ~= 0);
                meansx(2,find(means1)) = means1(means1 ~= 0);
                
                means = [means meansx];
            end
            
            model = MnModel(means, this.alpha, unique(labels));
        end
    end
end

