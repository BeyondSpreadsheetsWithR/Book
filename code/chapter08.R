## ----comparing two vectors one of which only has one element-------------
c(6, 5, 4, 5, 7, 4) > 5

## ----storing a vector in a variable--------------------------------------
test_nums <- c(6, 5, 4, 5, 7, 4)

## ----comparing each element one by one-----------------------------------
is_test_nums_gt_5 <- c(
  test_nums[1] > 5,
  test_nums[2] > 5,
  test_nums[3] > 5,
  test_nums[4] > 5,
  test_nums[5] > 5,
  test_nums[6] > 5
)
is_test_nums_gt_5

## ----comparing each element using a sequence-----------------------------
test_nums[1:6] > 5

## ----comparing the vector all at once------------------------------------
test_nums > 5

## ----loading and attaching the purrr package-----------------------------
# install.packages("purrr")
library(purrr)

## ----taking the square root of 9-----------------------------------------
sqrt(9)

## ----taking the square root of a vector via map--------------------------
map(c(4, 9, 16, 25), sqrt)

## ----using map_dbl to explicitly return a vector of doubles--------------
map_dbl(c(4, 9, 16, 25), sqrt)

## ----using map_chr to explicitly return a vector of characters-----------
map_chr(c(4, 9, 16, 25), sqrt)

## ----selecting two random rows from mtcars-------------------------------
set.seed(2)
dplyr::sample_n(tbl = mtcars, size = 2)

## ----using map to select two three and two rows from mtcars--------------
set.seed(2)
map(c(2, 3, 2), dplyr::sample_n, tbl = mtcars) 

## ----using map_df to explicitly return a data.frame----------------------
set.seed(2)
map_df(c(2, 3, 2), dplyr::sample_n, tbl = mtcars) 

## ----a function which prints a custom statement--------------------------
print_value <- function(x) {
  print(paste("The value of x is ", x))
}

## ----using map to loop over the function returns the result--------------
ans_map <- map(1:3, print_value)
ans_map

## ----using walk to loop over the function does not visibly return the result----
walk(1:3, print_value)

## ----the returned value is available if needed---------------------------
ans_walk <- walk(1:3, print_value)
ans_walk

## ----using an unnamed function which has argument .x---------------------
map_dbl(c(4, 5, 6), ~ .x + 1) 

## ----creating a function to perform the comparison-----------------------
compare_to_five <- function(value) { 
  return(value > 5)                  
}

## ----explicitly returning a logical vector-------------------------------
map_lgl(test_nums, compare_to_five)

## ----our function is automatically vectorized----------------------------
compare_to_five(test_nums)

## ----sapply is a predecessor of map--------------------------------------
sapply(test_nums, compare_to_five)

## ----a loop which does nothing but does iterate i------------------------
for (i in 1:3) {
  ## do nothing
}
print(i) ## after the loop

## ----looping over elements of test_nums----------------------------------
for (i in 1:6) {
  print(test_nums[i] > 5) 
}

## ----storing elements one by one-----------------------------------------
greater_than_5 <- c()  
for (i in 1:6) {
  greater_than_5[i] <- test_nums[i] > 5
}

## ----an empty object-----------------------------------------------------
c()

## ----an empty vector of length six---------------------------------------
vector(length = 6)

## ----a vector of NA values of length six---------------------------------
rep(NA, 6) 

## ----growing an object by adding to the end of something-----------------
some_values <- c()
for (i in 1:100) {
  some_values <- c(some_values, i) 
}

## ----starting with a vector of the right size----------------------------
all_values <- rep(NA, 100)
for (i in 1:100) {
  all_values[i] <- i
}

## ----comparing the two results-------------------------------------------
identical(all_values, some_values)

## ----printing within a conditional loop----------------------------------
## 6 cylinder automatics in mtcars
for (auto_6cyl in row.names(mtcars[mtcars$cyl == 6 & mtcars$am == 1, ])) {
  print(auto_6cyl)
}

## ----a loop which prints the iterator------------------------------------
for (i in 1:3) {
  message("starting i = ", i)
}

## ----a loop which prints the iterator but also changes the iterator------
for (i in 1:3) {
  message("starting i = ", i)
  i <- 7
}

## ----changing the iterator means it takes that value until the end-------
for (i in 1:3) {
  i <- 7
  message("ending i = ", i)
}

## ----creating a small matrix---------------------------------------------
m <- matrix(letters[1:6], nrow = 2, ncol = 3, byrow = TRUE)
m

## ----looping over the matrix rows and columns----------------------------
for (row in 1:2) {
  for (col in 1:3) {
    print(paste0("m[", row, ", ", col, "] = ", m[row, col]))
  }
}

## ----we can create conditions for loops so they never evaluate-----------
while (1 == 2) {
  print("this line will not be printed")
}

## ----the condition needs to be valid at the time of evaluation-----------
i <- 0           
while (i < 3) {  
  print(i)       
  i <- i + 1     
}

## ----variables used in the loop condition retain their scope-------------
i <- 1          
while (i < 4) { 
  i <- i + 1    
}
print(i)        

## ----conditionally evaluating based on a condition-----------------------
x <- 5 
if (x > 3) { 
  print("x is greater than 3") 
}

## ----lazy evaluation means that the body of the loop is never evaluated----
x <- 5
if (x < 2) {
  print(object_that_doesnt_exist)
}

## ----this will fail because the condition is NA, eval = FALSE------------
## x <- NA
## if (x > 3) {
##   print("x is greater than 3")
## }

