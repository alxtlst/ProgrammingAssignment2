## A pair of functions cache the inverse of a matrix.

## Holds the original matrix and it's inverse.
## input: the initial invertible matrix.
makeCacheMatrix <- function(origMatrix = matrix()) {
    #initialize the inverse matrix.
    inverseMatrix <- NULL
    
    ## Replaces the original matrix with a new one.
    ## Cache is cleared, as the inverse should be recalculated.
    ## input: an invertible matrix
    setMatrix <- function(newMatrix) {
        origMatrix <<- newMatrix
        inverseMatrix <<- NULL
    }
    
    ## Returns the original matrix.
    getMatrix <- function() {
        origMatrix
    }
    
    ## Put the calculated inverse matrix into cache.
    ## input: the calculated inverse of the original matrix.
    setInverse <- function(inverse) {
        inverseMatrix <<- inverse
    }
    
    ## Returns the cached inverse of the original matrix.
    ## Returns NULL if the inverse is not cached yet.
    getInverse <- function() {
        inverseMatrix
    }
    
    #Providing external access to the inner functions.
    list(setMatrix = setMatrix, getMatrix = getMatrix,
         setInverse = setInverse, getInverse = getInverse)
}


## Calculates inverse of a matrix, using cached inverse if available.
## input: function makeCacheMatrix containing the original matrix.
## output: the inverse of the original matrix.
cacheSolve <- function(cacheMatrix, ...) {
    if (is.null(cacheMatrix$getInverse())) {
        # If cache is empty, calculate and cache the inverse.
        print("Calculating and caching the inverse matrix")
        cacheMatrix$setInverse(solve(cacheMatrix$getMatrix()))  
    } else {
        # Else do nothing.
        print("Inverse matrix is cached")
    }
    # Return the cached inverse of the initial matrix.
    cacheMatrix$getInverse()
}
