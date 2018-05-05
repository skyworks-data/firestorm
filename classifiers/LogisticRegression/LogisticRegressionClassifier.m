classdef LogisticRegressionClassifier < Classifier
    properties
        model
    end
    
    methods
        function model = fitmodel(this, data, labels)
            this.model = fitglm(data,'is_attributed~ channel','CategoricalVars', [1  2 3]);
        end
        
        function P = predict(this, data)
            P = predict(this.model,data);
        end
    end
end

