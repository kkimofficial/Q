.statq.logreg.lossderivative:{[x;y;beta]
    (.statq.math.sigmoid[x mmu beta] - y) mmu x
 };

/ .statq.logreg.insample [([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 1 1 0 0f);(`equation`iterations`step)!("y~intercept+x1+x2";10000;0.1)]
.statq.logreg.insample:{[t;params]
    params: .statq.util.required[params;`equation];
    params: .statq.util.optional[params;`iterations`step;(1000;0.1)];
    t: .statq.feature.construct[t;] params`equation;
    beta: .statq.math.gd[;count[flip t`x]#1f;params`step;params`iterations] .statq.logreg.lossderivative[t`x;t`y;];
    yhat: .statq.math.sigmoid t[`x] mmu beta;
    :(`x`y`yhat`beta`equation)!(t`x;t`y;yhat;(`coefficient`estimate)!(t`colsx;beta);params`equation);
 };

.statq.logreg.outofsample:{[t;model]
    t: .statq.feature.construct[t;model`equation];
    yhat: .statq.math.sigmoid t[`x] mmu model[`beta]`estimate;
    :model,(`x`y`yhat)!(t`x;t`y;yhat);
 };
