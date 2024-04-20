#!/bin/bash

set -e

## build ARGs
NCPUS=${NCPUS:--1}

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

apt_install \
   lsb-release \
   libcurl4-openssl-dev \
   libcairo2-dev \
   xtail \
   libfreetype6-dev \
   libtiff5-dev \
   vim \
   r-cran-devtools \
   sudo \
   gdebi-core \
   lsb-release \
   libcurl4-openssl-dev \
   libcairo2-dev \
   libxt-dev \
   xtail \
   wget   
    

install2.r --error --skipmissing --skipinstalled -n "$NCPUS" \
    DT \
    shiny \
    shinydashboardPlus \
    future \
    BH \
    shinyfullscreen \
    shinymanager \
    shinyjs \
    summarytools \
    doParallel \
    markdown \
    showtext \
    shinythemes \
    GGally \
    dbplot \
    benchmarkme \
    tidypredict \
    openxlsx \
    corrr \
    rnaturalearth \
    collapse \
    ggcorrplot \
    scatterPlotMatrix \
    ggthemes \
    rworldmap \
    rgeos \
    nptest \
    terra \
    translations \
    zeallot \
    modeldb \
    raster \
    s2 \
    lme4 \
    nycflights13 \
    factoextra \
    thematic \
    plumber



## a bridge to far? -- brings in another 60 packages
# install2.r --error --skipinstalled -n "$NCPUS" tidymodels

# Clean up
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/downloaded_packages

## Strip binary installed lybraries from RSPM
## https://github.com/rocker-org/rocker-versioned2/issues/340
strip /usr/local/lib/R/site-library/*/libs/*.so

# Check the tidyverse core packages' version
echo -e "Check the shinydashboardPlus package...\n"

R -q -e "library(shinydashboardPlus)"

echo -e "\nInstall shinydashboardPlus package, done!"
