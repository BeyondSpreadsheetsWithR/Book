## ----examples of vectors-------------------------------------------------
c(1.2, 2.8, 3.5)
c("cat", "dog", "fish")
c(TRUE, FALSE, TRUE)

## ----single values are still vectors-------------------------------------
c(6L)

## ----empty vectors are the same as NULL----------------------------------
c()

## ----empty vectors with a type-------------------------------------------
numeric(length = 0)
character(length = 0)
logical(length = 0)

## ----combining vectors makes longer vectors------------------------------
c(1, c(8, 9), 4)

## ----printing many values wraps over to the next line--------------------
print(LETTERS)

## ----str() shows information about the vector type and size--------------
str(c(1.2, 2.8, 3.5))
str(c("cat", "dog", "fish"))
str(c(TRUE, FALSE, TRUE))

## ----coercion to the most common type------------------------------------
c(2L, 4.3, 0)    
c(TRUE, 5.3, 3L) 
c(2L, 3L, "4")   

## ----the type is the coerced type----------------------------------------
typeof(c(2L, 3L, "4"))

## ----coercion happens at the earliest opportunity------------------------
c("1", 2L, 3L, c(4.0, 5.1))

## ----missing values can appear in vectors--------------------------------
c(3L, NA, 5L)

## ----specifying a character NA means the vector will be character--------
c(2, 3, NA_character_, 5)

## ----NULL cannot appear in a vector it will be skipped-------------------
c(3L, NULL, 5L)

## ------------------------------------------------------------------------
c("one", "two", "", "four")

## ----attributes hold additional information about an object--------------
x <- c(1, 2, 3, 4, 5)
attributes(x)

## ----you probably do not need to store attributes------------------------
attr(x, "important thing") <- "critical value"
attributes(x)
x

## ----not all functions preserve attributes-------------------------------
y <- x + 1
attributes(y)
y

## ----some functions simply drop attributes-------------------------------
z <- c(y, 12)
attributes(z)
z

## ----vectors can have named elements-------------------------------------
c(apple = 5030, banana = 4011, pear = 4421)

## ----named vectors do not have their index listed------------------------
c(a = "antediluvian", b = "boisterously", c = "connoisseurs")

## ----dots can be included in vector element names------------------------
c(high.value = 100, .score = 7, round2 = 26)

## ----this fails because a name cannot start with dot-letter, eval = FALSE----
## c(.2b = 6)

## ----quote a vector element name to force it-----------------------------
c(".2b" = 6)

## ----spaces can be included in names if quoted---------------------------
c("one fish" = "red", "two fish" = "blue")

## ----not providing a name to one element---------------------------------
c(apple = 5030, 4011, pear = 4421)

## ----examining a Named vector--------------------------------------------
str(
  c(
    x = 7,
    y = 8,
    z = 9
  )
)

## ----the remaining output is identical to that of an unnamed vector------
str(
  c(7, 8, 9)
)

## ----not providing a name to one element means it is assigned the empty string----
str(
  c(apple = 5030, 4011, pear = 4421)
)

## ----the hard way to write a regular sequence of values------------------
c(1L, 2L, 3L, 4L, 5L)

## ----an easier way to create a regular sequence of values----------------
seq(from = 1, to = 5)

## ----usin the defaults of seq to save time-------------------------------
seq(to = 5)

## ----not all of the defaults produce what you might expect---------------
seq(5)

## ----this fails because we can not count from 5 to 1 in steps of +0.5, eval = FALSE----
## seq(5, by = 0.5)

## ----we can count from 5 to 1 in steps of -0.5---------------------------
seq(5, by = -0.5)

## ----this is valid but perhaps not in the order you want-----------------
seq(-3)

## ----this is an integer sequence-----------------------------------------
str(seq(5.0))

## ----using the by argument allows a numeric sequence to be produced------
str(seq(5, by = -1)) 

