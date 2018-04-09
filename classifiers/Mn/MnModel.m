classdef MnModel < Model
    %UNTITLED19 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        model
        alpha
        classes
    end
    
    methods
        function [MN] = MnModel(model, alpha, classes)
            MN.model = model;
            MN.alpha = alpha;
            MN.classes = classes;
        end
        
        function [P] = predict(this, data)
            newData = zeros(1,length(this.model));
            for i = 1:width(data)
                cats = [];
                cats(table2array(data(:,i))) = 1;
                newData = [newData meansx];
            end
            
            
            likelihoods = zeros(size(data,1),length(this.classes));
            for class = 1:length(this.classes)
                likelihoods(:,class) = mnLoglike(data,this.model(class,:),this.alpha);
            end
            [~, ind] = max(likelihoods,[],2);
            P = this.classes(ind);
        end
    end
    
end

