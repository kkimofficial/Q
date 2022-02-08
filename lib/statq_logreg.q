.statq.logreg.lossgd:{[x;y;beta]
    (.statq.math.sigmoid[x mmu beta]-y)mmu x
 };

/ .statq.logreg.insample [([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 1 1 0 0f);(`equation`iterations`step)!("y~intercept+x1+x2";10000;0.1)]
.statq.logreg.insample:{[t;p]
    t:.statq.util.prepare[t;](p:.statq.util.optional[;`iterations`step;(1000;0.1)].statq.util.required[p;`equation])`equation;
    yhat:.statq.math.sigmoid t[`x]mmu beta:.statq.math.gd[;count[flip t`x]#1f;p`step;p`iterations] .statq.logreg.lossgd[t`x;t`y;];
    :(`x`y`yhat`beta`equation)!(t`x;t`y;yhat;(`coefficient`estimate)!(t`colsx;beta);p`equation);
 };
