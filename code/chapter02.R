## ----entering a value into the Console-----------------------------------
3.2

## ----str() shows the structure of an object------------------------------
str(object = 3.2)

## ----simply not having a decimal does not make a number an integer-------
str(object = 7)

## ----trying to define something as an integer is not good enough---------
str(object = 7.0)

## ----use an L after a number to define an integer------------------------
str(object = 7L)

## ----typeof() shows the type of an object e.g. numeric or integer--------
typeof(x = 7)

## ----this fails because typeof() does not have an object argument, eval = FALSE----
## typeof(object = 7)

## ----typeof() returns integer when we use the L suffix-------------------
typeof(x = 7L)

## ----all of these look the same on the screen which is not ideal---------
7
7.0
7L

## ----we can make large values using an exponent e or E-------------------
5e6 

## ----exponents can follow decimal values---------------------------------
1.2e6

## ----the exponent follows through if we are more precise-----------------
3.14159e3

## ----typeof() shows that this is an integer------------------------------
typeof(x = 1.2e6L)

## ----this will fail because R will not understand the decimals, eval = FALSE----
## 1,200,000

## ----strings are of type char (short for character)----------------------
str(object = "apple")

## ----a blank string is still a character object--------------------------
str(object = "")

## ----use slashes to escape quotes----------------------------------------
"The sign said, \"Walk\"."

## ----use a mixture of quote types when referring to spoken text----------
"The sign said, 'Walk'."

## ----double quotes can quote single quotes or apostrophes----------------
"That's John's father's name."

## ----double quotes will be escaped if they are inside single quotes------
'The sign said, "Walk".'

## ----special characters such as newlines do special things when printed----
cat('\'Special characters\'\ndo \'special things\'')

## ----factors are ordered alphabetically and labeled by integers----------
str(object =                                     
  factor(x =                                     
         c( "John", "Paul", "George", "Ringo" )  
  ) 
)

## ----the order of factor levels are alphabetical by default--------------
str(object = factor(x = c("medium", "small", "large")))

## ----specifying ordered means this becomes an ordered factor-------------
sizes <- factor(x       = c("medium", "small", "large"), 
                levels  = c("small", "medium", "large"),
                ordered = TRUE)
str(object = sizes)

## ----table() shows the counts of each level------------------------------
table(sizes)

## ----check the levels of a factor to ensure they are what you think------
levels(x = sizes)

## ----the current time, as the system understands it----------------------
str(object = Sys.time())

## ----the current date as the system understands it-----------------------
str(object = Sys.Date())

## ----formatting a date object with special codes-------------------------
format(x = Sys.time(), format = "%Y")

## ----logical values are of type logi meaning logical---------------------
str(object = TRUE)

## ----printing with and without the quote option--------------------------
print(x = "abc")
print(x = "abc", quote = FALSE)

## ----by default NA is a logical type-------------------------------------
typeof(x = NA)

## ----assigning the value 4 to the variable x-----------------------------
x <- 4

## ----assignment does not visibly return a value so it prints nothing-----
no_return <- 7

## ----surrounding with parentheses----------------------------------------
(return_me <- 7)

## ----printing the value of x---------------------------------------------
print(x = x)

## ----when an object is evaluated by itself it is printed-----------------
x

## ----column names of the mtcars dataset----------------------------------
colnames(x = mtcars)

## ----assigning another variable------------------------------------------
y <- 8

## ---- eval = FALSE-------------------------------------------------------
## 2b <- 7

## ----defining an otherwise invalid variable with quotes------------------
"2b" <- 7
7 + `2b`

## ----variable names can include spaces when quoted-----------------------
`to be or not to be` <- 2
7 + `to be or not to be`

## ----text in quotes just produces a character object---------------------
"2b"

## ----quote-defined variables can be referenced with backticks------------
`2b`

## ----the variable pi is defined in the base package----------------------
pi <- 3L 
base::pi 