## ----non-integer regular sequences are perfectly acceptable--------------
seq(from = 1.2, to = 2.0, by = 0.2)

## ----sequences do not need to be equally spaced ends but they will be regular----
seq(from = pi, to = 6)

## ----the easiest way to produce a regular sequence-----------------------
1 : 5

## ------------------------------------------------------------------------
str(c(21, 22, 23, 24, 25))

## ----reverse sequences are easy with this shortcut-----------------------
5 : 1

## ----these do not need to be at integer values but they will step by 1----
2.1 : 6.4
pi : 6
3 : -3

## ----creating a vector of values to iterate over-------------------------
patientNames <- c("Thomas", "Richard", "Henry")

## ----this seems like an okay idea for creating an iterator---------------
1:length(patientNames)

## ----if the vector is empty though we create a two-element iterator------
patientNames <- c()    
length(patientNames)   
1:length(patientNames) 

## ----seq_len() was made for counting elements----------------------------
patientNames <- c("Thomas", "Richard", "Henry")
seq_len(length(patientNames))
seq_along(patientNames)

## ----seq_len() works even when the vector is empty-----------------------
seq_len(0)
seq_along(c())

## ----a sequence up to a limit makes sense--------------------------------
lim <- 3
1:lim

## ----trying to make a shorter sequence and something goes wrong----------
1:lim - 1

## ----we need to use parentheses to force the precedence------------------
(1:lim) - 1

## ----changing the to argument using parentheses--------------------------
1:(lim - 1)

## ----the power operator has a different precedence-----------------------
1:lim ^ 2

## ----we could forego the parentheses but they aid our understanding------
1:(lim ^ 2)

## ----lengths of vectors--------------------------------------------------
length(c(7, 8, 9))
length(c("dog", "cat"))
length(9:17)

## ----sums of vectors-----------------------------------------------------
sum(c(10, 20, 30))
sum(10, 20, 30)

## ----mean of a vector----------------------------------------------------
mean(c(1, 2, 3, 4))

## ----min and max of vectors----------------------------------------------
min(c(91, 23, 59, 44))
max(c(91, 23, 59, 44))

## ----standard deviation of vectors---------------------------------------
sd(c("3.206171 5.369698 8.175691 2.739249 4.839496"))

## ----trying to create a sequence up to one more than a length------------
patientNames <- c("Thomas", "Richard", "Henry")
1:length(patientNames) + 1 

## ----recycling the single value to match the length of the longer value----
c(1, 2, 3) + c(1, 1, 1)

## ----when recycling will not create a full repetition--------------------
c(1, 2, 3) + c(2, 3)

## ----if the longer length is a multiple of the shorter length then recycling works well----
c(1, 2, 3, 4, 5, 6) + c(4, 3)

## ----vector math works for variables just the same-----------------------
x <- c(1, 2, 3)
y <- c(2, 3, 2)
x + y

## ----keep in mind how the recycling is happening here--------------------
x <- 1:10    
y <- c(1, 0) 
x * y        

## ----explicitly repeating the value 5 six times--------------------------
c(6, 5, 4, 5, 7, 4) > c(5, 5, 5, 5, 5, 5)

## ----recycling the value 5 to the length of the longer vector------------
c(6, 5, 4, 5, 7, 4) > 5

## ----we can read this as compare each of the values but recycling is why it works----
test_nums <- c(6, 5, 4, 5, 7, 4) 
test_nums > 5

## ----these pairs of points should be in the same object------------------
x <- c(0.26, 0.57, 0.84, 0.72)
y <- c(0.01, 0.58, 0.82, 0.96)

## ----now the pairs are linked as rows------------------------------------
xy <- matrix(data = c(x, y), nrow = 4, ncol = 2)
xy

## ----as long as the dimensions can be divided a matrix can be produced----
matrix(1:8, nrow = 2)
matrix(1:8, nrow = 4)

