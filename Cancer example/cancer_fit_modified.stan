data {
  int N; //number of observations
  int y[N]; //observed cases at each observations
  vector[N] pop; //population at each observation
}

parameters {
  vector<lower=0,upper=1>[N] theta;//estimated death parameters
}
transformed parameters {
  vector[N] lambda=pop .* theta;
}

model {
  theta ~ gamma(20,430000);
  y ~ poisson(lambda);
}
