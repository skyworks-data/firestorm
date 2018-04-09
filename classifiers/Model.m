classdef (Abstract) Model < handle
    %Base Model class
    
    methods (Abstract)
        [P] = predict(this, data);
    end 
end

