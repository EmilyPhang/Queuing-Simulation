function output=probability 
    cdf=0;

    div=1/(6);
    offset=div;
    
    upper=div+offset;
    lower=1/5*0.65;
    
    for i=1:4
        P(i)=round((rand()*(upper-lower)+lower)*100)/100;
                
        if (P(i) > div)
            offset=offset-(P(i)-div);
            upper=div+offset;
        end

        cdf=cdf+P(i);        
    end
    
    P(5)=1-cdf;
    
    output=P;