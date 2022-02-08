.statq.util.sel:{
    ((),y)#x
 };

/ .statq.util.table2matrix ([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f)
.statq.util.t2m:{
    flip value flip x
 };

.statq.util.required:{[p;arg]
    if[count arg:arg where not (arg:(),arg) in key p;'.Q.s1 arg];
 };

.statq.util.optional:{[p;arg;val]
    (((),arg)!((),val)),p
 };

/ .statq.util.construct[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~intercept+x1+x2"]
.statq.util.construct:{[t;e]
    lhs:$[1<count e:"~"vs ssr[e;" ";""];first e;()];
    rhs:"+"vs last e;
    if["intercept" in rhs;t:update intercept:1f from t;];
    :(`x`y)!(.statq.util.sel[t;`$rhs];$[count lhs;.statq.util.sel[t;`$lhs];()]);
 };

.statq.util.prepare:{[t;e]
    t:.statq.util.construct[t;e];
    (`x`y`colsx`colsy)!(.statq.util.table2matrix t`x;raze .statq.util.table2matrix t`y;cols t`x;cols t`y)
 };
