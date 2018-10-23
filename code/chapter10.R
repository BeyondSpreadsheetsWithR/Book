## ----a simple function which prints a message----------------------------
makeMeSmile <- function() {
  message("I can develop packages now!")
}

## ----using the makeMeSmile() function------------------------------------
makeMeSmile()

## ----adding an argument to the makeMeSmile() function--------------------
makeMeSmile <- function(me = "I") {          
  message(me, " can develop packages now!")  
}

## ----evaluating the makeMeSmile() function overriding the default argument----
makeMeSmile("You")

## ----install the roxygen2 package----------------------------------------
# install.packages("roxygen2")

## ----adding roxygen tags to our function---------------------------------
#' Reassure A User That They Are Doing Well
#' 
#' Look at that, they're building a documented function already!
#' 
#' @param me the user to resassure
#'
#' @return NULL (invisibly). Used for the side-effect of generating a
#'   \\code{message}.
#' @export
#'
#' @examples
#' makeMeSmile("You")
makeMeSmile <- function(me = "I") {
  message(me, " can develop packages now!")
}

## ------------------------------------------------------------------------
#' Row-wise tibble creation 
#'
#' Create [tibble]s using an easier to read row-by-row layout. 
#' This is useful for small tables of data where readability is
#' important.  Please see \\link{tibble-package} for a general introduction.
#'
#' `frame_data()` is an older name for `tribble()`. It will eventually 
#' be phased out.
#'
#' @param ... Arguments specifying the structure of a `tibble`. 
#'   Variable names should be formulas, and may only appear before the data.
#' @return A [tibble]. 
#' @export 
#' @examples 
#' tribble(
#'   ~colA, ~colB,
#'   "a",   1,
#'   "b",   2,
#'   "c",   3
#' )
#'
#' # tribble will create a list column if the value in any cell is
#' # not a scalar
#' tribble(
#'   ~x,  ~y,
#'   "a", 1:3,
#'   "b", 4:6
#' )
tribble <- function(...) { 
  data <- extract_frame_data_from_dots(...)
  turn_frame_data_into_tibble(data$frame_names, data$frame_rest)
}

## ----load and attach the testthat package--------------------------------
# install.packages("testthat")
library(testthat)

## ----a simple function to test-------------------------------------------
add <- function(x, y) {
  return(x + y)
}

## ----tests to be performed on the add() function-------------------------
test_that("normal addition rules apply", {   
  expect_equal(add(1L, 1L), 2L)              
  expect_equal(add(-1, 1), 0)                
  expect_error(add(1, "1"))                  
  expect_error(add(1))                       
  expect_type(add(1, 1), "double")           
  expect_type(add(1L, 1L), "integer")        
})

## ----this will fail by design, eval = FALSE------------------------------
## test_that("adding two differently sized data.frames", {
##   expect_silent(add(mtcars, iris))
## })

## ----can a data.frame be added to a number?------------------------------
test_that("adding a data.frame to a number", {
  expect_silent(add(mtcars, 1))  
})  

## ----data.frames are compatible with numbers using +---------------------
head(
  add(mtcars, 1)
)

## ----the mtcars dataset--------------------------------------------------
head(mtcars)

## ----adding two data.frames also works-----------------------------------
test_that("adding two data.frames", {
  expect_silent(add(mtcars, mtcars))  
})  

## ----the result of adding the two data.frames----------------------------
head(
  add(mtcars, mtcars)
)

## ----profvis-example, fig.cap="Example from `?profvis`."-----------------
dat <- data.frame(
  x = rnorm(5e4),
  y = rnorm(5e4)
)

plot(x ~ y, data = dat)
m <- lm(x ~ y, data = dat)
abline(m, col = "red")

## ----pairs of observed points--------------------------------------------
x <- c(1, 3, 4, 6)
y <- c(1.172, 2.394, 4.617, 6.045)

## ----linear-points, fig.cap = "Values with a linear-like relationship", fig.width = 4----
# install.packages("ggplot2")
library(ggplot2)
z <- data.frame(x, y)
ggplot(z, aes(x, y)) + geom_point(size = 3) + coord_equal()

## ----a linear model------------------------------------------------------
linear_model <- lm(y ~ x)

## ----the linear model object---------------------------------------------
linear_model

## ----summary of a linear model object------------------------------------
summary(linear_model)

