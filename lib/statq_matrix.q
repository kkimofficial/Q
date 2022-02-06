/ .statq.matrix.identity[3]
.statq.matrix.identity:{
    (2#x)#1,x#0
 };

/ .statq.matrix.ols[(1 1f;1 5f;1 4f);3 11 9f]
.statq.matrix.ols:{
    ((inv flip[x]mmu x)mmu flip x)mmu y
 };