## ----testing based on the logical value of x-----------------------------
x <- TRUE
if (x) {
  print("do all the things")
}

## ----neglecting braces is valid but dangerous----------------------------
x <- 5
if (x > 3)
  print("x is greater than 3")

## ----accidentally using more than one line without braces, eval = FALSE----
## x <- 5
## if (x > 3) 
##   print("x is greater than 3")
##   print("this should only appear when x > 3") 
## 
## x <- 2
## if (x > 3)
##   print("x is greater than 3")
##   print("this should only appear when x > 3") 

## ----this part of the code seems to be working normally, eval = FALSE----
## x <- 5
## if (x > 3)
##   print("x is greater than 3")
##   print("this should only appear when x > 3")
## #> [1] "x is greater than 3"
## #> [1] "this should only appear when x > 3"

## ----this part of the code does not do what we expected, eval = FALSE----
## x <- 2
## if (x > 3)
##   print("x is greater than 3")
##   print("this should only appear when x > 3")
## #> [1] "this should only appear when x > 3"

## ----using an else statement in a test-----------------------------------
x <- 5
if (x > 3) {
  print("x is greater than 3")
} else {
  print("x is less than 3")
}

## ----make sure to only use one statement per line------------------------
x <- 5
if (x > 3) print("x is greater than 3") else print("x is less than 3") 

## ----multiple levels of testing------------------------------------------
x <- 5
if (x > 6) {
  print("x is greater than 6")
} else if (x > 4) {
  print("x is greater than 4")
} else {
  print("x is less than 5")
}

## ----lazy evaluation of if block conditions------------------------------
x <- 5
if (x > 3) { 
  print("x is greater than 3")
} else if (nonesense) { 
  print("how did I get here?")
}

## ----overlapping conditions----------------------------------------------
x <- 3
if (x > 2) {
  print("x is greater than 2")
} else if (x > 1) {
  print("x is greater than 1")
} else {
  print("x is smaller than 1 and 2")
}

## ----assigning a value based on an if block------------------------------
x <- 5
y <- if (x < 3) "small" else "big"
y

## ----equivalently assigning within a block-------------------------------
x <- 5
if (x < 3) {
  y <- "small"
} else {
  y <- "big"
}
y

## ----testing multiple conditions at once produces a warning--------------
if (c(1, 2, 3) > 2) { print("TRUE") }

## ----the type of value returned depends on the test condition------------
ifelse(TRUE, "a string", 7L)
ifelse(FALSE, "a string", 7L)

## ----testing NA results in NA--------------------------------------------
ifelse(NA, "test was TRUE", "test was FALSE")

## ----lazy evaluation of test results-------------------------------------
ifelse(FALSE, undefined_variable, 8L)

## ----the value returned from a test is the same shape as the condition----
ifelse(TRUE, c(2, 3), "z") 

## ----a longer test argument results in the returned value being recycled----
ifelse(c(TRUE, TRUE), 3, "z") 

## ----all elements of returned vectors need to be valid-------------------
ifelse(c(TRUE, FALSE), c(3, 9), c(9, 3)) 

## ----this will fail because not_a_var is not defined, eval = FALSE-------
## ifelse(c(TRUE, FALSE), c(3, not_a_var), c(9, 3))

## ----a vector with positive and negative values--------------------------
x <- -3:3
x

## ----taking the square root of a negative number results in NaN----------
sqrt(x)

## ----the yes condition is still evaluated for all x but only a subset are kept----
ifelse(x >= 0, sqrt(x), NA)

## ----performing the sqrt outside of the ifelse removes negative values first----
sqrt(ifelse(x >= 0, x, NA))

## ----using ifelse() inside a mutate call---------------------------------
head(						
  dplyr::mutate(
    mtcars,					
    hp_per_cc_auto = ifelse(am, hp / disp, NA)	
  )
)

## ----case_when to modify a column with dplyr-----------------------------
head(
  dplyr::mutate(
    mtcars,
    hp_per_cc_auto = dplyr::case_when(am == 1 ~ hp / disp, 
                                      am == 0 ~ NA_real_)  
  )
)

## ----unique values of mtcars$cyl-----------------------------------------
## find the unique values of cyl in mtcars and sort them numerically
## (by default they are in the order in which they first appear)
car_cyls <- sort(unique(mtcars$cyl))

## ----creating a showcase function----------------------------------------
## takes input num_cyls and prints a statement
##   about mtcars rows with that number of cylinders
showcase <- function(num_cyls) {
  
  ## subset mtcars to the rows with num_cyls cylinders
  ## this uses [ instead of dplyr::filter since the latter
  ##   drops row names
  cars_with_cyls <- mtcars[mtcars$cyl == num_cyls, ]
  
  ## identify the row with the highest mpg
  ## uses [ to preserve rownames
  ## which.max finds the index of the highest value
  most_efficient <- cars_with_cyls[which.max(cars_with_cyls$mpg), ]
  
  ## print a nice message to the console explaining the results
  cat(paste("There are", nrow(cars_with_cyls), "cars with", num_cyls, 
            "cylinders.\nThe most fuel efficient of these is the", 
            rownames(most_efficient), "\n\n"))
  
}

## ----using the showcase function-----------------------------------------
showcase(4)

## ----using showcase with walk--------------------------------------------
# install.packages("purrr")
library(purrr)
## walk is equivalent to map but doesn't return anything explicitly
##   (actually returns the input list, invisibly)
walk(car_cyls, showcase)

