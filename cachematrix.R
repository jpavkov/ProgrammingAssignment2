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



## The cacheSolve function takes the object created from the function above and looks
## for the inverse of the matrix. If the object already has calculated it, then it will
## just pull in the inverse which is stored. If it doesn't already have it calculated,
## then it will calculate the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        im <- x$getinverse() 
        
        # checks to see if the inverse is already calculated
        if(!is.null(im)) { 
                message("getting inverse matrix")
                return(im) 
        }
        
        data <- x$get()        
        
        # if not already calculated, solves for the inverse of the matrix
        im <- solve(data, ...)   
        
        x$setinverse(im)           
        
        im       

}
