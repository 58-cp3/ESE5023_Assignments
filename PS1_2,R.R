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
    # rewrite this part
  return(s)
}
Matrix_multip(M1,M2)
#please verify it by M1%*%M2， and you will find your program is wrong
# 1st  the definition of matrix is incorrect, in order to multiply M1 with M2, basically if  M1 is m×n，M2 must be n×m
# 2nd  if you can give an answer of M1*M2,and both matrix is m×n（m≠n）,it is obviously wrong.
# 3rd  principally, your methodology is right,but "M1[i,]*M2[,j]" is also a matrix multiply calculation, rewrite it with elementary mathematics through the for loop
