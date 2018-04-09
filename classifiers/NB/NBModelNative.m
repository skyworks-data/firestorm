classdef NBModelNative < Model
    %UNTITLED19 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        model
    end
    
    methods
        function [NBM] = NBModelNative(model)
            NBM.model = model;
        end
        
        function [P] = predict(this, data)
            P = this.model.predict(data);
        end
    end
    
end

