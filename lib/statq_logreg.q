/ .statq.logreg.insample [([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 1 1 0 0f);(`equation`iterations`step)!("y~intercept+x1+x2";10000;0.1)]
.statq.logreg.insample:{[t;d]
    .statq.util.required[d;`equation];
    d:.statq.util.optional[d;`iterations`step;(1000;0.1)];
    t:.statq.util.construct[t;d`equation];
    y:raze .statq.util.table2matrix t`y;
    x:.statq.util.table2matrix t`x;
    beta:d[`iterations]{[beta;x;y;alpha]beta-alpha*(.statq.math.sigmoid[x mmu beta]-y)mmu x}[;x;y;d`step]/count[flip x]#1f;
    yhat:.statq.math.sigmoid x mmu beta;
    :(`x`y`yhat`beta`equation)!(x;y;yhat;(`coefficient`estimate)!(cols t`x;beta);d`equation);
 };
