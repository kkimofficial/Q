/ *
/ * Performs weighted least squares with tikhonov regularization beta = (x'*w*x + gamma'*gamma)^-1*x'*w*y
/ * See https://en.wikipedia.org/wiki/Weighted_least_squares, https://en.wikipedia.org/wiki/Tikhonov_regularization
/ *
/ * @param {float matrix} x: matrix of explanatory observations
/ * @param {float list} y: list of response observations
/ * @param {float matrix} w: weights matrix
/ * @param {float matrix} gamma: tikhonov matrix
/ * @returns {float list}: beta estimates
/ * @example: .statq.linreg.tikhonovwls[(1 100f;1 5f;1 4f);3 11 9f;(0 0 0f;0 1 0f;0 0 1f);(0 0f;0 0f)]
.statq.linreg.tikhonovwls:{[x;y;w;gamma]
    ((inv[((flip[x]mmu w)mmu x)+flip[gamma]mmu gamma]mmu flip x)mmu w)mmu y
 };

/ *
/ * Computes ordinary least squares solution for y = x'beta
/ * See https://en.wikipedia.org/wiki/Ordinary_least_squares
/ *
/ * @param {float matrix} x: matrix of explanatory observations
/ * @param {float list} y: list of response observations
/ * @returns {float list}: beta estimates
/ * @example: .statq.linreg.ols[(1 1f;1 5f;1 4f);3 11 9f]
.statq.linreg.ols:{
    .statq.linreg.tikhonovwls[x;y;.statq.matrix.identity count x;0*.statq.matrix.identity count flip x]
 };

/ *
/ * Performs weighted least squares
/ * See https://en.wikipedia.org/wiki/Weighted_least_squares
/ *
/ * @param {float matrix} x: matrix of explanatory observations
/ * @param {float list} y: list of response observations
/ * @param {float list} w: list of weights for explanatory observations
/ * @returns {float list}: beta estimates
/ * @example: .statq.linreg.wls[(1 100f;1 5f;1 4f);3 11 9f;0 1 1f]
.statq.linreg.wls:{[x;y;w]
    .statq.linreg.tikhonovwls[x;y;.statq.matrix.diagonal w;0*.statq.matrix.identity count flip x]
 };

/ *
/ * Performs ridge regilarized least squares
/ * See https://en.wikipedia.org/wiki/Ridge_regression
/ *
/ * @param {float matrix} x: matrix of explanatory observations
/ * @param {float list} y: list of response observations
/ * @param {float} lambda: regularization coefficient
/ * @returns {float list}: beta estimates
/ * @example: .statq.linreg.ridge[(1 1f;1 5f;1 4f);3 11 9f;0.1]
.statq.linreg.ridge:{[x;y;lambda]
    .statq.linreg.tikhonovwls[x;y;.statq.matrix.identity count x;sqrt[lambda]*.statq.matrix.identity count flip x]
 };

/ *
/ * Fits a linear function between explanatory and dependent variables
/ * See https://en.wikipedia.org/wiki/Linear_regression
/ *
/ * @param {table} t: table with explanatory and dependent variables
/ * @param {dictionary} p: dictionary of parameters
/ * @returns {dictionary}: model estimates
/ * @example: .statq.linreg.insample[([]x1:1 5 4f;x2:3 6 1f;y:3 11 9f);(enlist `equation)!(enlist "y~intercept+x1")]
.statq.linreg.insample:{[t;p]
    t:.statq.util.prepare[t;].statq.util.required[p;`equation]`equation;
    yhat:t[`x]mmu beta:.statq.linreg.ols[t`x;t`y];
    :(`x`y`yhat`beta`equation)!(t`x;t`y;yhat;(`coefficient`estimate)!(t`colsx;beta);p`equation);
 };

/ *
/ * Estimates the data given model fitted in-sample
/ * See https://en.wikipedia.org/wiki/Cross-validation_(statistics)
/ *
/ * @param {table} t: table with explanatory and dependent variables
/ * @param {dictionary} m: model estimates from in-sample
/ * @returns {dictionary}: out-of-sample model estimates
/ * @example: .statq.linreg.outofsample[([]x1:1 5 4f;x2:3 6 1f;y:3 11 9f);] .statq.linreg.insample[([]x1:1 5 4f;x2:3 6 1f;y:3 11 9f);(enlist `equation)!(enlist "y~intercept+x1")]
.statq.linreg.outofsample:{[t;m]
    t:.statq.util.prepare[t;m`equation];
    yhat:t[`x]mmu m[`beta]`estimate;
    :m,(`x`y`yhat)!(t`x;t`y;yhat);
 };

/ *
/ * Computes proportion of variance explained by explanatory variables
/ * See https://en.wikipedia.org/wiki/Coefficient_of_determination
/ *
/ * @param {dictionary} m: model estimates
/ * @returns {float}: R squared
/ * @example: .statq.linreg.r2 .statq.linreg.insample[([]x1:1 5 4f;x2:3 6 1f;y:3 11 9f);(enlist `equation)!(enlist "y~intercept+x1")]
.statq.linreg.r2:{[m]
    1-sum[(m[`y]-m`yhat)xexp 2]%sum(m[`y]-avg m`y)xexp 2
 };

/ *
/ * Computes R squared adjusted for the numbers of explanatory variables
/ * See https://en.wikipedia.org/wiki/Coefficient_of_determination
/ *
/ * @param {dictionary} m: model estimates
/ * @returns {float}: adjusted R squared
/ * @example: .statq.linreg.r2adj .statq.linreg.insample[([]x1:1 5 4f;x2:3 6 1f;y:3 11 9f);(enlist `equation)!(enlist "y~intercept+x1")]
.statq.linreg.r2adj:{[m]
    1-(1-.statq.linreg.r2 m)*(count[m`y]-1)%count[m`y]-count flip m`x
 };
 
 / .statq.linreg.report .statq.linreg.insample[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~x1+x2"]
.statq.linreg.report:{[m]
    ([]coefficient:m[`beta]`coefficient;estimate:m[`beta]`estimate;r2:.statq.linreg.r2 m;r2adjusted:.statq.linreg.r2adj m;samplesize:count m`y;equation:`$m`equation)
 };
