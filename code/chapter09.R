## ----loading and attaching the ggplot2 package---------------------------
# install.packages("ggplot2")
library(ggplot2)

## ----ggplot_empty, fig.cap = "An empty `ggplot()` call. No data was provided so nothing to plot."----
ggplot()

## ----ggplot_data, fig.cap = "Adding some data but still nothing to see here yet."----
ggplot(data = mtcars) 

## ----ggplot_aes, fig.cap = "Adding a mapping using the aesthetic function `aes()`. The axes are now well defined but we haven't specified what we want plotted."----
ggplot(data = mtcars, mapping = aes(x = cyl, y = mpg))

## ----ggplot_aes-factor, fig.cap = "Using 'factor()` in the aesthetic we can change how the axis is constructed."----
ggplot(data = mtcars, mapping = aes(x = factor(cyl), y = mpg))

## ----ggplot_points, fig.cap = "Adding points as a geometry; with data a mapping and a geometry we finally have some data plotted."----
ggplot(data = mtcars, mapping = aes(x = cyl, y = mpg)) + geom_point()

## ----ggplot call without argument names, eval = FALSE--------------------
## ggplot(mtcars, aes(cyl, mpg)) +
##   geom_point()

## ----ggplot_aes-point, fig.cap = "Using `aes()` in `geom_point()`"-------
ggplot() + geom_point(data = mtcars, aes(cyl, mpg))

## ----this will fail because we have not specified the data argument, eval = FALSE----
## ggplot() + geom_point(mtcars, aes(cyl, mpg))

## ----ggplot_inherit, fig.width = 5, fig.cap = "Aesthetics can be inherited by geometries if they are provided in the `ggplot()` call."----
ggplot(mtcars, aes(cyl, mpg, shape = factor(am))) + 
  geom_point(size = 8, col = "lightblue") +         
  geom_point()                                      

## ----ggplot_color, fig.width = 5, fig.cap = "Using colour as an aesthetic via `aes()`."----
ggplot(mtcars, aes(disp, mpg, col = factor(am))) + geom_point()

## ----ggplot_three-col, fig.cap='Note the `cyl` vs `disp` relationship that becomes apparent.', fig.width = 5----
ggplot(mtcars, aes(disp, mpg, col = factor(cyl))) + geom_point()

## ----a sample of available colours---------------------------------------
set.seed(13) 
sample(colors(), 10) 

## ----ggplot_colors, echo = FALSE, fig.width = 8, fig.height = 6, dpi = 75, fig.cap = "Examples of colours available to `ggplot()`."----
set.seed(13)
cols <- sample(colors(), 10)

ggplot(data.frame(x = rep(1:10, 10), y = rep(1:10, each = 10))) + 
  geom_line(aes(x, y, group=y, col=factor(y)), lwd = 4) + 
  geom_text(data = data.frame(x = rep(10.5, 10), y = 1:10), aes(x, y, label = cols), hjust = 0, cex = 5) +
  geom_point(data = data.frame(x = 13, y = 5), aes(x, y), alpha = 0) +
  scale_color_manual(values = cols) + 
  theme_void() + guides(col = FALSE)

## ----all ggplot2 aesthetics----------------------------------------------
ggplot2:::.all_aesthetics

## ----ggplot_more-aes, fig.width = 5, fig.cap = "More dimensions (as aesthetics) help to distinguish different aspects of the data and highlight relationships."----
ggplot(data = mtcars, 
  mapping = aes(x = mpg, 
                y = disp, 
                col = factor(cyl), 
                shape = factor(am), 
                size = hp)
) + 
  geom_point()

## ----ggplot_remove-legend, fig.width = 5, fig.cap = "Removing a legend using `guides()`."----
ggplot(data = mtcars, 
  mapping = aes(x = mpg, 
                y = disp, 
                col = factor(cyl), 
                shape = factor(am), 
                size = hp)
) + 
  geom_point() +
  guides(colour = FALSE) # no colour legend

## ----using dplyr to create a dataset-------------------------------------
# install.packages("dplyr")
library(dplyr) 
sin_df <- data.frame(theta = seq(pi, 0, -0.5)) %>% 
  mutate(x = cos(theta), y = sin(theta))           

