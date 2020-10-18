Pascal_triangle <-function(k){
  n <- k-1
  s <- choose(n,k= 0:n)
  # it is really good for a researcher to use various useful tools to improve your work efficiency
  # but as a student, it is essential to know the basic principle，and write it by yourself
  # moreover, this is an introductory course for programing, the most important part is to:
  #   1   learn thinking a realistic problem with programing perspection
  #   2   coding by yourself to solve this problem
  return(s)
}
Pascal_triangle(100)
Pascal_triangle(200)  

