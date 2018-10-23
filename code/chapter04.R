## ----calculating areas of circles with different radii-------------------
pi * (3 ^ 2)
pi * (4 ^ 2)
pi * (5 ^ 2)

## ----generalising into an areaCircle() function--------------------------
areaCircle <- function(radius) {  
  area <- pi * radius ^ 2         
  return(area)                    
}                                 

## ----using the areaCircle function with different values of radius-------
areaCircle(radius = 3)
areaCircle(radius = 4)
areaCircle(radius = 5)

## ----"my function does not do anything"----------------------------------
my_data <- 7
my_data

increase_my_data <- function(data_input) {
  updated_data <- data_input + 1
  return(updated_data)
}

increase_my_data(data_input = my_data)

my_data # (not changed)

## ----assigning the result of a function call-----------------------------
my_data <- increase_my_data(data_input = my_data)
my_data

## ----is x modified when updated?-----------------------------------------
x <- 2
x <- cos(x = 2*x)

## ----pi is a built-in variable-------------------------------------------
x <- pi  
x

## ----cosine of pi--------------------------------------------------------
cos(x = 2*x) 

## ----x is unchanged------------------------------------------------------
x

## ----using an intermediate variable--------------------------------------
.y <- cos(x = 2*x)
x <- .y

x

## ----a function which visibly returns a value----------------------------
returningFunction <- function() {
  2 + 7 
}
returningFunction()

## ----a function which conceals the return value--------------------------
nonReturningFunction <- function() {
  x <- 2 + 7
}
nonReturningFunction()

## ----both of these should give the same answer---------------------------
a <- returningFunction()
b <- nonReturningFunction()
a == b  # are these equal?

## ----returning early within a function-----------------------------------
bigOrSmall <- function(x) {
  if (x > 10) {        
    return("x is big") 
  }
  return("x is small") 
}

## ----this will return from the function normally-------------------------
bigOrSmall(x = 8)

## ----this will return from the function early----------------------------
bigOrSmall(x = 12)

## ----the internal code for +---------------------------------------------
`+`

## ----you can use these operators like normal functions if you need-------
`+`(2, 2)

## ----you can reassign inbuilt functions, just be careful doing so--------
`+` <- `-`

## ----reassigning + makes for some odd results----------------------------
2 + 2

## ----returning + to its normal definition--------------------------------
`+` <- base::`+`

## ----a function to extract the first letter of a string , message = TRUE----
first_letter <- function(word) {

  ## extract the first letter of the word using substring()
  ## which is called as substring(text, first, last)
  ## see ?substring
  first <- substring(word, 1, 1)

  ## write a message to the Console
  message_text <- paste(word, "starts with", first)
  print(message_text)

  ## return the first letter
  return(first)

}

## ----testing the first_letter function-----------------------------------
first_letter(word = "cat")

## ----this will fail because message_text is not defined outside of the function, eval = FALSE----
## message_text

## ----this will fail because word is not defined outside of the function, eval = FALSE----
## word

## ----assigning the result of our function--------------------------------
first_of_apple <- first_letter(word = "apple")

## ----the value is stored in the variable, but not the message------------
first_of_apple

## ----extracting the first letter of "cat"--------------------------------
first_of_cat <- first_letter(word = "cat")

## ----extracting the first letter of "dog"--------------------------------
first_of_dog  <- first_letter(word = "dog")

## ----extracting the first letter of "fish"-------------------------------
first_of_fish <- first_letter(word = "fish")

## ----this will fail because the function does not know what to do with the music argument, eval = FALSE----
## first_letter(word = "banana", music = "jazz")

## ----the arbitrary argument is redundant here and will not be evaluated----
trivial_function <- function(arbitrary_argument) {
  return(3)
}

## ----the function works either with or without the argument because it is not needed----
trivial_function(arbitrary_argument = 7)
trivial_function()

## ----here the y argument is not needed so is never evaluated-------------
lazy_function <- function(x, y) {
  return(x)
}

## ----undefined_variable does not even need to exist; it will be ignored----
lazy_function(x = 2, y = undefined_variable) 

## ----adding some processing of the output--------------------------------
first_letter_formatted <- function(word, fun) { 

  ## extract the first letter of the word using substring
  first <- substring(word, 1, 1)

  ## write a message to the Console
  message_text <- paste(word, "starts with", first)
  print(message_text)

  ## return the first letter
  return(fun(first)) 

}

## ----this will fail because we have not provided a fun argument, eval = FALSE----
## first_letter_formatted(word = "dog")

