
.statq.volatility.ewma:{[x;alpha]
    {[x;y;alpha]((1-alpha)*x)+alpha*y}[;;alpha]\[x]
 };
