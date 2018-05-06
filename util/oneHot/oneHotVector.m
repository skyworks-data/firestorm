% ORIGINAL FUNCTION PULLED FROM 

function oneHotLabels = oneHotVector(labels)

    % Takes a vector of size n by 1 as input and creates a one-hot encoding of its
    % elements.

    valueLabels = unique(labels);
    nLabels = length(valueLabels);
    nSamples = size(labels, 1);

    oneHotLabels = false(nSamples, nLabels);

    for i = 1:nLabels
        oneHotLabels(:,i) = (labels == valueLabels(i));
        disp(i);
    end