## ----ggplot_sin, fig.width = 4.5, fig.cap = "Lines joining pairs of `x` and `y` values."----
ggplot(sin_df, aes(x, y)) + geom_line()

## ----ggplot_sin-lines, fig.width = 4.5, fig.cap = "Lines _and_ points joining pairs of values."----
ggplot(sin_df, aes(x, y)) + geom_line() + geom_point()

## ----ggplot_sin-jump, fig.width = 4.5, fig.cap = "This probably isn't what you want."----
sin_df <- data.frame(theta = seq(0, 1.75*pi, 0.5)) %>% 
  mutate(x = cos(theta), y = sin(theta))
ggplot(sin_df, aes(x, y)) + geom_line()

## ----ggplot_sin-path, fig.width = 4.5, fig.cap = "Plotting the points as a 'path' assumes the pairs are to be plotted sequentially rather than in the order of the `x` values."----
ggplot(sin_df, aes(x, y)) + geom_path()

## ----ggplot_sin-smooth, fig.width = 4.5, fig.cap = "A more finely scaled data object produces a smoother curve when joining the points by lines."----
sin_df <- data.frame(theta = seq(0, 1.75*pi, 0.01)) %>% 
  mutate(x = cos(theta), y = sin(theta))
ggplot(sin_df, aes(x, y)) + geom_path()

## ----ggplot_sin-style, fig.width = 5, fig.cap = "Lines can be styled just as points can."----
ggplot(sin_df, aes(x, y)) + geom_path(aes(lwd = theta, col = theta))

## ----ggplot_bar, fig.cap = "Categorical values can be counted and plotted as a barplot."----
ggplot(mtcars) + geom_bar(aes(factor(cyl)))

## ----ggplot_bar-cont, fig.cap = "Continuous values have counts in each distinct value."----
ggplot(mtcars) + geom_bar(aes(hp))

## ----ggplot_hist, fig.cap = "A _histogram_ is a a barplot with some binning."----
ggplot(mtcars, aes(hp)) + geom_histogram(binwidth = 20)

## ----ggplot_hist15, fig.cap = "Specifying 15 bins rather than the width of the bins."----
ggplot(mtcars, aes(hp)) + geom_histogram(bins = 15)

## ----ggplot_hist30, fig.cap = "The default number of bins is 30."--------
ggplot(mtcars, aes(hp)) + geom_histogram()

## ----manually determining heights to be used in a bar plot---------------
average_mpg_by_cyl <- mtcars %>%
  group_by(cyl) %>%              
  summarise(n_cars = n(),        
            avg_mpg = mean(mpg)	 
  )

## ----ggplot_stat-identity, fig.cap = "An 'identity' statistic indicates that counts do not need to be calculated."----
ggplot(average_mpg_by_cyl, aes(cyl, n_cars)) + geom_bar(stat = "identity") 

## ----ggplot_geom-col, fig.cap = "`geom_col() is useful if we know the heights of the bars."----
ggplot(average_mpg_by_cyl, aes(cyl, n_cars)) + geom_col()

## ----ggplot-geom-col-manual, fig.cap = "Another `geom_col()` plot."------
ggplot(average_mpg_by_cyl, aes(cyl, avg_mpg)) + geom_col()

## ----ggplot_col-points, fig.cap = "Adding points to a `geom_col()` plot."----
ggplot(average_mpg_by_cyl, aes(cyl, avg_mpg)) + 
  geom_col() +
  geom_point(size = 8)

## ----ggplot_col-inherited, fig.width = 5, fig.cap = "The `col` aesthetic is inherited this changes the border line colour for `geom_col()`."----
ggplot(average_mpg_by_cyl, aes(cyl, avg_mpg, col = factor(cyl))) + 
  geom_col() +
  geom_point(size = 8)

## ----ggplot_fill, fig.width = 5, fig.cap = "The `fill` aesthetic changes the internal colour of the bars."----
ggplot(average_mpg_by_cyl, aes(cyl, avg_mpg, fill = factor(cyl))) + 
  geom_col(col = "grey50", lwd = 2) +
  geom_point(col = "grey30", size = 6)

## ----ggplot_boxplot, fig.width = 5, fig.cap = "A boxplot shows the data extent within a category."----
ggplot(mtcars, aes(cyl, mpg, col = factor(cyl))) + 
  geom_boxplot()

