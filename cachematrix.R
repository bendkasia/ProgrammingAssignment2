## This pair of functions creates a matrix whose inverse is cached, 
#so that it may be used repeatedly without having to be recalculated.


## This function creates a special "matrix" object that can cache its inverse.
## Use a<-makeCacheMatrix(matrix(c(vector),number of rows,number of cols))
## call cacheSolve(a)to retrieve inverse



makeCacheMatrix <- function(x = matrix()) {
  m<- NULL
  set <- function(y){
    x <<- y
    m<<- NULL
    }
  get<- function()x
  set_inverse<-function(solve) m <<- solve
  get_inverse <-function() m
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
  
  
  

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
##should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  m <- x$get_inverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
     
  }
  data <- x$get()
  m <- solve(data, ...)
  x$set_inverse(m)
  m
   
}
