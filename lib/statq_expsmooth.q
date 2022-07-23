/ *
/ * Performs simple exponential smoothing for a given timeseries
/ * See https://en.wikipedia.org/wiki/Exponential_smoothing
/ *
/ * @param {float} x: left bound
/ * @param {float} alpha: smoothing parameter
/ * @returns {float list}: exponentially weighted moving average
/ * @example: .statq.expsmooth.ewma[5 10 15 20 25 30f;0.1f]
.statq.expsmooth.ewma:{[x;alpha]
    {[x;y;alpha]
        x + alpha * y - x
    }[;;alpha]\[x]
 };
