M1    <- matrix(as.integer(runif(50,0,50)),nrow=5, ncol=10)
M1
M2    <- matrix(as.integer(runif(50,0,50)),nrow=5, ncol=10)
M2
Matrix_multip<-function(M1,M2){
  m<-nrow(M1)
  n<-ncol(M2)
  s<-matrix(0,m,n)
  for(i in 1:m)
    for(j in 1:n)
      s[i,j]<-sum(M1[i,]*M2[,j])
  return(s)
}
Matrix_multip(M1,M2)
