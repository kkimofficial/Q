.statq.validation.confusionmatrix:{[y;yhat]
    tp:count yhat where yhat and y;
    tn:count yhat where not[yhat] and not y;
    fp:count yhat where yhat and not y;
    fn:count yhat where not[yhat] and y;
    flip(``predictedpositive`predictednegative)!(`actualpositive`actualnegative;tp,fp;fn,tn)
 };

.statq.validation.split:{[t;insampleratio]
    insample:(floor insampleratio*count insample)#insample:neg[count t]?count t;
    :(`insample`outofsample)!(select from t where i in insample;select from t where not i in insample);
 };

/ .statq.validation.classimbalance[.statq.data.iris;`Species]
.statq.validation.classimbalance:{[t;c]
    `n xdesc select n:count i by class from `class xcol .statq.util.sel[t;c]
 };
