Pascal_triangle <-function(k){
  n <- k-1
  s <- choose(n,k= 0:n)
  return(s)
}
Pascal_triangle(100)
Pascal_triangle(200)  

