classdef NBClassifierNative < Classifier

    properties
        model
    end
    
    methods
        function fitmodel(this, data, labels)
            this.model = fitcnb(data,labels,'CategoricalPredictors','all');
        end
        
        function [P] = predict(this, data)
            P = this.model.predict(data);
        end
    end
end

