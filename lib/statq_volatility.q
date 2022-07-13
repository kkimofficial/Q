/ *
/ * Performs exponential smoothing for given timeseries
/ * See https://en.wikipedia.org/wiki/Exponential_smoothing
/ *
/ * @param {float} x: left bound
/ * @param {float} alpha: smoothing parameter
/ * @returns {float list}: exponentially weighted moving average
/ * @example: .statq.volatility.ewma[5 10 15 20 25 30f;0.1f]
.statq.volatility.ewma:{[x;alpha]
    {[x;y;alpha]((1-alpha)*x)+alpha*y}[;;alpha]\[x]
 };
