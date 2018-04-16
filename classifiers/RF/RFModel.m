classdef RFModel < Model    
    properties
        model
    end
    
    methods
        function [RFM] = RFModel(model)
            RFM.model = model;
        end
        
        function [P] = predict(this, data)
            P = this.model.predict(data);
        end
    end
    
end