.statq.util.list:{
    $[10h = abs type x;enlist x;(),x]
 };

.statq.util.dict:{[k;v]
    (.statq.util.list[k]!.statq.util.list v),.statq.util.dict[`;::]
 };

.statq.util.sel:{[t;columns]
    .statq.util.list[columns]#t
 };

/ .statq.util.table2matrix ([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f)
.statq.util.table2matrix:{
    flip value flip x
 };

.statq.util.required:{[p;arg]
    $[count arg: arg where not (arg: .statq.util.list arg) in key p;'.Q.s1 arg;p]
 };

.statq.util.optional:{[p;arg;val]
    .statq.util.dict[arg;val],p
 };

.statq.util.concat:{
    `$$[all 1=count each x;sv["";]string x;sv["";]each string x]
 };

.statq.util.functionnamespace:{
    get"."sv -1_"."vs first -4#get x
 };
