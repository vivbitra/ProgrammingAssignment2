## These functions cache the inverse calculated for a matrix and when 
## inverse of same matrix is required in future, the cached values are retrived

## makeCacheMatrix function create a matrix object that can cache its solve(inverse) values.

makeCacheMatrix <- function(x = matrix()) {
        inverse<- NULL
        set<-function(y){
                x<<-y
                inverse<-NULL
        }
        get<-function() x
        setsolve<-function(solve) inverse<<- solve
        getsolve<- funcion() inverse
        list(set = set, get=get, setsolve= setsolve, getsolve=getsolve)

}


## This function calculates inverse of matrix returned from function above. if it is already
## calculated, then it retrieves the cached value. If its not, then caches the solve through
## set solve.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse<-x$getsolve()
        if(!is.null(inverse))
        {
                message("getting cached data")
                return(inverse)
        }
        data<-x$get()
        inverse<-solve(data, ...)
        x$setsolve()
        inverse
}
