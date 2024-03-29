# Generate n-dimensional response Y that follows linear regression model Y = Xbeta + epsilon, where epsilon is normal zero with variance sigma^2 independent across samples. Seed should be set at the beginning of the function
# X - design matrix
# beta - given parameter vector
# sigma - standard deviation of the noise
# seed  - starting seed value
generateY <- function(X, beta, sigma, seed = 5832652){
  #[ToDo] Set seed and generate Y following linear model
  
  #I didn't set my seed on the first go
  set.seed(seed)
  Y = as.vector( X %*% as.matrix(beta) + 
                   as.matrix(rnorm(n = nrow(X) , mean = 0 , sd = sigma)))
  # Return Y
  return(Y)
}

# Calculate beta_LS - least-squares solution, do not use lm function
# X - design matrix
# Y -response
calculateBeta <- function(X, Y){
  
  ymatrix = as.matrix(Y)
  
  # Calculate beta_LS
  
  beta_LS = solve( crossprod(X) , crossprod(X,ymatrix) )
  
  # Return beta
  return(beta_LS)
}

# Calculate MSE
calculateMSE <- function(beta, beta_LS){
  
  error = as.matrix(beta) - as.matrix(beta_LS)
  MSE = as.vector(crossprod(error))
  # Return MSE - error ||beta - beta_LS||_2^2
  return(MSE)
}