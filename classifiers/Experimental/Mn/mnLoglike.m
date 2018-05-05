function loglike = mnLoglike(Y, X ,a)
    loglike = gammaln(sum(X+a)) - gammaln(sum(Y+X+a,2)) ...
        + sum(gammaln(X+Y+a) - gammaln(X+a),2);
end