/ .stat.linreg.insample ([] x1: 1 5 4f; y: 3 11 9f)
.stat.linreg.insample:{
    yhat: flip[x] mmu beta:.stat.matrix.ols[x:-1_x;y:raze -1#x:{enlist[count[flip x]#1f],x}flip raze each t];
    rsqr: 1 - sum[rss:(y - yhat) xexp 2] % sum[tss:(y - avg y) xexp 2];
    :(`x`y`beta`rsqr)!(x;y;beta;rsqr);
 };

.stat.linreg.outofsample:{

 };

.stat.linreg.report:{

 };
