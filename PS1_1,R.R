
Print_values<-function(a,b,c){
  if (a>b&&a>c){
    if(b>c){
      print(c(a,b,c))
    }else{
      print(c(a,c,b))
    }
  }else if(b>c){
    if(a>c){
      print(c(b,a,c))
    }else{
      print(c(b,c,a))
    }
  } else{
    if(a>b){
      print(c(c,a,b))
    }else{
      print(c(c,b,a))
    }
  }
}
Print_values(5,111,22)


  