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

# apt_install \
   

install2.r --error --skipmissing --skipinstalled -n "$NCPUS" \
    alphavantager \
    anytime \
    attachment \
    attempt \
    Boom \
    BoomSpikeSlab \
    bsicons \
    clock \
    colourpicker \
    config \
    crsmeta \
    crul \
    datawizard \
    devEMF \
    diagram \
    editData \
    extrafont \
    extrafontdb \
    filelock \
    flexdashboard \
    flextable \
    fontBitstreamVera \
    fontLiberation \
    fontquiver \
    forecast \
    forge \
    formattable \
    fracdiff \
    furrr \
    future.apply \
    gapminder \
    gdtools \
    gfonts \
    gganimate \
    ggExtra \
    ggforce \
    ggmap \
    ggstream \
    golem \
    gower \
    hardhat \
    highcharter \
    httpcode \
    insight \
    ipred \
    IRdisplay \
    IRkernel \
    ISLR2  \
    jalcal \
    janitor \
    jpeg \
    jqr \
    kableExtra 


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