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

/ .stat.math.distance.euclidean[1 2 3 4f;5 6 7 8f]
.stat.math.distance.euclidean:{
    sqrt sum xexp[y-x;2]
 };

.stat.math.standardize:{
    (x-avg x)%dev x
 };

.stat.math.normalize:{
    (x-min x)%max[x]-min x
 };
