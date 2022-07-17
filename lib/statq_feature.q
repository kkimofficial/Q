.statq.feature.normalize:{[t;columns]
    flip {
        x[y]: .statq.math.normalize x y;
        x
    }/[flip t;.statq.util.list columns]
 };

.statq.feature.standardize:{[t;columns]
    flip {
        x[y]: .statq.math.standardize x y;
        x
    }/[flip t;.statq.util.list columns]
 };

.statq.feature.lag:{[t;columns;orders]
    flip {
        x[y]: z xprev x y;
        x
    }/[flip t;.statq.util.list columns;.statq.util.list orders]
 };

.statq.feature.diff:{[t;columns]
    flip {
        x[y]: 0,1_deltas x y;
        x
    }/[flip t;.statq.util.list columns]
 };

.statq.feature.dummyencode:{[t;columns;omitted]
    flip {
        (#[key[x]?y;key x],v,(1+key[x]?y)_key x)#x,(v:.statq.util.concat y cross v)!=/:[x y;v:distinct x[y]except z]
    }/[flip t;.statq.util.list columns;.statq.util.list omitted]
 };

.statq.feature.onehotencode:{[t;columns]
    .statq.feature.dummyencode[t;columns;count[columns]#`]
 };

/ .statq.feature.construct[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f);"y~intercept+x1+x2"]
.statq.feature.construct:{[t;e]
    lhs: $[1 < count e: "~" vs ssr[e;" ";""];first e;()];
    rhs: "+" vs last e;
    if["intercept" in rhs;
        t: update intercept: 1f from t;
    ];
    d: .statq.util.dict[`;`];
    d[`x]: .statq.util.table2matrix .statq.util.sel[t;rhs: `$rhs];
    d[`y]: raze .statq.util.table2matrix .statq.util.sel[t;lhs: `$lhs];
    d[`colsx]: cols .statq.util.sel[t;rhs];
    d[`colsy]: $[.statq.util.empty lhs;();cols .statq.util.sel[t;lhs]];
    :d;
 };
