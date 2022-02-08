.statq.logreg.lossgd:{[x;y;beta]
    (.statq.math.sigmoid[x mmu beta]-y)mmu x
 };

/ .statq.logreg.insample [([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 1 1 0 0f);(`equation`iterations`step)!("y~intercept+x1+x2";10000;0.1)]
.statq.logreg.insample:{[t;d]
    .statq.util.required[d;`equation];
    d:.statq.util.optional[d;`iterations`step;(1000;0.1)];
    t:.statq.util.construct[t;d`equation];
    x:.statq.util.table2matrix t`x;
    beta:.statq.math.gd[.statq.logreg.lossgd[x;y:raze .statq.util.table2matrix t`y;];count[flip x]#1f;d`step;d`iterations];
    yhat:.statq.math.sigmoid x mmu beta;
    :(`x`y`yhat`beta`equation)!(x;y;yhat;(`coefficient`estimate)!(cols t`x;beta);d`equation);
 };
