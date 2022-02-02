/ .stat.percentile[1 2 3 4 5;0.5]
.stat.percentile:{
    x min(-1+(#:)x),(_:)y*(#:)x:asc x
 };


/ .stat.linreg.insample ([] x1: 1 5 4f; y: 3 11 9f)
.stat.linreg.insample:{
    ([]coefficient:`intercept,-1_cols x;estimate:.stat.matrix.ols[-1_t;raze -1#t:{enlist[count[flip x]#1f],x}flip raze each x])
 };

.stat.linreg.outofsample:{

 };

.stat.linreg.report:{

 };
