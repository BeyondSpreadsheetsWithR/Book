## ----list of base packages, echo = FALSE---------------------------------
rownames(installed.packages(priority = "base"))

## ----list of base functions, eval = FALSE--------------------------------
## help(package = "base")

## ----list of datasets, eval = FALSE--------------------------------------
## help(package = "datasets")

## ----help for the mean() function, eval = FALSE--------------------------
## ?mean

## ----functions which are not defined can not be searched, eval = FALSE, eval = FALSE----
## ?nonExistentFunction

## ----search the help files for a string, eval = FALSE--------------------
## ??mean

## ----install the plot3D package, eval = FALSE----------------------------
## # The plot3D package produces 3D plots.
## # Install it using
## install.packages(pkgs = "plot3D")

## ----load the volcano vignette from the plot3D package, eval = FALSE-----
## # Vignette: Fifty ways to draw a volcano using package plot3D
## vignette(topic = "volcano")

## ----browse all available vignettes, eval = FALSE------------------------
## browseVignettes(all = TRUE)