## ----ggplot_boxplotpoint, fig.width = 5, fig.cap = "A boxplot with points overplotted."----
ggplot(mtcars, aes(cyl, mpg, col = factor(cyl))) + 
  geom_boxplot() + 
  geom_point()

## ----ggplot_violin, fig.width = 5, fig.cap = "A violin extends the notion of a boxplot by showing the distribution of plots within each category."----
ggplot(mtcars, aes(cyl, mpg, col = factor(cyl))) + 
  geom_violin()

## ----ggplot_smooth, fig.cap = "A smoothing function shows the local trend at any point (with confidence interval shading)."----
ggplot(mtcars, aes(mpg, hp)) +
  geom_point() +
  geom_smooth()

## ----ggplot_not0, fig.cap = "Note that the axes don't start at `0`; they have been chosen to emphasise the existing data."----
ggplot(mtcars, aes(mpg, disp)) + geom_point()

## ----ggplot_scalex, fig.cap = "Changing the `x` axis scaling with `scale_x_continuous` to start the range at `0`."----
ggplot(mtcars, aes(mpg, disp)) + 
  geom_point() + 
  scale_x_continuous(limits = c(0, 40))

## ----ggplot_scalexy, fig.cap = "Both axes can be scaled however you decide."----
ggplot(mtcars, aes(mpg, disp)) + 
  geom_point() + 
  scale_x_continuous(limits = c(0, 40)) +
  scale_y_continuous(limits = c(0, 500))

## ----ggplot_missinglevels, fig.cap = "This shows the three existing levels in `cyl`."----
ggplot(mtcars, aes(factor(cyl), hp)) + 
  geom_point()

## ----ggplot_limits, fig.cap = "We can extend the scale to a not-yet-present fourth level."----
ggplot(mtcars, aes(factor(cyl), hp)) + 
  geom_point() + 
  scale_x_discrete(limits = as.character(seq(2, 8, by = 2))) 

## ----ggplot_morelimits, fig.cap = "Categories appear at even spacing along the axis by default."----
ggplot(mtcars, aes(factor(cyl), hp)) + 
  geom_point() + 
  scale_x_discrete(limits = as.character(c(1, 4, 6, 8)))

## ----creating a 12 days of christmas dataset-----------------------------
gifts <- data.frame(
  gift = c("French\nHens", "Turtle\nDoves", "Calling\nBirds"), 
  n_items = c(3, 2, 4)
)

## ----ggplot_gifts3, fig.cap = "Three categories (factor levels) plotted."----
ggplot(gifts, aes(gift, n_items)) + 
  geom_point()

## ----ggplot_gifts12, fig.width = 8, fig.height = 7, dpi = 72, fig.cap = "We can provide more levels in the scale even if they don't yet exist in the data."----
all_gifts <- c(
  "Partridge\nin\na\nPear\nTree",
  "Turtle\nDoves",
  "French\nHens",
  "Calling\nBirds",
  "Gold\nRings",
  "Geese\na-Laying",
  "Swans\na-Swimming",
  "Maids\na-Milking",
  "Ladies\nDancing",
  "Lords\na-Leaping",
  "Pipers\nPiping",
  "Drummers\nDrumming"
)

ggplot(gifts, aes(gift, n_items)) + 
  geom_point() + 
  scale_x_discrete(limits = all_gifts) +               
  scale_y_continuous(limits = c(1, 12), breaks = 1:12) 

## ----ggplot_defaultcols, fig.width = 5, fig.cap = "Default colours for three levels."----
ggplot(mtcars, aes(disp, mpg, col = factor(cyl))) +
  geom_point()

## ----ggplot_scalecol, fig.width = 5, fig.cap = "Starting the colour wheel at 30 degrees results in different colours."----
ggplot(mtcars, aes(disp, mpg, col = factor(cyl))) +
  geom_point() +
  scale_color_discrete(h.start = 30) 

## ----ggplot_scalemanual, fig.width = 5, fig.cap = "We can manually choose colours too."----
ggplot(mtcars, aes(disp, mpg, col = factor(cyl))) +
  geom_point() +
  scale_color_manual(values = c("saddlebrown", "goldenrod", "forestgreen"))

## ----ggplot_groupcolor, fig.width = 5, fig.cap = "One way to show another dimension is to use colour to distinguish levels of a group."----
ggplot(mtcars, aes(mpg, disp, col = factor(carb))) +
  geom_point() 

