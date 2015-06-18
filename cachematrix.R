## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(origMatrix = matrix()) {
    inverseMatrix <- NULL
    setMatrix <- function(newMatrix) {
        origMatrix <<- newMatrix
        inverseMatrix <<- NULL
    }
    getMatrix <- function() {
        origMatrix
    }
    setInverse <- function(inverse) {
        inverseMatrix <<- inverse
    }
    getInverse <- function() {
        inverseMatrix
    }
    list(setMatrix = setMatrix, getMatrix = getMatrix,
         setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(cacheMatrix, ...) {
        ## Return a matrix that is the inverse of 'x'
    if (is.null(cacheMatrix$getInverse())) {
        print("Calculating and caching the inverse matrix")
        cacheMatrix$setInverse(solve(cacheMatrix$getMatrix()))  
    } else {
        print("Inverse matrix is cached")
    }
    cacheMatrix$getInverse()
}
