##This file contains to function for creating and getting a Cached Matrix. 
# A Cached Matrix is matrix that has its inverse cached for rapid retrival 
#to speed up computation. 

## MakeCacheMatrix function is directly modeled after the function 
#from Roger Peng. 
#Make Cache Matrix creats a list of containg four functions: set, get, getInverse, setInverse.

makeCacheMatrix <- function(x = matrix()) {
        Inverse <- NULL                                                                 
        set <- function(y) {
                x <<- y
                Inverse <<- NULL
        }
        get <- function() {x}
        setInverse <- function(solve) {Inverse <<- solve}
        getInverse <- function() {Inverse}
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


s
## This function solves for the inverse of a cached Matrix.
#If first checks to see if the matrix has already been sovled if so, it returns the cached solution. 
#If a cached Inverse is not present, it solves for the inverse and returns it. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        Inverse<-x$getInverse()
        if(!is.null(Inverse)){
                message("getting cached data")
                return(Inverse)
        }
        data <- x$get()
        Inverse <-  solve(data,...)
        x$setInverse(Inverse)
        Inverse
}