## ----recycling will occur if needed--------------------------------------
matrix(1:7, nrow = 4)

## ----a matrix must be of a single type-----------------------------------
str(
  matrix(1:8, nrow = 2)
)

## ----the dimensions are stored in an attribute---------------------------
attributes(matrix(1:8, nrow = 2))

## ----type and size information is provided by str()----------------------
str(xy)

## ----coercion occurs at the vector step----------------------------------
matrix(c("a", 2, 3, 4, 5, 6), nrow = 3, ncol = 2)

## ----the colnames have not been provided to matrix()---------------------
colnames(xy)

## ----setting colnames on the xy matrix-----------------------------------
colnames(xy) <- c("x", "y")
xy

## ----this will fail because recycling does not happen for names, eval = FALSE----
## colnames(xy) <- c("z")

## ----settting rownames on the xy matrix----------------------------------
rownames(xy) <- c("r1", "r2", "r3", "r4")
xy

## ----a simple list object------------------------------------------------
list(7, 8, 9)

## ----a more complicated list object with multiple types------------------
list(2L, "a", 5.2)

## ----lists can contain any other object as elements----------------------
list(
  c(1.2, 4.8),
  c(3L, 5L, 7L, 9L),
  c("cat", "dog", "mouse")
)

## ----lists can have named elements---------------------------------------
list(
  nameMatrix = matrix(c("a", 2, 3, 4, 5, 6), nrow = 3, ncol = 2), 
  commonValue = NA,
  index = 1:8
)

## ----NULL can appear in lists--------------------------------------------
list(
  x = c(4, 5, 6),
  y = NULL,
  z = c(7, 8, 9)
)

## ----str() on a list shows the different types---------------------------
str(
  list(
    a = c(1.2, 2.3, 3.4),
    b = 2:5,
    c = c("alpha", "omega")
  )
)

## ----an example data.frame-----------------------------------------------
data.frame(
  list(                 
    x = c(1, 2, 3, 4),
    y = c("a", "b"),    
    z = c(2.1, 9.3, 7.6, 1.1)
  )
)

## ----the intermediate call to list() is not necessary--------------------
data.frame(
  x = c(1, 2, 3, 4),
  y = c("a", "b"),
  z = c(2.1, 9.3, 7.6, 1.1)
)

## ----name columns carefully----------------------------------------------
data.frame(c(1, 2), "'oh no!'")

## ----creating a data.frame with quoted column names----------------------
data.frame(
  x = 21,
  "y variable" = 22,
  ".2b" = 23
)

## ----forcing the spaces to remain in column names------------------------
data.frame(
  x = 21,
  "y variable" = 22,
  ".2b" = 23,
  check.names = FALSE
)

## ----this will fail because the vectors are not the same length, eval = FALSE----
## data.frame(x = c(3, 4), y = c("q", "r", "s"))

## ----an empty data.frame()-----------------------------------------------
data.frame()

## ----columns can not be NULL---------------------------------------------
data.frame(x = c(), y = c(), z = c())

## ----a zero-row data.frame with columns----------------------------------
data.frame(
  x = integer(),
  y = character(),
  z = numeric()
) 

## ----attempting to create a data.frame with char and num columns---------
char_and_num_df <- data.frame(
  x = c("apple", "banana", "carrot"),
  y = c(5, 6, 7)
)
str(char_and_num_df)

## ----use stringsAsFactors FALSE to prevent conversion to factor----------
char_and_num_df <- data.frame(
  x = c("apple", "banana", "carrot"),
  y = c(5, 6, 7),
  stringsAsFactors = FALSE 
)
str(char_and_num_df)

## ----setting the global option of stringsAsFactors FALSE, eval = FALSE----
## options(stringsAsFactors = FALSE)

## ----the attributes of a data.frame--------------------------------------
attributes(mtcars)

## ----by default rows are named by their index----------------------------
data.frame(
  col1 = c("x", "y", "z"), 
  col2 = c("q", "r", "s")
)

