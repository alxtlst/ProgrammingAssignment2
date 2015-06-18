source("cachematrix.R")

testCacheSolve <- function() {
    origMatrix <- matrix(1:4, 2, 2)
    cacheMatrix = makeCacheMatrix(origMatrix)
    for (i in 1:3) {
        inverse = cacheSolve(cacheMatrix)
        str(inverse)
    }
    origMatrix <- matrix(rnorm(9, 1, 9), 3, 3)
    cacheMatrix$setMatrix(origMatrix)
    for (i in 1:3) {
        inverse = cacheSolve(cacheMatrix)
        str(inverse)
    }
}