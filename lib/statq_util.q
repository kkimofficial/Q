.statq.util.list:{
    $[10h = abs type x;enlist x;(),x]
 };

.statq.util.dict:{[k;v]
    (.statq.util.list[k]!.statq.util.list v),.statq.util.list[`]!.statq.util.list (::)
 };

.statq.util.sel:{[t;columns]
    if[all .statq.util.empty columns;
        :();
    ];
    .statq.util.list[columns]#t
 };

.statq.util.empty:{
    if[not count x; :1b; ];
    null x
 };

/ .statq.util.table2matrix ([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f)
.statq.util.table2matrix:{
    flip value flip x
 };

.statq.util.required:{[p;arg]
    $[not .statq.util.empty arg: arg where not (arg: .statq.util.list arg) in key p;'.Q.s1 arg;p]
 };

.statq.util.optional:{[p;arg;val]
    .statq.util.dict[arg;val],p
 };

.statq.util.concat:{
    `$$[all 1=count each x;sv["";]string x;sv["";]each string x]
 };
