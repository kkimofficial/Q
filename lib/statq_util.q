.statq.util.sel:{
    ?[x;();0b;{x!x}(),y]
 };

/ .statq.util.table2matrix ([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f)
.statq.util.table2matrix:{
    flip value flip x
 };

.statq.util.required:{[d;arg]
    if[count arg:arg where not (arg:(),arg) in key d;'.Q.s1 arg];
 };

.statq.util.optional:{[d;arg;val]
    (((),arg)!((),val)),d
 };

/ .statq.util.construct[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~intercept+x1+x2"]
.statq.util.construct:{[t;e]
    lhs:$[1<count e:"~"vs ssr[e;" ";""];first e;()];
    rhs:"+"vs last e;
    if["intercept" in rhs;t:update intercept:1f from t;];
    :(`x`y)!(.statq.util.sel[t;`$rhs];$[count lhs;.statq.util.sel[t;`$lhs];()]);
 };
