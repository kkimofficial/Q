/ *
/ * Performs insample/outofsample k models based on k split of the original data
/ * See https://en.wikipedia.org/wiki/Cross-validation_(statistics)
/ *
/ * @param {table} t: the data to split
/ * @param {int} k: number of folds
/ * @param {function} modelinsample: required sample size
/ * @param {function} modeloutofsample: required sample size
/ * @returns {dictionary list}: list of models
/ * @example: .statq.validation.kfold[update Species:?[Species=`setosa;1f;0f] from .statq.data.iris;5;.statq.logreg.insample[;(enlist`equation)!(enlist"Species~Sepal.Width+Sepal.Length")];.statq.logreg.outofsample]
.statq.validation.kfold:{[t;k;modelinsample;modeloutofsample]
    {last[z][x y;]first[z]x except x y}[;;modelinsample,modeloutofsample]/:[t;.statq.validation.randomsplit[til count t;k#1%k]]
 };

.statq.validation.randomsplit:{[t;allocation]
    t {x,enlist(z til .statq.math.round min[y,1f]*count z)except raze x}[;;neg[count t]?til count t]/[();sums allocation]
 };

.statq.validation.simplesplit:{[t;allocation]
    t {x,enlist(z til .statq.math.round min[y,1f]*count z)except raze x}[;;til count t]/[();sums allocation]
 };

/ *
/ * Performs random sampling with replacement
/ * See https://en.wikipedia.org/wiki/Bootstrapping_(statistics)
/ *
/ * @param {table} t: the data from which to sample
/ * @param {int} n: required sample size
/ * @returns {table}: bootstrapped sample
/ * @example: .statq.validation.bootstrap[([]x1:1 5 4f;x2:3 6 1f;y:3 11 9f);10]
.statq.validation.bootstrap:{[t;n]
    n?t
 };

/ .statq.validation.classimbalance[.statq.data.iris;`Species]
.statq.validation.classimbalance:{[t;c]
    `n xdesc select n:count i by class from `class xcol .statq.util.sel[t;c]
 };

/ *
/ * Computes mean squared deviation between actual and estimated values
/ * See https://en.wikipedia.org/wiki/Mean_squared_error
/ *
/ * @param {float list} y: actual values
/ * @param {float list} yhat: estimated values
/ * @returns {float}: mean squared error
/ * @example: .statq.validation.mse[1 1 6f;1 3 4f]
.statq.validation.mse:{[y;yhat]
    avg xexp[y-yhat;2]
 };

/ *
/ * Computes root of the mean squared deviation between actual and estimated values
/ * See https://en.wikipedia.org/wiki/Root-mean-square_deviation
/ *
/ * @param {float list} y: actual values
/ * @param {float list} yhat: estimated values
/ * @returns {float}: root mean square error
/ * @example: .statq.validation.rmse[1 1 6f;1 3 4f]
.statq.validation.rmse:{[y;yhat]
    sqrt .statq.validation.mse[y;yhat]
 };

/ *
/ * Computes mean absolute deviation between actual and estimated values
/ * See https://en.wikipedia.org/wiki/Mean_absolute_error
/ *
/ * @param {float list} y: actual values
/ * @param {float list} yhat: estimated values
/ * @returns {float}: mean absolute error
/ * @example: .statq.validation.mae[1 1 6f;1 3 4f]
.statq.validation.mae:{[y;yhat]
    avg abs y-yhat
 };

/ *
/ * Computes mean absolute percentage deviation between actual and estimated values
/ * See https://en.wikipedia.org/wiki/Mean_absolute_percentage_error
/ *
/ * @param {float list} y: actual values
/ * @param {float list} yhat: estimated values
/ * @returns {float}: mean absolute percentage error
/ * @example: .statq.validation.mape[1 1 6f;1 3 4f]
.statq.validation.mape:{[y;yhat]
    avg abs(y-yhat)%y
 };

/ *
/ * Computes matrix of errors for actual vs. estimated values
/ * See https://en.wikipedia.org/wiki/Confusion_matrix
/ *
/ * @param {float list} y: actual values
/ * @param {float list} yhat: estimated values
/ * @returns {table}: confusion matrix
/ * @example: .statq.validation.confusionmatrix[1101b;1001b]
.statq.validation.confusionmatrix:{[y;yhat]
    tp:count yhat where yhat and y;
    tn:count yhat where not[yhat]and not y;
    fp:count yhat where yhat and not y;
    fn:count yhat where not[yhat]and y;
    flip(``predictedpositive`predictednegative)!(`actualpositive`actualnegative;tp,fp;fn,tn)
 };

.statq.validation.accuracy:{[y;yhat]
    {(x[0]+x 3)%sum x}raze raze each 1_flip .statq.validation.confusionmatrix[.statq.math.round y;.statq.math.round yhat]
 };
