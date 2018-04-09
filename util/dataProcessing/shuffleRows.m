function D = shuffleRows(data)
    randomized = randsample(size(data,1), size(data,1));
    D = data(randomized,:);
end

