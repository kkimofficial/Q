
/ *
/ * Ensures that input argument is a list
/ *
/ * @param {any} x: input to be converted to list
/ * @returns {any list}: enlisted value
/ * @example: .statq.collection.list[`a]
.statq.collection.list:{
    $[10h = abs type x;enlist x;(),x]
 };

/ *
/ * Creates a dictionary from inputs
/ *
/ * @param {any} k: keys
/ * @param {any} v: values
/ * @returns {dict}: key-value pairs
/ * @example: .statq.collection.dict[`a;1]
.statq.collection.dict:{[k;v]
    (.statq.collection.list[k]!.statq.collection.list v), .statq.collection.list[`]!.statq.collection.list (::)
 };
