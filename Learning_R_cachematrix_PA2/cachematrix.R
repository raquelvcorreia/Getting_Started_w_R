## Cache the inverse of a matrix and if the matrix does not change get the
##inverse from the cache instead of re-calculating the inverse of the matrix
## makeCacheMatrix will:

##1.  set the matrix and clear the matrix inverse value in cache (inMa set to
## Null)
##2.  get the matrix
##3.  set the value of the inverse matrix (setinverse)
##4.  get the value of the inverse matrix (getinverse)




makeCacheMatrix <- function(x = matrix()) {
  inMa <- NULL
  set <- function(y) {
    x <<- y
    inMa <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) { inMa <<- inv }
  getinverse <- function() inMa
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}





## cacheSolve will fist check if the inverse of the matrix x has been calculated
## before.  If it has, inMa is not Null, and the value of inMa will be returned
## after the message "getting cached inverse Matrix" . If not it will calculate
## the inverse of the matrix and returns it.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x', either from the cache,
        ## if it has calculated it before, or after calculating it
        ## if it is a new matrix

        inMa <- x$getinverse()
        if(!is.null(inMa)) {
          message("getting cached inverse Matrix")
          return(inMa)
        }
        matrix <- x$get()
        inMa <- solve(matrix, ...)
        x$setinverse(inMa)
        inMa
  }
