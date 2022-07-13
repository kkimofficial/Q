
/ *
/ * Performs simple exponential smoothing for given timeseries
/ * See https://en.wikipedia.org/wiki/Exponential_smoothing
/ *
/ * @param {float} x: left bound
/ * @param {float} alpha: smoothing parameter
/ * @returns {float list}: exponentially weighted moving average
/ * @example: .statq.timeseries.ewma[5 10 15 20 25 30f;0.1f]
.statq.timeseries.ewma:{[x;alpha]
    {[x;y;alpha]
        ((1 - alpha) * x) + alpha * y
    }[;;alpha]\[x]
 };
 
 .statq.timeseries.acf:{[x;n]
    ([] lag: 1 + til n; correlation: cor[x;] each xprev[;x] each 1 + til n)
 };