## ----some commented code-------------------------------------------------
## adds one to a number
## input: n, a number
## output: a number, n+1
add_one <- function(n) {
  return(n + 1)
}

## ----example of toupper()------------------------------------------------
toupper(x = "text processing is fun")

## ----passing a function by name through the fun argument-----------------
first_letter_formatted(word = "dog", fun = toupper)

## ----the internal code for toupper()-------------------------------------
toupper 

## ----passing the tolower function by name--------------------------------
first_letter_formatted(word = "DOG", fun = tolower)

## ----repeated code indicates that more abstraction is probably needed----
first_of_cat  <- first_letter_formatted(word = "cat",  fun = toupper)
first_of_dog  <- first_letter_formatted(word = "dog",  fun = toupper)
first_of_fish <- first_letter_formatted(word = "fish", fun = toupper)

## ----example of default argument-----------------------------------------
first_letter_formatted <- function(word, fun = toupper) { 

  ## extract the first letter of the word using substring
  first <- substring(word, 1, 1)

  ## write a message to the Console
  message_text <- paste(word, "starts with", first)
  print(message_text)

  ## return the first letter
  return(fun(first))

}

## ----the default of toupper has been used--------------------------------
first_letter_formatted(word = "house")

## ----overriding the default argument-------------------------------------
first_letter_formatted(word = "HOUSE", fun = tolower)

## ----default print() function--------------------------------------------
print(x = "a")

## ----overriding the default for the print() quote argument---------------
print(x = "a", quote = FALSE)

## ----explicitly naming arguments-----------------------------------------
print(x = "abc")

## ----the string abc is passed as the (first) argument x------------------
print("abc")

## ----example use of runif() (seed is set for reproducibility)------------
set.seed(1)
runif(n = 4, min = 1, max = 2)

## ----positional indexing of arguments to runif()-------------------------
set.seed(1)
runif(4, 1, 2)

## ----changing argument name ordering works when they are named (seed is set for reproducibility)----
set.seed(1)
runif(max = 2, n = 4, min = 1)

## ----function which passes on ... to a deeper nested function------------
nestedFunction <- function(N, ...) {
  runif(n = N, ...)
}

## ----nestedFunction with min and max passed to runif() (seed is set for reproducibility)----
set.seed(1)
nestedFunction(N = 3, min = 1, max = 2) 

## ----if nothing is passed through ..., runif() uses its defaults (seed is set for reproducibility)----
set.seed(1)
nestedFunction(N = 3)

## ----positional indexing of arguments passed through ... (seed is set for reproducibility)----
set.seed(1)
nestedFunction(3, 1, 2)

## ----sum calculates the sum of its arguments, all passed through ...-----
sum(12, 13, 9, 11)

## ----example use of sum which calculates sum of all unnamed variables----
sum(1, 2, 3, 4)

## ----mean does not work the same way as sum() because it has an x argument, not just ...----
mean(1, 2, 3, 4)

## ----example use of rnorm() (seed is set for reproducibility)------------
set.seed(1)
rnorm(n = 10)

## ----different arguments to rnorm() (seed is set for reproducibility)----
set.seed(1)
rnorm(n = 10, mean = 10, sd = 2)

## ----using shortened variable names where they are distinct (seed is set for reproducibility)----
set.seed(1)
rnorm(n = 10, m = 10, s = 2)

## ----example usage of runif() (seed is set for reproducibility)----------
set.seed(1)
runif(n = 10, min = 0, max = 1)

## ----this will fail because m is not an unambiguous enough variable name, eval = FALSE----
## set.seed(1)
## runif(n = 10, m = 5)

## ----tracing x variables (1)---------------------------------------------
x <- 2

## ----tracing x variables (2)---------------------------------------------
print_x <- function(x = 7) {
  print(x = x)
  x <- 4
  return(x)
}

## ----tracing x variables (3)---------------------------------------------
print_x(x = x)

## ----tracing x variables (4)---------------------------------------------
x

## ----tracing x variables (5)---------------------------------------------
print_x()

## ----tracing x variables (6)---------------------------------------------
x

## ----local variables are not available outside of functions--------------
y_in_scope <- function(y) {
  print(x = y)
}

y_in_scope(y = 5)

## ----this will fail because y does not exist outside of y_in_scope(), eval = FALSE----
## y

## ----functions be defined with variables in wider scopes but will fail if it can not find them there----
does_not_contain_z <- function(x = 1) {
  print(x = z)
}

## ----this will fail because the function can not find the variable z which does not exist, eval = FALSE----
## does_not_contain_z()

