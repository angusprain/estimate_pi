library(dplyr)

N <-100000
x <- runif(N, min = -1, max =1)
y <- runif(N, min = -1, max =1)
4*sum(sqrt(x^2+y^2) <= 1)/N

#plot(x,y, asp=1)


pi_est <- function(N){
  x <- runif(N, min = -1, max =1)
  y <- runif(N, min = -1, max =1)
  res <- 4*sum(sqrt(x^2+y^2) <= 1)/N
  return(res)
}

pi_est(100)


?powers 

indp <- seq(from = 1000, to = 1000000, length.out = 100)
#indp<-10^(1:8)
plot(indp, lapply(indp, pi_est) %>% unlist, type = 'l', 
     ylab = "estimate")
lines(indp, lapply(indp, pi_est2) %>% unlist, type = 'l', col = scales::alpha("blue", 0.8))
abline(pi, 0, col = scales::alpha("red", 0.5), lwd = 2)

# mean value

N<-100

trick_fun <- function(s){
  sqrt(1-s^2)
}

pi_est2 <- function(N){
  x<-runif(N, min = 0, max = 1)
  4*mean(trick_fun(x))
}






