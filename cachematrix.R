## ## This function creates a numeric "matrix" object that can 
## cache its inverse

## First, this function creates a special "vector", which is 
## really a list containing a function to 
## set the value of the matrix
## get the value of the matrix
## set the value of this matrix inverse
## get the value of this matrix inverse


makeCacheMatrix <- function(x = matrix()) 
{
  
  ## initialize matrix_inverse to NULL
  matrix_inverse <- NULL
  
  ## define a function named set. this function sets the value 
  ## of a matrix y
  set <- function(y) 
  {
    ## assing the value of matrix y into variable x
    x <<- y
    
    ## initialize the inversed matrix to NULL
    matrix_inverse <<- NULL
  }
  
  ## define the function to get the value of matrix x
  get <- function() x
  
  ## define the function to set the inverse of matrix x
  setinverse <- function(inverse) matrix_inverse <<- inverse
  
  ## define the function to get the inverse of matrix x
  getinverse <- function() matrix_inverse
  
  ## make a list
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)  
}


## Second, this function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix above.If the inverse 
## has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) 
{
  
  matrix_inverse <- x$getinverse()
  if(!is.null(matrix_inverse)) 
  {
    ## If matrix_inverse is not NULL, just get it and return the
    ## the value of the inverse of the matrix
    
    message("getting cached inverse data")
    return(matrix_inverse)
  }
  
  ## if matrix_inverse is NULL, get the value of the matrix x 
  ## and put it into varible "data", use function "solve" to 
  ## calculate the inverse value of the matrix and put the 
  ## result to the varible matrix_inverse.  
  data <- x$get()
  matrix_inverse <- solve(data, ...)
  
  ## Then set the value of matrix_inverse to setinverse and 
  ## finally return the  matrix_inverse that is the inverse 
  ## of matrix x
  
  x$setinverse(matrix_inverse)
  matrix_inverse
}
