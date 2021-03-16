[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Last-changedate](https://img.shields.io/github/last-commit/Thaliehln/timci.svg)](https://github.com/Thaliehln/timci/commits/master)

# Tools for Integrated Management of Childhood Illnesses (TIMCI)

`timci` is a R package for managing, exporting Markdown reports and visualising in a Shiny app the data collected by ODK for the different studies of the TIMCI project (Tools for Integrated Management of Childhood Illnesses). 

The TIMCI project is funded by [Unitaid](https://unitaid.org/) and led by PATH, in partnership with the Swiss Tropical and Public Health Institute.

The overall goal of the TIMCI project is to reduce morbidity and mortality in sick children attending primary care facilities, while supporting the rational and efficient use of diagnostics and medicines by healthcare providers. The project is conducted in three African countries (Kenya, Senegal and Tanzania) and two Asian countries (India and Myanmar), in collaboration with University of Nairobi, Université Cheikh Anta Diop de Dakar, Ifakara Health Institute, King's College Medical University and Burnet Institute.

## Getting started

### Installation of timci from GitHub
You can download the `master` branch of the `timci` package.  
![image](https://user-images.githubusercontent.com/71643277/111299284-0d164100-8650-11eb-8688-8bd152214d56.png)

### Prerequisites
This package was developed on a Windows 10 operating system, with R version 4.0.2 (2020-06-22) ([R download](https://cran.r-project.org/mirrors.html)) and RStudio version 1.4.1106 ([RStudio download](https://rstudio.com/products/rstudio/download/#download)).   
You need to have the following R packages installed: `ruODK`, `hash`, `shiny`, `qrcode`, `readxl`, `ggplot2`, `dplyr`, `viridis`, `pryr`, `flexdashboard`, `shiny`, `magrittr`, `utils`, `scales`, `grDevices`, `stats`, `tidyr`, `DT`, `data.table`, `openxlsx`, `rmarkdown`, `stringr`, `qwraps2`, `digest`, `readr`, `fs`.

### Setup of the ODK Central connection
You need to setup `ruODK` by creating environment variables in `~/.Renviron` containing the OData service URL of your main project as well as your credentials (username and password) on ODK Central:
```bash
ODKC_SVC="https://.../v1/projects/.../forms/....svc"
ODKC_UN=me@email.com
ODKC_PW=...
TZ="Europe/Zurich"
```
For more information about `ruODK`, there are lots of great resources available at [https://docs.ropensci.org/ruODK/](https://docs.ropensci.org/ruODK/)

For more information about the `ODK Central API`, there are lots of great resources available at [https://odkcentral.docs.apiary.io/](https://odkcentral.docs.apiary.io/)

### Setup specific to the TIMCI project
For the TIMCI project, you need to set the following environment variables in your `~/.Renviron` file:
```bash
TIMCI_INSTITUTION="Swiss Tropical and Public Health Institute"
TIMCI_MAIN_STUDY="Pragmatic cluster RCT"
TIMCI_PII_PW=...
TIMCI_CRF_FACILITY_FID="01-TIMCI-CRF-Facility"
TIMCI_CRF_DAY7_FID="01c-TIMCI-CRF-Day7"
TIMCI_CRF_HOSPIT_FID="01b-TIMCI-CRF-Hospital"
TIMCI_CRF_DAY28_FID="01d-TIMCI-CRF-Day28"
TIMCI_SPA_PID=2
TIMCI_SPA_CGEI_FID="02-TIMCI-SPA-CGEI"
TIMCI_SPA_FA_FID="03-TIMCI-SPA-Fassmt"
TIMCI_SPA_SCO_FID="05-TIMCI-SPA-SCO"
TIMCI_SPA_HCPI_FID="04-TIMCI-SPA-HCPi"
TIMCI_QUAL_PID=12
TIMCI_QUAL_CGIDI1_FID="08a-TIMCI-cg-idi-invitation"
TIMCI_QUAL_CGIDI2_FID="08b-TIMCI-cg-idi-encryption-list"
TIMCI_QUAL_CGIDI3_FID="08c-TIMCI-cg-idi-interview"
TIMCI_WD_FID="99-TIMCI-withdrawal"
```

`TIMCI_INSTITUTION` is an environment variable that sets the name of your institution (Burnet Institute, Ifakara Health Institute, King George's Medical University, Université Cheikh Anta Diop de Dakar, University of Nairobi).

`TIMCI_MAIN_STUDY` is an environment variable that sets the type of study for the main data collection. It should be set to `Pragmatic cluster RCT` in Tanzania and India, and `Observational Longitudinal Study` in Kenya, Myanmar, and Senegal.

`TIMCI_PII_PW` is an environment variable that sets the password of the encrypted archive that is generated by the R pipeline to store confidential information (and in particular, personally identifiable information).

`TIMCI_CRF_FACILITY_FID` is an environment variable that sets the ODK Central ID for the facility form

`TIMCI_CRF_DAY7_FID` is an environment variable that sets the ODK Central ID for the Day 7 follow-up form

`TIMCI_CRF_HOSPIT_FID` is an environment variable that sets the ODK Central ID for the hospitalisation follow-up form

`TIMCI_CRF_DAY28_FID` is an environment variable that sets the ODK Central ID for the Day 28 follow-up form

`TIMCI_SPA_PID` is an environment variable that sets the ODK Central ID for the Service Provision Assessment (SPA) project

`TIMCI_QUAL_PID` is an environment variable that sets the ODK Central ID for the qualitative study project

`TIMCI_SPA_CGEI_FID` is an environment variable that sets the ODK Central ID for the SPA caregiver exit interview form

`TIMCI_SPA_FA_FID` is an environment variable that sets the ODK Central ID for the SPA facility assessment form

`TIMCI_SPA_SCO_FID` is an environment variable that sets the ODK Central ID for the SPA sick child observation protocol form

`TIMCI_SPA_HCPI_FID` is an environment variable that sets the ODK Central ID for the SPA healthcare provider interview form

`TIMCI_WD_FID` is an environment variable that sets the ODK Central ID for the withdrawal form

![image](https://user-images.githubusercontent.com/71643277/110971003-9d0b7080-835a-11eb-9b56-eb493d4c5e27.png)

### Setup of the automated R Markdown pipeline
`pandoc` is a document converter that can convert files from one markup format into another (e.g., .docx, .pdf etc). It is an independent piece of software, separate from R. However, it comes bundled with R Studio because the `rmarkdown` package relies on it for document conversion. Rstudio uses the `RSTUDIO_PANDOC` environment variable to find where `pandoc` is installed on your machine. To use `rmarkdown` in a batch, `RSTUDIO_PANDOC` needs to be set in your `~/.Renviron` file:
```bash
RSTUDIO_PANDOC='C:/Program Files/RStudio/bin/pandoc'
```

## Run a generic Shiny app 
`run_mini_app` should work with any ODK Central server
```R
library(timci)
timci::run_mini_app()
```
## Run the TIMCI Shiny app
`run_app` requests an access to a TIMCI ODK Central server.
```R
library(timci)
timci::run_app()
```

## Generate R Markdown reports for TIMCI (manual)
`run_rmarkdown` requests an access to a TIMCI ODK Central server.

```R
library(timci)
output_dir <- "my_directory"
subdir <- paste0("export_", Sys.Date())
dir.create(file.path(output_dir, subdir), showWarnings = FALSE)
dir.create(file.path(output_dir, subdir, "01_rct_ls"), showWarnings = FALSE)
dir.create(file.path(output_dir, subdir, "01_rct_ls", "01_database"), showWarnings = FALSE)
dir.create(file.path(output_dir, subdir, "01_rct_ls", "02_followup"), showWarnings = FALSE)
dir.create(file.path(output_dir, subdir, "02_spa"), showWarnings = FALSE)
dir.create(file.path(output_dir, subdir, "02_spa", "01_database"), showWarnings = FALSE)
dir.create(file.path(output_dir, subdir, "03_qualitative"), showWarnings = FALSE)
dir.create(file.path(output_dir, subdir, "03_qualitative", "01_caregiver_idis"), showWarnings = FALSE)
dir.create(file.path(output_dir, subdir, "03_qualitative", "02_provider_idis"), showWarnings = FALSE)
dir.create(file.path(output_dir, subdir, "04_cost"), showWarnings = FALSE)
dir.create(file.path(output_dir, subdir, "05_reports"), showWarnings = FALSE)
timci::run_rmarkdown(file.path(output_dir,subdir, "05_reports"),
                     file.path(output_dir, subdir, "01_rct_ls", "participants.zip"),
                     file.path(output_dir, subdir, "01_rct_ls", "01_database"),
                     file.path(output_dir, subdir, "01_rct_ls", "02_followup"),
                     file.path(output_dir, subdir, "03_qualitative", "01_caregiver_idis"),
                     file.path(output_dir, subdir, "03_qualitative", "01_provider_idis"),
                     file.path(output_dir, subdir, "02_spa", "01_database"))
```
## Generate R Markdown reports for TIMCI (automated pipeline)
### Setup of the Windows task scheduler
Save the code needed to generate R Markdown reports for TIMCI (manual) in a R script, e.g. `timci_daily_routine.R`

Create a .bat file that calls `timci_daily_routine.R`
```bat
cd dirname
"...\Rscript.exe" ...\timci_daily_routine.R
PAUSE
```

1. Open the task scheduler

![image](https://user-images.githubusercontent.com/71643277/110971229-e360cf80-835a-11eb-9e66-c9a328b8493b.png)

2. Action > Create Task

![image](https://user-images.githubusercontent.com/71643277/110971196-d8a63a80-835a-11eb-9557-a37b7ece4f6c.png)

3. ... (to be completed soon)

![image](https://user-images.githubusercontent.com/71643277/110971144-cb894b80-835a-11eb-9797-e5b0c71a911b.png)  
![image](https://user-images.githubusercontent.com/71643277/110971360-12774100-835b-11eb-8d84-a7ed9f7b02bf.png)  
![image](https://user-images.githubusercontent.com/71643277/110971385-1b681280-835b-11eb-8510-6ca0ea8f7bc3.png)

## Valuable resources

### ODK resources
[OpenDataKit (ODK)](https://getodk.org/) is a free-and open-source software that helps millions of people collect data quickly, accurately, offline, and at scale. [ODK Central](https://docs.getodk.org/central-intro/) is the latest cloud-based data clearinghouse ODK solution for digitally captured data.

1. [ODK Central setup](https://docs.getodk.org/central-setup/)

2. [ODK Central apiary](https://odkcentral.docs.apiary.io/) contains a very comprehensive documentation of the ODK Central RESTful API. Note that anything that can be done in the ODK Central's web user interface can be done directly via the API.

3. [RuODK](https://docs.ropensci.org/ruODK/) is an open-source R client to access and parse data from ODK Central, which is developed and maintained by Florian Mayer for the Western Australian Department of Biodiversity, Conservation and Attractions (DBCA).

4. [ODK forum](https://forum.getodk.org/) already contains a fantastic amount of information and the core ODK team is very reactive.

### R resources

<a href="https://shiny.rstudio.com/articles/"><img src="http://r-pkgs.org/images/cover.png" height="252" align = "right"/></a>

1. [Shiny package](https://shiny.rstudio.com/articles/) has extensive documentation on best practices for R Shiny application development.

2. (reproduced as is from the Devtools README) There are a number of fantastic blog posts on writing your first package, including
   - [Writing an R package from scratch - Hilary Parker](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
   - [How to develop good R packages - Maëlle Salmon](http://www.masalmon.eu/2017/12/11/goodrpackages/)
   - [Making your first R package - Fong Chun Chan](http://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html)
   - [Writing an R package from scratch - Tomas Westlake](https://r-mageddon.netlify.com/post/writing-an-r-package-from-scratch/)

3. (reproduced as is from the Devtools README) [Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html) is
   the exhaustive, canonical reference for writing R packages, maintained by R core developers.

#### R cheatsheets / reference guides
<a href="https://rawgit.com/rstudio/cheatsheets/master/package-development.pdf"><img src="https://raw.githubusercontent.com/batpigandme/cheatsheets/1c942c36846559b3e8efbd40d023bc351aeed6ba/pngs/thumbnails/package-development-thumbs.png" height="252"/></a>

<a href="https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf"><img src="https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference-guide.png" height="252"/></a>

## Contributing
Pull requests are welcome on the `develop` branch. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[GPL-3]