## ----now does_not_contain_z() can find a variable named z in the wider scope----
z <- "apple"
does_not_contain_z()

## ----does_contain_z() will find the local z and use that, even if a global z exists----
z <- "apple"
does_contain_z <- function(x = 1) {
  z <- "nothing"
  print(x = z)
}
does_contain_z()

## ----a recursive definition for factorial()------------------------------
## returns x*(x-1)*(x-2)*...*1
factorial <- function(x) {

  ## if the input is 1, just return the input
  if (x == 1) {
    return(x)
  ## if the input is not 1, calculate x * factorial(x - 1)
  } else {
    return(x * factorial(x - 1))
  }

}

## ----comparing out implementation, manual calculation, and the built-in implementation of factorial()----
c(factorial(3), 3*2*1, base::factorial(3))

c(factorial(6), 6*5*4*3*2*1, base::factorial(6))

## ----installing ggplot2 from CRAN, eval = FALSE--------------------------
## install.packages("ggplot2") 

## ----loading and attaching the ggplot2 library, eval = FALSE-------------
## library(ggplot2) 

## ----this will fail because someFunction() is not defined, eval = FALSE----
## someFunction()

## ----list the loaded namespaces on your machine (these may vary in your session)----
loadedNamespaces()

## ----a trivial function which counts the number of characters in a string----
count <- function(string) {
  nchar(string)
}
count("abcde")

## ----dplyr masks several other functions---------------------------------
# install.packages("dplyr")
library(dplyr)

## ----function which produces a message()---------------------------------
raiseMessage <- function() {

  message("Keep going, you'll be a useR in no time!")

}

## ----invoking the function which produces a message()--------------------
raiseMessage()

## ----function which produces a warning-----------------------------------
raiseWarning <- function() {

  warning("Ouch! Please don't do that.")

}

## ----invoking the function which produces a warning----------------------
raiseWarning()

## ----function which produces an error------------------------------------
raiseError <- function() {

  stop("I'm sorry, Dave, I'm afraid I can't do that")

}

## ----invoking the function which produces an error, eval = FALSE---------
## a <- 2; raiseError(); b <- 3

## ----a function which includes a test and which will fail if that test condition is not met----
smallValueCheck <- function(x) {

  stopifnot(x < 10) 
  message("Look, the function made it this far!")

}

## ----evaluating smallValueCheck with a small value, eval = FALSE---------
## smallValueCheck(20)

## ----evaluating smallValueCheck() with a large value---------------------
smallValueCheck(5)

## ----masking of functions when loading dplyr-----------------------------
library(dplyr)

## ----suppressing startup messages----------------------------------------
suppressPackageStartupMessages(library(dplyr))

## ----evaluating a function which produces an error, eval = FALSE---------
## smallValueCheck(100)

## ----tracing the cause of the error in our smallValueCheck() call, eval = FALSE----
## traceback()
## #> 3: stop(msg, call. = FALSE, domain = NA) 
## #> 2: stopifnot(x < 10) at #3               
## #> 1: smallValueCheck(100)                  

## ----setting a function to debug mode the next time it is called, eval = FALSE----
## debugonce(fun = "areaCircle")

## ----if a function is set to debug mode R will start a debug session, eval = FALSE----
## areaCircle(3)

## ----does first_letter_formatted() work with numbers as strings?---------
first_letter_formatted("3.14159")

## ----does first_letter_formatted() work with actual numbers?-------------
first_letter_formatted(3.14159)

## ----does first_letter_formatted() work with variables?------------------
first_letter_formatted(pi)

## ----does first_letter_formatted() work with negative numbers (start with a minus sign)?----
first_letter_formatted(-7)

## ----does areaCircle() work with a string?, eval = FALSE-----------------
## areaCircle("blue")

## ----does areaCircle() work with numbers as strings?, eval = FALSE-------
## areaCircle("5")

## ----functions to convert Celcius to Farenheit and vice-versa------------
# Convert Celsius to Fahrenheit       
C_to_F <- function(temp_C) {          
  temp_F <- (9L * temp_C / 5L) + 32L  
  return(temp_F)
}

# Convert Fahrenheit to Celsius         
F_to_C <- function(temp_F) {            
  temp_C <- 5L * (temp_F - 32L) / 9L  
  return(temp_C)                      
}

## ----convert values from Celcius to Farenheit----------------------------
C_to_F(temp_C = 38)

## ----this will fail because it is using the wrong argument name, eval = FALSE----
## F_to_C(temp_C = -40)

## ----converting from Farenheit to Celcius--------------------------------
F_to_C(temp_F = -40)

