## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## comments added to specific lines
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL   # initializing argument to NULL matrix and inv to NULL
  set <- function(y) {
    x <<- y      # assign the value of input argument (matrix in this case) passed in set function to x in parent environment
    inv <<- NULL # # assigns the NULL value to m in parent environment, so whenever the set function is called earlier value of inv in cache is cleared
  }
  get <- function() x  # since x is not defined in function get, its value is retrieved from parent environment of makeCacheMatrix
  setinv <- function(solve) inv <<- solve  # assigns the input argument to inv in the parent environment.
  getinv <- function() inv

# following code assigns above functions as named elements of list and returns it to the parent environment
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
 
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
# If the result of If condition is FALSE, cacheSolve() gets the matrix from the input object,
  data <- x$get()
# inverse of matrix is calculated using solve function of R
  inv <- solve(data, ...)
# setinv() function is used to set the inverse in the input object
  x$setinv(inv)
# inverse is returned to the parent environment 
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
