/ .statq.logreg.insample [([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 1 1 0 0f);"y~intercept+x1+x2"]
.statq.logreg.insample:{[t;e]
    t:.stat.linreg.construct[t;e];
    y:raze .stat.util.table2matrix(-1#cols t)#t;
    x:.stat.util.table2matrix(-1_cols t)#t;
    beta:100000{[beta;x;y]beta-0.1*(.stat.math.sigmoid[x mmu beta]-y)mmu x}[;x;y]/count[flip x]#1f;
    yhat:.stat.math.sigmoid x mmu beta;
    :(`x`y`yhat`beta`equation)!(x;y;yhat;(`coefficient`estimate)!(-1_cols t;beta);e);
 };
