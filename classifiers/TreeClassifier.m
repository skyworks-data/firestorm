classdef TreeClassifier < Classifier
    properties
        model
    end
    
    methods
        function fitmodel(this, data, labels)
            this.model = fitctree(data, labels,'CategoricalPredictors','all','Prior','uniform');
        end
        
        function P = predict(this,data)
           P = this.model.predict(data);
        end
    end
end

