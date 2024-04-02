function output = LowRange(cdf)
    L = zeros(1,5);
    L(1) = 1;
    Lowrange = 0;
    
    for i = 2:5
        Lowrange = round(cdf(i-1)*100+1);
        L(i) = Lowrange;
    end
    output = L;
end



% [1, round(temp(1)*100+1), round(sum(temp([1, 2]))*100+1), round(sum(temp([1, 2, 3]))*100+1), round(sum(temp([1, 2, 3, 4]))*100+1)];