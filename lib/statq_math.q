/ *
/ * Performs sampling from uniform distribution within given bounds
/ * See https://en.wikipedia.org/wiki/Continuous_uniform_distribution
/ *
/ * @param {float} x: left bound
/ * @param {float} y: right bound
/ * @param {float} z: sample size
/ * @returns {float list}: 
/ * @example: .statq.math.uniform[-1;1;100]
.statq.math.runiform:{
    x + (z?1f) * y - x
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
/ * Computes the nearest integer
/ * See https://en.wikipedia.org/wiki/Rounding
/ *
/ * @param {float} x: number to round
/ * @returns {int}: rounded value
/ * @example: .statq.math.round 0.6
.statq.math.round:{
    floor x + 0.5
 };

/ *
/ * Computes sigmoid (inverse logit) function
/ * See https://en.wikipedia.org/wiki/Sigmoid_function
/ *
/ * @param {float} x: argument value
/ * @returns {int}: inverse logit value
/ * @example: .statq.math.sigmoid 0.4
.statq.math.sigmoid:{
    1 % 1 + exp neg x
 };

/ *
/ * Computes the Euclidian distance between two points
/ * See https://en.wikipedia.org/wiki/Euclidean_distance
/ *
/ * @param {float} x: first point coordinates
/ * @param {float} y: second point coordinates
/ * @returns {float}: Euclidian distance between two points
/ * @example: .statq.math.distance.euclidean[1 2 3f;5 6 7f]
.statq.math.distance.euclidean:{
    sqrt sum xexp[y - x;2]
 };

.statq.math.standardize:{
    (x - avg x) % dev x
 };

.statq.math.normalize:{
    (x - min x) % max[x] - min x
 };

/ *
/ * Performs a gradient descent over a derivative function
/ * See https://en.wikipedia.org/wiki/Gradient_descent
/ *
/ * @param {function} derivative: derivative function
/ * @param {float list} beta: initial value of parameters
/ * @param {float} step: alpha of gradient descent
/ * @param {int} iterations: number of iterations to perform gradient descent
/ * @returns {float list}: argument at which the value of function (from which derivative is taken) is minimized
/ * @example: .statq.math.gd[{(2 * x) - 4};1;0.1;100]
.statq.math.gd:{[derivative;beta;step;iterations]
    iterations {[beta;f;alpha]
        beta - alpha * f beta
    }[;derivative;step]/beta
 };
