

.statq.validation.randomsplit:{[t;insampleratio]
    insample:(floor insampleratio*count t)#neg[count t]?count t;
    :(`insample`outofsample)!(select from t where i in insample;select from t where not i in insample);
 };

.statq.validation.simplesplit:{[t;insampleratio]
    insample:(floor insampleratio*count t)#til count t;
    :(`insample`outofsample)!(select from t where i in insample;select from t where not i in insample);
 };

.statq.validation.bootstrap:{[t;n]
    n?t
 };

/ .statq.validation.classimbalance[.statq.data.iris;`Species]
.statq.validation.classimbalance:{[t;c]
    `n xdesc select n:count i by class from `class xcol .statq.util.sel[t;c]
 };

/ *
/ * .statq.validation.mse: computes mean squared deviation between actual and estimated values
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
/ * .statq.validation.rmse: computes root of the mean squared deviation between actual and estimated values
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
/ * .statq.validation.mae: computes mean absolute deviation between actual and estimated values
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
/ * .statq.validation.mape: computes mean absolute percentage deviation between actual and estimated values
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
/ * .statq.validation.confusionmatrix: computes matrix of errors for actual vs. estimated values
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
