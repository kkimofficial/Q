.stat.dist.uniform:{
    x+(z?1f)*y-x
 };

/ .stat.percentile[1 2 3 4 5;0.5]
.stat.percentile:{
    x min(-1+(#:)x),(_:)y*(#:)x:asc x
 };