## ----predicting from a linear model--------------------------------------
prediction_x <- 1:6
prediction_y <- predict(linear_model, newdata = data.frame(x = prediction_x))

predicted <- data.frame(x = prediction_x, y = prediction_y)
predicted

## ----predicted-points-lines, fig.cap = "Values with a linear-like relationship and line of best fit.", fig.width = 4----
ggplot(z, aes(x, y)) +
  geom_point(size = 3) +
  geom_point(data = predicted, aes(x, y), col = "blue") +
  geom_line(data = predicted, aes(x, y), col = "blue") +
  coord_equal()

## ----grouped-points, fig.cap = "Grouped points. These were produced from two distinct groups but they are spread out enough that they appear like one group."----
# install.packages("dplyr")
library(dplyr)
sdxy <- 0.9
set.seed(2)
spread_data <- sample_frac( 
  data.frame(x = c(
    3 + rnorm(100, sd = sdxy),
    6 + rnorm(100, sd = sdxy)
  )) %>% mutate(
    y = x + rnorm(100, sd = sdxy),
    source = rep(c("A", "B"), each = 100)
  ),
  1
)
head(spread_data, 10) 
ggplot(spread_data, aes(x, y)) + geom_point(size = 3)

## ----kmeans clustering---------------------------------------------------
km <- kmeans(spread_data[, c("x", "y")], centers = 2)
str(km)

## ----clustered-points, fig.width = 6, fig.cap = "Clustered points. The determined centers of the clusters are shown in black."----
ggplot(spread_data, aes(x, y)) + 
  geom_point(size = 3, aes(col = factor(km$cluster))) +
  geom_point(data = data.frame(
    km$centers,
    z = unique(km$cluster)
  ), aes(x, y, shape = c("A", "B")), size = 5) +
  guides(shape = guide_legend(title = "source"))

## ----clustered-identified, fig.width = 6, fig.cap = "Notice some misidentified points."----
ggplot(spread_data, aes(x, y)) + 
  geom_point(size = 3, aes(col = factor(km$cluster), shape = source)) +
  geom_point(data = data.frame(
    km$centers,
    z = unique(km$cluster)
  ), aes(x, y, shape = c("A", "B")), size = 5)

## ----installing the maps package, eval = FALSE---------------------------
## # install.packages("maps") 

## ----using the ggplot2 package to extract map data-----------------------
# install.packages("ggplot2")
library(ggplot2) 

states <- map_data(map = "state") 

head(states)

## ----geom-polygon, fig.cap = "States of the USA. Flat projection."-------
p <- ggplot(data = states) + 
  geom_polygon(aes(x = long, y = lat, 
                   fill = region, group = group), 
               color = "white") + 
  guides(fill=FALSE)  

p

## ----fixed-aspect, fig.cap = "Fixing the aspect ratio begins to help but isn't really accurate."----
p + coord_fixed(1.3) 

## ----install the mapproj package-----------------------------------------
# install.packages("mapproj")

## ----coord-map, fig.cap = "A proper projection faithfully represents the map."----
p + coord_map(projection = "albers", lat0 = 30, lat1 = 40)

## ----leaflet allows dynamic maps, eval = FALSE---------------------------
## # install.packages("leaflet")
## library(leaflet)
## 
## leaflet() %>%
##   addProviderTiles("OpenStreetMap.BlackAndWhite") %>%  
##   addMarkers(lng = 174.768, lat = -36.852, popup="The birthplace of R") %>%
##   setView(155, -38, zoom = 4)

## ----scraping the wikipedia opensearch API with httr---------------------
# install.packages("httr")
library(httr)
wiki_R <- content(GET("https://en.wikipedia.org/w/api.php?action=opensearch&search=R&limit=5"))

## ----viewing the result with the data viewer, eval = FALSE---------------
## View(wiki_R)

## ----extracting a sub-component of the list------------------------------
## URL for the letter R page
wiki_R[[4]][[1]]

## Description for the letter R
strwrap(wiki_R[[3]][[1]], 60) 

## ----extracting from the Star Wars API-----------------------------------
C3PO_response <- content(GET("https://swapi.co/api/people/2/"))

## ----viewing the C3PO data with the data viewer, eval = FALSE------------
## View(C3PO_response)

## ---- echo = FALSE-------------------------------------------------------
## reset knitr
knitr::opts_chunk$set(comment = '#>', fig.align = 'center', fig.width = 8, fig.height = 6, collapse = TRUE)

