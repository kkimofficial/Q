.statq.validation.confusionmatrix:{[y;yhat]
    tp:count yhat where yhat and y;
    tn:count yhat where not[yhat] and not y;
    fp:count yhat where yhat and not y;
    fn:count yhat where not[yhat] and y;
    flip(``predictedpositive`predictednegative)!(`actualpositive`actualnegative;tp,fp;fn,tn)
 };

.statq.validation.classimbalance:{[t;c]
    `n xdesc select n:count i by class from `class xcol .statq.util.sel[t;c]
 };
