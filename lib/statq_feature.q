.statq.feature.normalize:{[t;col]
    flip{[x;y]x[y]:.statq.math.normalize x y;x}/[flip t;(),col]
 };

.statq.feature.standardize:{[t;col]
    flip{[x;y]x[y]:.statq.math.standardize x y;x}/[flip t;(),col]
 };
