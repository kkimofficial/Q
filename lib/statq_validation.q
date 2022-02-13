.statq.validation.confusionmatrix:{[y;yhat]
    tp:count yhat where yhat and y;
    tn:count yhat where not[yhat] and not y;
    fp:count yhat where yhat and not y;
    fn:count yhat where not[yhat] and y;
    flip(``predictedpositive`predictednegative)!(`actualpositive`actualnegative;tp,fp;fn,tn)
 };

.statq.validation.randomsplit:{[t;insampleratio]
    insample:(floor insampleratio*count t)#neg[count t]?count t;
    :(`insample`outofsample)!(select from t where i in insample;select from t where not i in insample);
 };

.statq.validation.simplesplit:{[t;insampleratio]
    insample:(floor insampleratio*count t)#til count t;
    :(`insample`outofsample)!(select from t where i in insample;select from t where not i in insample);
 };

/ .statq.validation.classimbalance[.statq.data.iris;`Species]
.statq.validation.classimbalance:{[t;c]
    `n xdesc select n:count i by class from `class xcol .statq.util.sel[t;c]
 };

.statq.validation.mse:{[y;yhat]
    avg xexp[y-yhat;2]
 };

.statq.validation.mae:{[y;yhat]
    avg abs y-yhat
 };
