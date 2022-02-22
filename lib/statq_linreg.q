/ *
/ * .statq.linreg.insample: fits a linear function between explanatory and dependent variables
/ * See https://en.wikipedia.org/wiki/Linear_regression
/ *
/ * @param {table} t: table with explanatory and dependent variables
/ * @param {dictionary} p: dictionary of parameters
/ * @returns {dictionary}: model estimates
/ * @example: .statq.linreg.insample[([]x1:1 5 4f;x2:3 6 1f;y:3 11 9f);enlist[`equation]!enlist "y~intercept+x1"]
.statq.linreg.insample:{[t;p]
    t:.statq.util.prepare[t;].statq.util.required[p;`equation]`equation;
    yhat:t[`x]mmu beta:.statq.matrix.ols[t`x;t`y];
    :(`x`y`yhat`beta`equation)!(t`x;t`y;yhat;(`coefficient`estimate)!(t`colsx;beta);p`equation);
 };

.statq.linreg.outofsample:{[t;m]
    t:.statq.util.prepare[t;m`equation];
    yhat:t[`x]mmu m[`beta]`estimate;
    :m,(`x`y`yhat)!(t`x;t`y;yhat);
 };

/ *
/ * .statq.linreg.r2: returns proportion of variance explained by explanatory variables
/ * See https://en.wikipedia.org/wiki/Coefficient_of_determination
/ *
/ * @param {dictionary} m: estimated model
/ * @returns {float}: R squared
/ * @example: .statq.linreg.r2 .statq.linreg.insample[([]x1:1 5 4f;x2:3 6 1f;y:3 11 9f);(enlist `equation)!(enlist "y~intercept+x1")]
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
