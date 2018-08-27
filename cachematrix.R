## makeCacheMatrix.R function receives a matrix as an argument and has 4 nested functions to set and get the matrix and its inverse
## It uses special assignment operator <<- to cache values in variables in the parent environment
## This helps to reduce the calculations for costly operations like inverse of matrix and value is instead taken from the cache

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL   
  
  set <- function(y) {
    x <<- y      
    inv <<- NULL 
  }
  
  get <- function() x  
  setinv <- function(mat_inv) inv <<- mat_inv 
  getinv <- function() inv
  
  # following code assigns above functions as named elements of list and returns it to the parent environment
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve function accepts a matrix of type makeCacheMatrix and returns a matrix that is inverse of it
## if the inverse exists in cache it is picked from there
## else the inverse of matrix is calculated using solve function of R
## setinv() function is used to set the inverse in the input object

cacheSolve <- function(x, ...) {
  
  inv <- x$getinv()
  
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}

# TO CHECK
# matrix1<-matrix(2:5, nrow=2, ncol=2)
# amatrix1<-makeCacheMatrix(matrix1)
# amatrix1$get()
# amatrix1$getinv()
# cacheSolve(amatrix1)
# amatrix1$getinv()
# cacheSolve(amatrix1) -- gets cached data