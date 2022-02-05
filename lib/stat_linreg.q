/ .stat.linreg.construct[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~intercept+x1+x2"]
.stat.linreg.construct:{[t;e]
    lhs:$[1<count e:"~"vs ssr[e;" ";""];first e;()];
    rhs:"+"vs last e;
    if["intercept" in rhs;t:update intercept:1f from t;];
    :.stat.util.sel[t;]distinct`$rhs,lhs;
 };

/ .stat.linreg.insample[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~intercept+x1+x2"]
.stat.linreg.insample:{[t;e]
    t:.stat.linreg.construct[t;e];
    yhat:x mmu beta:.stat.matrix.ols[x:.stat.util.table2matrix(-1_cols t)#t;y:raze .stat.util.table2matrix(-1#cols t)#t];
    :(`x`y`yhat`beta`equation)!(x;y;yhat;(`coefficient`estimate)!(-1_cols t;beta);e);
 };

.stat.linreg.outofsample:{[t;m]
    y:raze .stat.util.table2matrix(-1#cols t)#t:.stat.linreg.construct[t;m`equation];
    yhat:(x:.stat.util.table2matrix(-1_cols t)#t)mmu m[`beta]`estimate;
    :m,(`x`y`yhat)!(x;y;yhat);
 };

.stat.linreg.r2:{[m]
    1-sum[rss:(m[`y]-m`yhat)xexp 2]%sum tss:(m[`y]-avg m`y)xexp 2
 };

.stat.linreg.r2adj:{[m]
    1-(1-.stat.linreg.r2 m)*(count[m`y]-1)%count[m`y]-count flip m`x
 };
 
 / .stat.linreg.report .stat.linreg.insample[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~x1+x2"]
.stat.linreg.report:{[m]
    ([]coefficient:m[`beta]`coefficient;estimate:m[`beta]`estimate;r2:.stat.linreg.r2 m;r2adjusted:.stat.linreg.r2adj m;samplesize:count m`y;equation:`$m`equation)
 };