## ----we can add variables in the way we would add values-----------------
x + y

## ----we can change the type of variables whenever we like----------------
y <- "banana"
y

## ----we can add variables in the same way we add numbers-----------------
a1 <- 4
a2 <- 8
sum_of_a1_and_a2 <- a1 + a2

## ----the result of adding variables is what we expect from adding their values----
print(x = sum_of_a1_and_a2)

## ----changing the value of a variable does not change any other variables----
a2 <- 7

## ----the value of sum_of_a_and_b is unchanged despite changing b---------
print(x = sum_of_a1_and_a2)

## ----we use the equals sign to specify arguments to functions------------
str(object = mtcars, indent.str = "INDENT>>  ")

## ----assigning values to variables---------------------------------------
score <- 4.8
score
str(object = score)

fruit <- "banana"
fruit
str(object = fruit)

## ----we can align assignments with whitespace----------------------------
first_name <- "John"
last_name  <- "Smith"
top_points <- 23

## ----assigning a value to a variable-------------------------------------
a <- "x"

## ----accidentally adding a space changes the assignment operator into a comparison----
a < - 3 

## ----integers need to be specified not assumed---------------------------
myInt <- 3
str(object = myInt) 

## ----specifying an integer assingnment-----------------------------------
myInt <- 3L
str(object = myInt) 

## ----converting a number to a character string---------------------------
numAsString <- as.character(x = 1234)
str(object = numAsString)

## ----quotes make any value into a character string-----------------------
numAsString <- "1234"

## ----converting a stored number to a character string--------------------
num <- 1234
numAsString <- as.character(x = num)
str(object = numAsString)

## ----integer and numeric types are indistinguishable as characters-------
as.character(x = 7)
as.character(x = 7L)

## ----converting from character to numeric works when unambiguous---------
stringAsNum <- as.numeric(x = "3.14159")
str(object = stringAsNum) 

## ----printed values may show fewer decimal places------------------------
print(x = stringAsNum)

## ----converting a numeric type to integer manually-----------------------
myInt <- as.integer(x = 7)
str(object = myInt) 

## ----converting to integers means rounding one way or another------------
as.integer(x = 3.14)

## ----rounding may not behave the way you expect--------------------------
as.integer(x = 2.99)

## ----negative numbers also round towards zero----------------------------
as.integer(x = -22.6)

## ----unambiguous or simple conversions typically work--------------------
as.integer(x = " -47.8  ") 

## ----difficult to parse expressions do not convert to character strings----
as.integer(x = "--92.4")

## ----when not converting to characters R will follow rules to figure this out----
as.integer(x = --92.4)

## ----complicated numbers can convert to character easily enough----------
as.character(x = 2342.983)

## ----factor levels can be numbers or integer or just about anything------
dozens <- factor(x = c(36L, 24L, 12L, 48L))
dozens

## ----as.integer on a factor returns the level indices--------------------
as.integer(x = dozens)

## ----we need to convert to character before extracting the numeric values----
as.integer(x = as.character(x = dozens))

## ----0 converts to FALSE while other numbers convert to TRUE-------------
as.logical(x = 0)
as.logical(x = 1)

## ----strings convert to NA when converting to logical type---------------
as.logical(x = "value")

## ----be careful with the value T as it can mean TRUE---------------------
as.logical(x = "R")
as.logical(x = "S")
as.logical(x = "T")

## ----highlighting the difference between POSIXct and Date types----------
as.Date(x = Sys.time())
as.POSIXct(x = Sys.time()) 

## ----some well-documented code-------------------------------------------
# Here we are using a=2 because it provides the 
# best agreement with the data. 
a <- 2

# cosmological constant:
# ratio of dark energy pressure to energy per unit volume
w <- -1

y <- w + a # TODO: cross-check this with formula in Einstein (1917) 

z <- log(x = y) # values of y are assumed to be positive and 
                # non-zero at this point, so this should be 
                # safe. 

#x <- z - 1 

