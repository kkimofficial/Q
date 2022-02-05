/ .stat.matrix.identity[3]
.stat.matrix.identity:{
    (2#x)#1,x#0
 };

/ .stat.matrix.ols[(1 1f;1 5f;1 4f);3 11 9f]
.stat.matrix.ols:{
    ((inv flip[x]mmu x)mmu flip x)mmu y
 };
