"""Optional SciPy adapter for Jensen-Shannon scoring."""


def boost_math_cdf(alpha, beta, x):
    # Import on use: frequent mining and isurp do not require SciPy.
    # Missing dependencies and invalid inputs must not silently produce a score.
    from scipy import stats

    return float(stats.beta.cdf(min(1.0, float(x)), float(alpha), float(beta)))
