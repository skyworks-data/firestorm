function encodedData = oneHotEncoding(data)
    data = table2array(data);
    encodedData = [];
    for i = 1:size(data, 2)
        encodedVector = oneHotVector(data(:, i));
    end
    
    encodedData = encodedVector;
end
