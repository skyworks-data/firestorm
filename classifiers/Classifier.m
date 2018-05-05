classdef Classifier < handle
    %Base class for classification
    
    methods (Abstract)
        [model] = fitmodel(this, data, labels);
        [P] = predict(this, data);
    end
end

