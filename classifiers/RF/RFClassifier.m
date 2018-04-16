classdef RFClassifier < Classifier
    methods
        function [model] = fitmodel(~, data, labels)
            model = RFModel(TreeBagger(5, data, labels, 'OOBPrediction', 'On', 'Method', 'classification'));
        end
    end
end

