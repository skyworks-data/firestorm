function T = compressData(X)
    T = X;
    T.click_time = uint32(seconds(timeofday(X.click_time)));
    
    temp = T.attributed_time;
    T.attributed_time = int32(seconds(timeofday(T.attributed_time)));
    T.attributed_time(isnat(temp)) = -1;
    
    T.is_attributed = logical(T.is_attributed);
end