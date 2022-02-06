.stat.util.sel:{
    ?[x;();0b;{x!x}(),y]
 };

/ .stat.util.table2matrix ([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f)
.stat.util.table2matrix:{
    flip value flip x
 };

.statq.util.required:{[d;arg]
    if[count arg:arg where not (arg:(),arg) in key d;'.Q.s1 arg];
 };

.statq.util.optional:{[d;arg;val]
    (((),arg)!((),val)),d
 };
