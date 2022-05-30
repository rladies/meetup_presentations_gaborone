# R-Ladies Gaborone July 2022 Workshop: Reproducible Research with R (Markdown)

![image](https://user-images.githubusercontent.com/24517243/168156852-f9e64853-611b-46af-92f8-fa1469e64722.png)

### Information and Instructions to Prepare for the Workshop

To follow along, you will need to do two things before the workshop:

<ol>
<li> Install R and R Studio 
  <ul>
  <li> <b>VERY IMPORTANT</b>: RStudio <b><u>must be at least version 1.4</b></u> to use the functionality we will cover in this workshop; if you have an old version please download and install the latest version with the instructions below
    <li> To check what version of RStudio you have, open RStudio, click on the <b>Help</b> menu, and click on <b>About RStudio</b>, the version number will be right below the big <b>RStudio</b> in the pop-up window
  </ul>
<li> Download and save workshop materials
<li> Install the rmarkdown, tidyverse, haven, finalfit, knitr, and table1 packages (if you do not already have them)
</ol>

Follow the instructions below to install and download everything you will need.

### Install R and R Studio

R is the software and R Studio is the IDE (Interactive Development Environment) that makes R easier to use. Install R **before** you install R Studio because R Studio will look for R during installation.

First, download and install R:

<ul>
  <li> Click the <b>download R</b> link on the <a href = "https://www.r-project.org">R Project for Statistical Computing</a> website
  <li> Choose one of the options from the <a href = "https://cran.r-project.org/mirrors.html">CRAN Mirrors</a> list (it doesn't matter which one!)
  <li> Click on the download that is appropriate for your operating system, Linux, Mac, or Windows; if you are not given this option, go back to the <a href = "https://cran.r-project.org/mirrors.html">CRAN Mirrors</a> and try a different one
  <li> Find the link for <b>install R for the first time</b> and click on it
  <li> Click on the the <b>Download R</b> link on the page that opens
  <li> Use the installer that downloads to install R 
</ul>

Second, download and install R Studio:

<ul>
  <li> Go to the R Studio <a href = "https://rstudio.com/products/rstudio/download/"> downloads page</a> 
  <li> Click on the DOWNLOAD button under the RStudio Desktop column on the downloads page
  <li> Choose the Download for the operating system you have and click on it  
  <li> Use the installer that downloads to install R Studio 
</ul>

### Download and Save Workshop Materials

Download the participant files and save them together in the same folder on your computer:

<ul>
<li> Click on the green Code button toward the top of this GitHub page
<li> Choose Download ZIP
<li> Unzip the downloaded zip file and save all the files in a single folder on your computer
</ul>

### Install the rmarkdown, tidyverse, haven, finalfit, knitr and table1 packages

Open RStudio and follow these instructions:

<ul>
<li> Click on the Tools menu
<li> Type <b>rmarkdown, tidyverse, haven, table1, finalfit, knitr</b> into the dialog box that opens
    <ul>
    <li>rmarkdown: package allows you to use the features of RMarkdown</li>
    <li>tidyverse: package used primarily for data management</li>
    <li>haven: package for opening SPSS files and other data types</li>
    <li>table1: package for making well-formatted tables for html documents</li>
    <li>finalfit: package for creating tables that work in html and Microsoft word output</li>
    <li>knitr: package for implementing some of the formatting options in RMarkdown</li>
    </ul>
<li> Click install (R will do stuff for a while, this might look like errors but is fine)
</ul>

### R Resources

<a href = "https://docs.google.com/presentation/d/1g52v5phQ45f7SQlI9mIFNPEn0I8MCzqmxogzmB-iALU/edit?usp=sharing">Slides from the presentation introduction</a>

Other places to get more instruction or information on R:

<ul>
  <li> https://swirlstats.com
  <li> https://tinystats.github.io/teacups-giraffes-and-statistics/index.html
  <li> https://github.com/Joscelinrocha/Learning-R-resources/wiki#wiki-pages-box
  <li> Check out the #rstats hashtag on Twitter and follow the people who tweet about #rstats 
  <li> https://community.rstudio.com
  <li> ...and so many more!
</ul>
