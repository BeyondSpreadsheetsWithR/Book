## ----adding two numbers--------------------------------------------------
2 + 2

## ----subtracting two numbers---------------------------------------------
4 - 3

## ----multiplying two numbers---------------------------------------------
3 * 6

## ----dividing two numbers------------------------------------------------
12 / 4

## ----raising 2 to the power of 10----------------------------------------
2 ^ 10

## ----also raising 2 to the power of 10-----------------------------------
2 ** 10

## ----subtracting date-times----------------------------------------------
as.POSIXct(x = "2016-12-31") - as.POSIXct(x = "2016-01-01") 

## ----this will fail because adding dates makes no sense, eval = FALSE----
## as.POSIXct(x = "2016-12-31") + as.POSIXct(x = "2016-01-01")

## ----this will fail because R can not add strings to numbers, eval = FALSE----
## 2 + "2"

## ----two values are converted to the most general type which here is numeric----
numPlusInt <- 7 + 3L
str(object = numPlusInt)

## ----subtracting strings makes no sense, eval = FALSE--------------------
## "7" - "4"

## ----adding strings in R makes no sense, eval = FALSE--------------------
## "7" + "4"

## ----adding a number to a date-time actually works. It adds that many seconds----
as.POSIXct(x = "2016-12-31") + 1 

## ----adding an entire day as 86400 seconds-------------------------------
as.POSIXct(x = "2016-12-31") + 60*60*24 

## ----operations involving NA usually result in NA------------------------
7 + NA
NA + 0

## ----sum can be thought of as lots of additions--------------------------
sum(3, 7, 0, 9, NA)

## ----we can remove NA values with this option----------------------------
sum(3, 7, 0, 9, NA, na.rm = TRUE)

## ---- eval = FALSE, null_prefix = TRUE, comment = ""---------------------
2 + (3 * 0) - 1

## ---- eval = FALSE, null_prefix = TRUE, comment = ""---------------------
2 ^ (5 * 2)

## ----an odd but valid assigment------------------------------------------
x <- y <- 3 + 1

## ----output of x and y values from the odd assignment--------------------
x
y

## ----parentheses can change the meaning of an expression-----------------
x <- (y <- 3) + 1

## ----now the x and y values are different--------------------------------
x
y

## ----joining two words together with a space between them----------------
paste("butter", "fly")

## ----joining two words together without a space between them-------------
paste0("butter", "fly")

## ----paste0() converts to character before joining-----------------------
paste0("value", 31)

## ----calls to paste can be nested----------------------------------------
address_number <- 221
address_suffix <- "B"
address_street <- "Baker Street"

paste(
  paste0(
    address_number, 
    address_suffix  
  ),
  address_street    
)

## ----the string NA remains a string--------------------------------------
as.character(x = NA)   
as.character(x = "NA") 

## ----paste retains NA values---------------------------------------------
paste("a missing value is denoted", NA)

## ----greater than and less than operators--------------------------------
7 > 4
9 < 3

## ----greater or equal and less than or equal operators-------------------
5 >= 6
3 <= 3

## ----equal and not equal operators---------------------------------------
3 == 3
7 != 4

## ----integer and numeric types appear equal to this operator-------------
5L == 5

## ----identical is much more strict as it also checks the type------------
identical(x = 5L, y = 5)

## ----computers have trouble storing certain values precisely-------------
print(x = 0.3, digits = 17)

## ----you do not want to test if these are identical to 0.3---------------
print(x = 0.1 + 0.2)
print(x = 0.1 + 0.2, digits = 17)

## ----this happens in most languages and is not unique to R---------------
0.1 + 0.2 > 0.3

## ----the not operator can appear in many places in a comparison----------
3 != 4
!(3 == 4)
(! 3 == 4)

## ----comparing with NA always produces NA--------------------------------
3 > NA
7 == NA

## ----do not use equality to test for NA----------------------------------
5 != NA

## ----NULL can not be compared to anything--------------------------------
3 > NULL
TRUE == NULL
NA != NULL

## ----making one comparison is straightforward enough---------------------
x <- 4
x > 3

## ----multiple comparisons must be made in full, eval = FALSE-------------
## x > 3 & < 5

## ----the two comparisons written out in full-----------------------------
x > 3 & x < 5 

## ----test whether a value is NA with is.na()-----------------------------
is.na(x = 7)
is.na(x = NA)

## ----numeric is more general than integer--------------------------------
3L + 2.5

## ----the result is of type numeric---------------------------------------
str(object = 3L + 2.5)

## ----0 converts to TRUE while other values convert to FALSE--------------
as.logical(x = 0)
as.logical(x = 1)

## ----the approximate test does not check type----------------------------
0 == FALSE
1 == TRUE

## ----numeric is more general than logical so the result is numeric-------
8 + TRUE

## ----this produces a count of TRUE values--------------------------------
sum(TRUE, FALSE, TRUE, TRUE)

## ----character is more general than numeric------------------------------
"a" > 5

## ----assignment can be turned into comparison with a wayward space-------
a <- "x"
a < - 3

## ----characters numbers and symbols all have an ordering to them---------
"2" < "3"

## ----the ordering is alphanumeric not just numeric-----------------------
"2" < "13"

## ----storing a temperature in a carefully named variable-----------------
temp_F <- 88

## ----converting to celsius with another carefully named variable---------
temp_C <- 5L * (temp_F - 32L) / 9L

## ----printing the value of temp_C----------------------------------------
temp_C

## ----distinguish temp values with meaningful variable names--------------
temp_F_recalculated <- (9L * temp_C / 5L) + 32L
temp_F_recalculated

## ----these are the same value--------------------------------------------
temp_F == temp_F_recalculated

