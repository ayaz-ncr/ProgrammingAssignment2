<<<<<<< HEAD
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
        setinv <- function(solve) inv <<- solve 
        getinv <- function() inv

# following code assigns above functions as named elements of list and returns it to the parent environment
        
        list(set = set, get = get,
        setinv = setinv,
        getinv = getinv)
=======
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
>>>>>>> 7a38a6582af10c1d71766d411fcd556e36cb252c
}


## cacheSolve function accepts a matrix of type makeCacheMatrix and returns a matrix that is inverse of it
## if the inverse exists in cache it is picked from there
## else the inverse of matrix is calculated using solve function of R
## setinv() function is used to set the inverse in the input object

cacheSolve <- function(x, ...) {
<<<<<<< HEAD

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
=======
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
>>>>>>> 7a38a6582af10c1d71766d411fcd556e36cb252c

# TO CHECK
# matrix1<-matrix(2:5, nrow=2, ncol=2)
# amatrix1<-makeCacheMatrix(matrix1)
# amatrix1$get()
# amatrix1$getinv()
# cacheSolve(amatrix1)
# amatrix1$getinv()
# cacheSolve(amatrix1) -- gets cached data
