.stat.util.sel:{
    ?[x;();0b;{x!x}(),y]
 };

/ .stat.linreg.construct[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~x1+x2"]
.stat.linreg.construct:{[t;e]
    e:ssr[e;" ";""];
    lhs:`$ss[e;"~"]#e;
    rhs:`$"+"vs(neg -1+count[e]-ss[e;"~"])#e;
    :.stat.util.sel[t;] rhs,lhs;
 };

/ .stat.linreg.insample[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~x1+x2"]
.stat.linreg.insample:{[t;e]
    t: .stat.linreg.construct[t;e];
    yhat: flip[x] mmu beta:.stat.matrix.ols[x:-1_x;y:raze -1#x:{enlist[count[flip x]#1f],x}flip raze each t];
    r2: 1-sum[rss:(y-yhat)xexp 2]%sum tss:(y-avg y)xexp 2;
    r2adj: 1-(1-r2)*(count[y]-1)%count[y]-count x;
    :(`x`y`beta`r2`r2adj`equation)!(x;y;(`coefficient`estimate)!(`intercept,-1_cols t;beta);r2;r2adj;e);
 };
 
 / .stat.linreg.report .stat.linreg.insample[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~x1+x2"]
.stat.linreg.report:{[m]
    ([]coefficient:m[`beta]`coefficient;estimate:m[`beta]`estimate;r2:m`r2;r2adjusted:m`r2adj;samplesize:count m`y;equation:`$m`equation)
 };
