function output = UppRange(cdf)
    U = zeros(1,5);
    U(5) = 100;
    Upprange = 0;
    
    for i = 1:4
        Upprange = round(cdf(i)*100);
        U(i) = Upprange;
    end
    output = U;
end



% [round(temp(1)*100), round(sum(temp([1, 2]))*100), round(sum(temp([1, 2, 3]))*100), round(sum(temp([1, 2, 3, 4]))*100), 100];