## ----mtcars uses rownames to store the name of each vehicle--------------
rownames(mtcars) 

## ----printing different classes of object--------------------------------
print(c(4, 5, 6))
print(matrix(c(4, 5, 6)))
print(data.frame(a = c(4, 5, 6)))

## ----calling methods explicitly------------------------------------------
d <- data.frame(x = 1:3, y = c(3.6, 2.7, 0.4))
print.data.frame(d)
print.default(d)

## ----pretending that a vector is a data.frame----------------------------
x <- c(4, 5, 6)          
class(x) <- "data.frame" 
print(x)                 

## ----objects can and often do have multiple classes----------------------
class(d) <- c("specialObject", "data.frame")
str(d)
print(d)

## ----defining our own print method for class specialObject---------------
print.specialObject <- function(x, ...) {
  cat("## I'm more than just a data.frame!\n")
  print.data.frame(x)
}
print(d)

## ----load and attach the tibble package----------------------------------
# install.packages("tibble")
library(tibble)

## ----showing the print features of tibble, eval = FALSE------------------
## tibble(
##   chars = letters[1:5],
##   nums = -2:2,
##   missing = c("x", NA, "y", NA, "NA"),
##   precise = c(1.00002, 1.0002, 100.002, 10.200, 0.002)
## )

## ----creating a tibble with a list-column--------------------------------
tibble(
  x = 1:3,                        
  y = list(letters, TRUE, mtcars) 
)

## ----creating a more complicated tibble----------------------------------
my_tbl <- as.tibble( 
  list(              
    x = 1:3,         
    y = list(        
      letters,       
      TRUE,          
      mtcars         
    )
  )
)

## ----printing a tibble---------------------------------------------------
my_tbl

## ----creating a large object which would be unpleasant to print----------
m <- as.data.frame(
  matrix(
    1:676, c(26, 26),
    dimnames = list(1:26, LETTERS)
  )
)

## ----printing the first six rows produces already too much output--------
head(m)

## ----the print method for tibble produces sensible output----------------
as.tibble(m)

## ----tibbles can deal with strange column names--------------------------
tibble(
  x = 21,
  `y variable` = 22,
  `.2b` = 23
)

## ----taking the square root of a single value (still a vector)-----------
sqrt(9)

## ----taking the square root of a longer vector of values-----------------
sqrt(c(9, 16, 25))

## ----a highly structured result returned from a function, eval = FALSE----
## str(lm(1~1))
## #> List of 11
## #>  $ coefficients : Named num 1
## #>   ..- attr(*, "names")= chr "(Intercept)"
## #>  $ residuals    : Named num 0
## #>   ..- attr(*, "names")= chr "1"
## #>  $ effects      : Named num 1
## #>   ..- attr(*, "names")= chr "(Intercept)"
## #>  $ rank         : int 1
## #>  $ fitted.values: Named num 1
## #>   ..- attr(*, "names")= chr "1"
## #>  $ assign       : int 0
## #>  $ qr           :List of 5
## #>   ..$ qr   : num [1, 1] 1
## #>   .. ..- attr(*, "dimnames")=List of 2
## #>   .. .. ..$ : chr "1"
## #>   .. .. ..$ : chr "(Intercept)"
## #>   .. ..- attr(*, "assign")= int 0
## #>   ..$ qraux: num 1
## #>   ..$ pivot: int 1
## #>   ..$ tol  : num 1e-07
## #>   ..$ rank : int 1
## #>   ..- attr(*, "class")= chr "qr"
##   <truncated>

## ----creating a data.frame yourself--------------------------------------
data.frame(
  name = c("Alice", "Bob", "Charlie"),
  age = c(21L, 43L, 19L),
  likes_red_wine = c(TRUE, FALSE, TRUE),
  height_m = c(1.65, 1.50, 1.75)
)

