Least_moves<- function(k){
  i<-0
 while(k!=1){
    if(k%%2==0){
      k<-k/2
      i<-i+1
    }else{
      k<-k-1
      i<-i+1
    }
 }
  return(i)
}
Least_moves(211)

# good work
