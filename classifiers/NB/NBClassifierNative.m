classdef NBClassifierNative < Classifier
    %UNTITLED18 Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function [model] = fitmodel(~, data, labels)
            model = NBModelNative(fitcnb(data,labels,'CategoricalPredictors','all'));
        end
    end
end

