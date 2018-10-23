## ----creating a long data.frame manually---------------------------------
long_df <- data.frame(
  id = c(
    "person1", "person2", "person3", "person1", "person2",
    "person3", "person1", "person2", "person3", "person1",
    "person2", "person3"
  ),
  variable = c(
    "height", "height", "height", "weight", "weight",
    "weight", "age", "age", "age", "male", "male", "male"
  ),
  value = c(151.8, 139.7, 136.5, 47.8, 36.5, 
            31.9, 63, 63, 65, 1, 0, 0),
  stringsAsFactors = FALSE
)
long_df

## ----creating a wide data.frame manually---------------------------------
wide_df <- data.frame(
  id = c("person1", "person2", "person3"),
  height = c(152, 140, 137),
  weight = c(47.8, 36.5, 31.9),
  age = c(63, 63, 65),
  male = c(1, 0, 0),
  stringsAsFactors = FALSE
)
wide_df

## ----get the working directory path, eval = FALSE------------------------
## getwd() 
## #> [1] "/home/user"

## ----load and attach the here package, eval = FALSE----------------------
## # install.packages("here")
## library(here)
## #>  here() starts at /home/user/myProject

## ----tab separated data, eval = FALSE------------------------------------
## id	height	weight	age	male
## person1	152	47.8	63	1
## person2	140	36.5	63	0
## person3	137	31.9	65	0

## ----reading data from an external source--------------------------------
Howell_data <- "https://github.com/rmcelreath/rethinking/raw/master/data/Howell1.csv"

head(                   
  read.table(
    file = Howell_data, 
    sep = ";",          
    header = TRUE       
  )
)

## ----load and attach the rio package-------------------------------------
# install.packages("rio")
library(rio)

## ----load and attach the rvest package-----------------------------------
# install.packages("rvest")
library(rvest)

## ----storing a URL as a variable-----------------------------------------
r_lang_URL <- "https://en.wikipedia.org/wiki/R_(programming_language)"

## ----extracting the source HTML from a URL-------------------------------
r_html <- read_html(r_lang_URL) 

## ----extracting elements with a table tag from the HTML source-----------
html_nodes(r_html, "table")

## ----extracting objects of class wikitable from the HTML source----------
release_html <- html_node(r_html, ".wikitable")

## ----converting a HTML table to a data.frame-----------------------------
release_table <- html_table(release_html)

## ----printing the first two columns of the table data.frame--------------
release_table[, 1:2]

## ----extracting the elements with tag toc from the HTML source-----------
tag_toc_html <- html_nodes(r_html, "#toc")

## ----extracting elements with ul li and a tags from the HTML toc table----
toplevel_toc_links <- html_nodes(tag_toc_html, "ul li a")

## ----extracting text from the toplevel_toc table-------------------------
toplevel_toc_text <- html_text(toplevel_toc_links)
toplevel_toc_text

## ----using the pipe to avoid naming intermediate variables---------------
r_lang_URL %>%                 # take the URL
  read_html() %>%              # read the HTML source
  html_node(".wikitable") %>%  # extract the node with class 'wikitable'
  html_table() %>%             # convert the table to a data.frame
  .[c(1, 2)]                   # select the first two columns

## ----extracting the toc with the pipe makes the flow easier to read------
r_lang_URL %>%                 # take the URL
  read_html() %>%              # read the HTML source
  html_nodes("#toc") %>%       # extract the node with id 'toc'
  html_nodes("ul li a") %>%    # extract the ul / li / a tags
  html_text                    # extract the link text

## ----tabulating elements of each value-----------------------------------
table(iris$Species) 

## ----converting iris$Species to character before tabulating--------------
table(as.character(iris$Species))

## ----uniqueness respects capitalization----------------------------------
table(c("aBc", "Abc", "aBc", "aBc", "Abc"))

## ----tabulating numeric values-------------------------------------------
table(mtcars$mpg)

## ----tabulating numeric values when there are few unique values----------
table(mtcars$carb)

