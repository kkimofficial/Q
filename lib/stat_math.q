/ .stat.math.uniform[-1;1;100]
.stat.math.uniform:{
    x+(z?1f)*y-x
 };

/ .stat.math.percentile[1 2 3 4 5;0.5]
.stat.math.percentile:{
    x min(-1+(#:)x),(_:)y*(#:)x:asc x
 };

/ .stat.math.sigmoid 0.4
.stat.math.sigmoid:{
    1%1+exp neg x
 };
