## Create matrix wrapper that can cache its own inverse
## This saves computation time, so we don't have to constantly recompute the inverse

## Create matrix that can cache its own inverse
## Has function
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setInverse <- function(value) inverse <<- value
  getInverse <- function() inverse
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}

## Function that calculates inverse of matrix
## Only recomputes inverse if value not already cached
cacheSolve <- function(x, ...) {
  inverse <- x$getInverse()
  if(is.null(inverse)) {
    message("recomputing data")
    inverse <- solve(x$get())
    x$setInverse(inverse)
  }
  inverse
}