## ----printing the first six rows of an object----------------------------
head(iris)

## ----printing the last six rows of an object-----------------------------
tail(iris)

## ----printing a random sample of rows from mtcars------------------------
set.seed(1) 
dplyr::sample_n(mtcars, 6)

## ----creating sentinel values--------------------------------------------
mtcars_qc <- mtcars                      
mtcars_qc["Maserati Bora", "hp"]         
mtcars_qc["Maserati Bora", "hp"] <- 999  
tail(mtcars_qc)                          

## ----filtering to just the rows with a sentinel value in the hp column----
mtcars_qc[mtcars_qc$hp == 999, ] 

## ----filtering out records with sentinel values in the hp column---------
tail(mtcars_qc[mtcars_qc$hp != 999, ])

## ----summary gives us an overview of an object---------------------------
summary(mtcars_qc[ , 2:5]) 

## ----checking for finiteness of several vectors--------------------------
any(!is.finite(c(1, 2, 3, 4)))
any(!is.finite(c(1, 2, NA, 4)))
any(!is.finite(c(1, 2, NaN, 4)))
any(!is.finite(c(1, 2, Inf, 4)))

## ----loading and attaching the tidyr package-----------------------------
# install.packages("tidyr")
library(tidyr)

## ----printing the long_df object we created earlier----------------------
long_df

## ----converting from long to wide data-----------------------------------
wide_df <- spread(data = long_df, key = variable, value = value)
wide_df

## ------------------------------------------------------------------------
long_df_again <- gather(
  data  = wide_df, 
  key   = "variable", 
  value = "value",    
  -id                 
)
long_df_again

## ----reshaping from long to wide with a confusing syntax-----------------
reshape(
  long_df,
  idvar = "id",
  timevar = "variable",
  direction = "wide"
)

## ----load and attach the reshape2 package--------------------------------
# install.packages("reshape2")
library(reshape2) 

## ----casting from long to wide with a formula interface------------------
dcast(long_df, id ~ variable)

## ----creating a data.frame with repeated measurements--------------------
rep_df <- data.frame(
  name = c("x", "y", "y", "z", "x"),
  val1 = c(3, 5, 5, 4, 8),
  val2 = c(9, 2, 2, 1, 1),
  val3 = c("q", "r", "r", "s", "t")
)
rep_df

## ----detecting duplicate rows--------------------------------------------
duplicated(rep_df)

## ----detecting duplicates starting from the last row---------------------
duplicated(rep_df, fromLast = TRUE)

## ----removing duplicates by excluding their rows-------------------------
rep_df[!duplicated(rep_df), ]

## ----a shortcut to removing duplicates keeping only unique rows----------
unique(rep_df)

## ----detecting duplicates in a single column-----------------------------
unique(rep_df$val2)

## ----a tibble containing countries and capitals--------------------------
# install.packages("tibble") 
library(tibble)
countries_capitals <- tribble(     
  ~Country,      ~Capital,
  "Australia",   "Canberra",
  "France",      "Paris",
  "Malaysia",    "Kuala Lumpur",
  "India",       "New Delhi",
  "Nauru",       NA,               
  "Russia",      "Moscow",
  "Switzerland", NA,               
  "Zimbabwe",    "Harare"
)

## ----a tibble containing cities and populations--------------------------
cities_populations <- tribble(
        ~City, ~Population,
  "New Delhi",   16787949L,
  "Moscow",      11541000L,
  "Paris",        2241346L,
  "Harare",       1487028L,
  "Kuala Lumpur", 1381830L,
  "Dublin",       1173179L,
  "Ottawa",        898150L,
  "Wellington",    405000L,
  "Canberra",      354644L
)

## ----loading and attaching the dplyr package-----------------------------
# install.packages("dplyr")
library(dplyr)

## ----performing a full join on the countries and populations-------------
full_join(
  countries_capitals,        
  cities_populations,        
  by = c("Capital" = "City") 
)

