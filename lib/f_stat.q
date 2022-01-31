/ .stat.percentile[1 2 3 4 5;0.5]
.stat.percentile:{
    x min(-1+(#:)x),(_:)y*(#:)x:asc x
 };

/ .stat.matrix.identity[3]
.stat.matrix.identity:{
    (2#x)#1,x#0
 };

/ .stat.matrix.ols[(1 1 1f;1 5 4f);3 11 9f]
.stat.matrix.ols:{
    ((inv flip[x] mmu x) mmu flip x:flip x) mmu y
 };

.stat.dist.uniform:{
    x+(z?1f)*y-x
 };

.stat.econ.linreg:{
    ([]name:`const,-1_cols x;estimate:.stat.matrix.ols[-1_t;raze -1#t:{enlist[count[flip x]#1f],x}flip raze each x])
 };

.stat.econ.logreg:{
    
 };
