/ *
/ * .statq.matrix.identity: returns identity matrix of order x
/ * See https://en.wikipedia.org/wiki/Identity_matrix
/ *
/ * @param {int} x: order of identity matrix
/ * @returns {int matrix}
/ * @example: .statq.matrix.identity 3
.statq.matrix.identity:{
    (2#x)#1,x#0
 };

/ *
/ * .statq.matrix.ols: returns solution for y = x'beta
/ * See https://en.wikipedia.org/wiki/Ordinary_least_squares
/ *
/ * @param {float matrix} x: matrix of explanatory observations
/ * @param {float list} y: list of response observations
/ * @returns {float list}: beta estimates
/ * @example: .statq.matrix.ols[(1 1f;1 5f;1 4f);3 11 9f]
.statq.matrix.ols:{
    ((inv flip[x]mmu x)mmu flip x)mmu y
 };
