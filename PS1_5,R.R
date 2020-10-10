nums <- c(1,2,3,4,5,6,7,8,9)
sum <- 0
Find_expression <- function(x){
  for(o in 1:3^8){
    b <- "1"
    result <- 0
    temp <- nums[1]
    for(i in 1:8){
      bit <- (o%/%(3^(i-1))) %% 3
      if(bit == 0){
        b <- paste(b,"+",sep = "")
        result <- result + temp
        temp <- nums[i+1]
      }
      else if(bit == 1){
        b <- paste(b,"-",sep = "")
        result <- result + temp
        temp <- -nums[i+1]
      }else{
        if(temp > 0){
          temp <- 10*temp + nums[i+1]
        }else{
          temp <- 10*temp - nums[i+1]
        }
      }
      b <- paste(b,nums[i+1],sep = "")
    }
    result <- result + temp
    b <- paste(b, "=",sep = "")
    b <- paste(b,result,sep = "")
    
    if(result == x){
      sum <- sum + 1
      print(b)
    }
  }
  print(sum)
}
Find_expression(58)
