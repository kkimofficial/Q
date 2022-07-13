
 .statq.timeseries.acf:{[x;n]
    ([] lag: 1 + til n; correlation: cor[x;] each xprev[;x] each 1 + til n)
 };
