## function makeCacheMatrix creates an object that returns a list. the object contains a matrix which
## is a part of the object upon instantiation.

makeCacheMatrix <- function(x = matrix()) {
        ## creates the object
        set <- function(y) {
                x <<- y
                im <<- NULL
        }
        
        im <- NULL
        
        ## retrieves the matrix upon calling the object
        get <- function() { 
                x 
        }  
        
        # sets the inverse
        setinverse <- function(solve)  { 
                im <<- solve 
        }
        
        ## if the inverse is already calculated, returns the precalculated number
        getinverse <- function() { 
                im 
        } 
        
        list(set = set,
             get = get,          
             setinverse = setinverse, 
             getinverse = getinverse) 
        
}
