# statq: basic machine learning library for kdb+/q

DISCLAIMER: THIS WORK IS NOT NECESSARILY A REPRESENTATION OF ANY PAST OR CURRENT EMPLOYER OF MINE

# * Linear Regression
```q
.statq.linreg.insample[([]x1:1 5 4f;x2:3 6 1f;y:3 11 9f);enlist[`equation]!enlist "y~intercept+x1"]
```
# * Logistic Regression
