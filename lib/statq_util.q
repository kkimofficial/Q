/ *
/ * Ensures that input argument is a list
/ *
/ * @param {any} x: input to be converted to list
/ * @returns {any list}: enlisted value
/ * @example: .statq.util.list[`a]
.statq.util.list:{
    $[10h = abs type x;enlist x;(),x]
 };

/ *
/ * Creates a dictionary from inputs
/ *
/ * @param {any} k: keys
/ * @param {any} v: values
/ * @returns {dict}: key-value pairs
/ * @example: .statq.util.dict[`a;1]
.statq.util.dict:{[k;v]
    (.statq.util.list[k]!.statq.util.list v),.statq.util.list[`]!.statq.util.list (::)
 };

.statq.util.sel:{[t;columns]
    if[.statq.util.empty columns;
        :();
    ];
    .statq.util.list[columns]#t
 };

.statq.util.empty:{
    if[not count x; :1b; ];
    all null x
 };

/ *
/ * Converts table to a matrix
/ *
/ * @param {table} t: table
/ * @returns {any list}: matrix
/ * @example: .statq.util.table2matrix[([] x1: 1 5 200 0.5f; x2: 6 3 40 1f; y: 3 11 100 2f)]
.statq.util.table2matrix:{[t]
    flip value flip t
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
