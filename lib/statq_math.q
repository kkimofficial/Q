/ .statq.math.uniform[-1;1;100]
.statq.math.runiform:{
    x+(z?1f)*y-x
 };

/ *
/ * .statq.math.percentile:
/ * See https://en.wikipedia.org/wiki/Percentile
/ *
/ * @param {float list} x:
/ * @param {float} y:
/ * @returns {float}: 
/ * @example: .statq.math.percentile[1 2 3 4 5f;0.5]
.statq.math.percentile:{
    x min(-1+(#:)x),(_:)y*(#:)x:asc x
 };

/ *
/ * .statq.math.round: computes the nearest integer
/ * See https://en.wikipedia.org/wiki/Rounding
/ *
/ * @param {float} x: number to round
/ * @returns {int}: rounded value
/ * @example: .statq.math.round 0.6
.statq.math.round:{
    floor x+0.5
 };

/ .statq.math.sigmoid 0.4
.statq.math.sigmoid:{
    1%1+exp neg x
 };

/ .statq.math.distance.euclidean[1 2 3 4f;5 6 7 8f]
.statq.math.distance.euclidean:{
    sqrt sum xexp[y-x;2]
 };

.statq.math.standardize:{
    (x-avg x)%dev x
 };

.statq.math.normalize:{
    (x-min x)%max[x]-min x
 };

/ *
/ * .statq.math.gd: performs a gradient descent over a loss derivative function
/ * See https://en.wikipedia.org/wiki/Gradient_descent
/ *
/ * @param {function} derivative: loss derivative function
/ * @param {float list} beta: initial value of parameters
/ * @param {float} step: alpha of gradient descent
/ * @param {int} iterations: number of iterations to perform gradient descent
/ * @returns {float list}: 
/ * @example: 
.statq.math.gd:{[derivative;beta;step;iterations]
    iterations{[beta;f;alpha]beta-alpha*f beta}[;derivative;step]/beta
 };
