# Beyond Spreadsheets with R

<!-- https://stackoverflow.com/a/42677655/4168169 -->
<!--
	git checkout --orphan assets
	git reset --hard
	cp /path/to/cat.png .
	git add .
	git commit -m 'Added cat picture'
	git push -u origin assets
	git rev-parse HEAD  # Print the SHA, which is needed below.
	Construct a "permalink" to this revision of the image, and wrap it in Markdown:
	
	![Cat](https://raw.githubusercontent.com/{user}/{repo}/{sha}/cat.png)
	
	e.g.
	
	![Cat](https://raw.githubusercontent.com/paulmelnikow/zsh-startup-timer/3923c60fc66d4223ccf063d169ccf2ff167b1270/cat.png)
	
	To always show the latest image on the assets branch, use assets in place of the sha:
	
	![Cat](https://raw.githubusercontent.com/{user}/{repo}/assets/cat.png)
-->
<img src="https://raw.githubusercontent.com/BeyondSpreadsheetsWithR/Book/7058e0b57c7c5e40459528e7bab13b7a7a40d391/Carroll-BSwithR-MEAP-HI.png" width = "50%" title = "MEAP Cover">

<br />

## Code Resources

### Installing R Packages Used in the Book

Each of the R packages you need to run the code in the book are listed
as you need them throughout the book. If you want to get a headstart,
you can install all of the necessary packages using the `switchr`
package and a manifest file. The added benefit of this method is that
you will always be able to install the versions of the packages
_actually_ used to generate the code output in the book.

First, follow the instructions in the appendix to install R.

If you're on a Windows computer, you'll likely need to install RTools
for your versions of R and Windows. If you're on Mac you'll likely
need to install XCode.

Install the `switchr` package from CRAN (the Comprehensive R Archive
Network) using the following command inside an R session

```r
install.packages("switchr")
```

The manifest file is hosted here: <a
href="https://raw.githubusercontent.com/BeyondSpreadsheetsWithR/Book/assets/BeyondSpreadsheetsManifest.rds">BeyondSpreadsheetsManifest.rds</a>. Download
this file to your computer.

Next you need to switch to a new package library which will be seeded
with the required packages. Change the path to reflect where you saved
the manifest file.

```r
BeyondSpreadsheetsManifest <- readRDS("/path/to/BeyondSpreadsheetsManifest.rds")
switchTo("BeyondSpreadsheets", seed = BeyondSpreadsheetsManifest)
```

This should then install all of the required packages into a special
library which you can switch to at any time. This may take some time,
depending on your internet connection, and a *lot* of text is going to
go scrolling past. Don't be frightened if you see the occasional error
message, such as

```
Failed with error:  ‘there is no package called ‘RCurl’’
```

When you're done with the book examples, you can switch back to your
normal R package library using

```r
switchBack()
```

The next time you wish to again work with this special library, you
can switch to it with just

```r
library(switchr)
switchTo("BeyondSpreadsheets")
```

## Buy the Book (physical, pdf, ePub, kindle, liveBook)

https://www.manning.com/books/beyond-spreadsheets-with-r