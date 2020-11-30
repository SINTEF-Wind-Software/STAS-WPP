function p = mvnorml (x,mu,sig)

r = chol(sig);
p = log((2*pi)^(-size(x,1)/2))      ...
  - (sumsq (((x-mu).')*inv(r),2)/2) ...
  - log(prod (diag (r)));