function output = CDF(prob)
    S = zeros(1,5);
    cdf = 0;
    
    for i = 1:length(prob)
        cdf = cdf + prob(i);
        S(i) = cdf;
    end
    output = S;
end