## ----ggplot_facet, fig.width = 9, fig.cap = "Facetting moves each category level to its own plot."----
ggplot(mtcars, aes(mpg, disp, col = factor(carb))) +
  geom_point() +
  facet_wrap(~ carb)

## ----ggplot_facetfree, fig.width = 9, fig.cap = "Using `scales = \"free\" means the scale in each facet panel is independent."----
ggplot(mtcars, aes(mpg, disp, col = factor(carb))) +
  geom_point() +
  facet_wrap(~ carb, scales = "free")

## ----ggplot_facetfreex, fig.width = 9, fig.cap = "We can keep only one axis fixed using scales = \"free_x\"."----
ggplot(mtcars, aes(mpg, disp, col = factor(carb))) +
  geom_point() +
  facet_wrap(~ carb, scales = "free_x")

## ----ggplot_facetgrid, fig.width = 9, fig.cap = "We can make comparisons between two levels in a grid of values using `facet_grid()`."----
ggplot(mtcars, aes(mpg, disp, col = factor(carb))) +
  geom_point() +
  facet_grid(am ~ carb)

## ----ggplot_facetgridfree, fig.width = 9, fig.cap = "Using the `scales` argument to make the axes independent."----
ggplot(mtcars, aes(mpg, disp, col = factor(carb))) +
  geom_point() +
  facet_grid(am ~ carb, scales = "free")

## ----ggplot_datasaurus, echo = FALSE, message = FALSE, fig.cap = "Can you see the patterns in this plot? There are 13 different datasets."----
library(datasauRus)
ggplot(datasaurus_dozen, 
  aes(x = x, y = y, colour = dataset)) +
    geom_point() +
    theme(legend.position = "none") 

## ----ggplot_datasaurus-facet, echo = FALSE, message = FALSE, fig.width = 9, fig.height = 9, dpi = 72, fig.cap = "The datasets are revealed with facetting."----
library(datasauRus)
ggplot(datasaurus_dozen, aes(x = x, y = y, colour = dataset)) +
    geom_point() +
    theme(legend.position = "none") +
    facet_wrap( ~ dataset, ncol = 3)

## ----ggplot_defaulttheme, fig.cap = "The default theme for `ggplot2` plots in action."----
ggplot(mtcars, aes(cyl, mpg)) + 
  geom_point()

## ----ggplot_themebw, fig.cap = "`theme_bw()` is a bit clearer and less styled than the default."----
ggplot(mtcars, aes(cyl, mpg)) + 
  geom_point() + 
  theme_bw()

## ----ggplot_themeclassic, fig.cap = "Just the essentials with `theme_classic()`."----
ggplot(mtcars, aes(cyl, mpg)) + 
  geom_point() + 
  theme_classic()

## ----ggplot_thememin, fig.cap = "There is very little apart from the data here."----
ggplot(mtcars, aes(cyl, mpg)) + 
  geom_point() + 
  theme_minimal()

## ----ggplot_serif, fig.cap = "Changing the text family is achieved through arguments to `theme()`."----
ggplot(mtcars, aes(cyl, mpg)) +
  geom_point() +
  theme_minimal() + 
  theme(text = element_text(family = "serif"))

## ----storing a plot object as a variable---------------------------------
p <- ggplot(mtcars, aes(cyl, mpg, col = factor(cyl))) +
  theme_minimal() + 
  facet_wrap(~ am)

## ----ggplot_saved, fig.cap = "A plot produced from the saved variable `p`."----
p

## ----ggplot_savedplus, fig.width = 5, fig.cap = "Adding a `geom_point()` call to a variable containing a `ggplot2` plot object."----
p + geom_point() 

## ----ggplot_savedplusbox, fig.width = 5, fig.cap = "Adding a `geom_boxplot()` call to a variable containing a `ggplot2` plot object."----
p + geom_boxplot()

## ----saving a ggplot explicitly, eval = FALSE----------------------------
## p <- ggplot(mtcars, aes(cyl, mpg)) + geom_point()
## ggsave(plot = p) 

## ----saving a plot implicitly, eval = FALSE------------------------------
## p <- ggplot(mtcars, aes(cyl, mpg)) + geom_point()
## ggsave() 

