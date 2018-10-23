## ----base_simple, fig.cap = "A simple 'base' plot."----------------------
plot(x = mtcars$disp, y = mtcars$mpg)

## ----storing columns in their own variables------------------------------
disp_data <- mtcars$disp
mpg_data <- mtcars$mpg

head(mpg_data)

## ----base_vars, fig.cap = "Using variables as `x` and `y` arguments."----
plot(x = disp_data, y = mpg_data)

## ----base_typeb, fig.cap = "Plotting type 'b' for 'both' points and lines."----
plot(x = 0:10, y = sin(0.1*(0:10)*pi), type = "b")

## ----base_arguments, fig.cap = "Many arguments are available to style the plot."----
plot(
  x = 0:10,
  y = sin(0.1*(0:10)*pi),
  type = "l",
  col  = "red",
  lwd  = 3,
  xlab = "x",
  ylab = "sin(x*pi/10)",
  main = "a 'base' plot"
)
points(
  x   = 0:10,
  y   = sin(0.1*(0:10)*pi),
  pch = 18,  # filled diamonds
  cex = 2,
  col = 4    # blue
)

## ----base_hist, fig.cap = "A 'base' histogram."--------------------------
set.seed(1)
## histogram of 1000 random, normally-distributed values
hist(rnorm(1000L))

## ----base_bar, fig.cap = "A 'base' barplot."-----------------------------
set.seed(1)
barplot(sample(1:10))

## ----base_df, fig.width = 8, fig.height = 8, fig.cap = "Plotting a `data.frame` produces a matrix of variables plotted against each other."----
plot(mtcars[, 1:4])

## ----saving a plot to a png file-----------------------------------------
graphics.off()
png("mtcars_disp_mpg.png")
plot(x = mtcars$disp, y = mtcars$mpg)
dev.off()

## ----this fails because we can not shutdown the null device, eval = FALSE----
## dev.off()

## ----creating multiple graphics devices----------------------------------
jpeg()
png()

## ------------------------------------------------------------------------
dev.list()

## ------------------------------------------------------------------------
dev.off()

## ------------------------------------------------------------------------
dev.off()

