/ .statq.linreg.insample[([]x1:1 5 4f;x2:3 6 1f;y:3 11 9f);enlist[`equation]!enlist "y~intercept+x1"]
.statq.linreg.insample:{[t;d]
    .statq.util.required[d;`equation];
    t:.statq.util.construct[t;d`equation];
    yhat:x mmu beta:.statq.matrix.ols[x:.statq.util.table2matrix t`x;y:raze .statq.util.table2matrix t`y];
    :(`x`y`yhat`beta`equation)!(x;y;yhat;(`coefficient`estimate)!(cols t`x;beta);d`equation);
 };

.statq.linreg.outofsample:{[t;m]
    t:.statq.util.construct[t;m`equation];
    y:raze .statq.util.table2matrix t`y;
    yhat:(x:.statq.util.table2matrix t`x)mmu m[`beta]`estimate;
    :m,(`x`y`yhat)!(x;y;yhat);
 };

.statq.linreg.r2:{[m]
    1-sum[(m[`y]-m`yhat)xexp 2]%sum(m[`y]-avg m`y)xexp 2
 };

.statq.linreg.r2adj:{[m]
    1-(1-.statq.linreg.r2 m)*(count[m`y]-1)%count[m`y]-count flip m`x
 };
 
 / .statq.linreg.report .statq.linreg.insample[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~x1+x2"]
.statq.linreg.report:{[m]
    ([]coefficient:m[`beta]`coefficient;estimate:m[`beta]`estimate;r2:.statq.linreg.r2 m;r2adjusted:.statq.linreg.r2adj m;samplesize:count m`y;equation:`$m`equation)
 };