## ----joining two tibbles with not-quite-matching data--------------------
dataA <- tribble(
  ~name, ~value,
  "x", 1,
  "y", 2,
  "z", 3
)
dataB <- tribble(
  ~name, ~other_value,
  "x", 4,
  "Y", 5,               
  "z", 6
)
full_join(dataA, dataB)

## ----joining two tibbles when values are repeated------------------------
dataA <- tribble(
  ~name, ~value,
  "x", 1.1,
  "x", 1.2,
  "y", 2,
  "z", 3
)
dataB <- tribble(
  ~name, ~other_value,
  "x", 4,
  "y", 5,
  "z", 6
)
full_join(dataA, dataB)

## ----joining two tibbles but keeping rows present in the leftmost one----
left_join(
  countries_capitals,
  cities_populations,
  by = c("Capital" = "City")
)

## ----joining two tibbles but keeping rows present in the rightmost one----
right_join(
  countries_capitals,        
  cities_populations,        
  by = c("Capital" = "City") 
)

## ----joining two tibbles but only keeping rows which appear in both------
inner_join(
  countries_capitals,        
  cities_populations,        
  by = c("Capital" = "City") 
)

## ----joining two tibbles but only keeping those not in the second--------
anti_join(
  countries_capitals,        
  cities_populations,        
  by = c("Capital" = "City") 
)

## ----joining two tibbles but only keeping those not in the second with the order reversed----
anti_join(
  cities_populations,        
  countries_capitals,        
  by = c("City" = "Capital") 
)

## ----base merging--------------------------------------------------------
merge(
  countries_capitals, 
  cities_populations,
  by.x = "Capital",   
  by.y = "City"       
)

## ----using all to specify a full_join()----------------------------------
merge(
  countries_capitals,
  cities_populations,
  by.x = "Capital",
  by.y = "City",
  all = TRUE
)

## ----using all.x to specify a left_join()--------------------------------
merge(
  countries_capitals,
  cities_populations,
  by.x = "Capital",
  by.y = "City",
  all.x = TRUE
)

## ----saving a variable into an RData file, eval = FALSE------------------
## z <- 3
## save(mtcars, z, iris, file = "example_data_YYMMDD.RData")

## ----loading data from an RData file, eval = FALSE-----------------------
## load(file = "example_data_YYMMDD.RData")

## ----saving data into an rds file, eval = FALSE--------------------------
## fruits <- c("strawberries", "apples", "watermelon")
## saveRDS(fruits, file = "red_fruits.rds")

## ----reading data from an rds file, eval = FALSE-------------------------
## readRDS(file = "red_fruits.rds")

## ----using the data stored in an rds file inline, eval = FALSE-----------
## fruit_salad <- c("banana", "grapes", readRDS(file = "red_fruits.rds"))
## fruit_salad

## ----creating a data.frame to export via dput----------------------------
mixed_type_df <- data.frame(
  ints  = 1:4,                    
  nums  = 2.5:5.5,                
  facts = factor(letters[23:26]), 
  chars = state.abb[1:4],         
  stringsAsFactors = FALSE        
)
mixed_type_df

## ----printing the structure of mixed_type_df-----------------------------
str(mixed_type_df)

## ----dput outputs the entire structural framework sufficient to rebuild an object----
dput(mixed_type_df)

## ----a nicer layout of the dput output-----------------------------------
mixed_type_df <- structure(
  list(ints = 1:4, 
       nums = c(2.5, 3.5, 4.5, 5.5), 
       facts = structure(
         1:4, 
         .Label = c("w", "x", "y", "z"), 
         class = "factor"
       ), 
       chars = c("AL", "AK", "AZ", "AR")
  ), 
  .Names = c("ints", "nums", "facts", "chars"), 
  row.names = c(NA, -4L), class = "data.frame"
)
mixed_type_df

## ----saving an object to a csv file--------------------------------------
write.csv(mtcars, file = "mtcars.csv")

