FROM rocker/rstudio


############### part 01 masoudfaridi/rstudio-4-3-3:001
RUN apt-get -y update
COPY scripts /rocker_scripts
ENV CRAN=https://cran.um.ac.ir
RUN /rocker_scripts/install_tidyverse.sh

############### part 02 masoudfaridi/rstudio-4-3-3:002
RUN /rocker_scripts/install_geospatial.sh

RUN apt-get -y update
############### part 03 masoudfaridi/rstudio-4-3-3:003
RUN /rocker_scripts/install_verse.sh

############### part 04 masoudfaridi/rstudio-4-3-3:004
RUN /rocker_scripts/install_python.sh


############### part 05 masoudfaridi/rstudio-4-3-3:005
# COPY scripts/install_R_packages_masoud_part_01.sh /rocker_scripts
RUN /rocker_scripts/install_R_packages_masoud_part_01.sh


############### part 05 masoudfaridi/rstudio-4-3-3:006
# Not in CRAN
RUN R -e "BiocManager::install('Biostrings')"
RUN R -e "BiocManager::install('kebabs')"
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/ConvCalendar/ConvCalendar_1.2.tar.gz',repos=NULL, type='source')"
RUN R -e "install.packages('rnaturalearthhires', repos = 'https://ropensci.r-universe.dev', type = 'source')"
RUN R -e "install.packages('maptools', repos = 'https://cran.um.ac.ir/src/contrib/Archive/maptools/maptools_1.1-8.tar.gz')"
RUN R -e "install.packages('rgeos', repos = 'https://cran.um.ac.ir/src/contrib/Archive/rgeos/rgeos_0.6-4.tar.gz')"
RUN R -e "install.packages('spatstat.core', repos = 'https://cran.um.ac.ir/src/contrib/Archive/spatstat.core/spatstat.core_2.4-4.tar.gz')"



        

############### part 06 masoudfaridi/rstudio-4-3-3:007
# Not in CRAN
# COPY scripts/install_R_packages_masoud_part_02.sh /rocker_scripts
RUN /rocker_scripts/install_R_packages_masoud_part_02.sh


############### part 05 masoudfaridi/rstudio-4-3-3:008
# Not in CRAN
# COPY scripts/install_R_packages_masoud_part_03.sh /rocker_scripts
RUN /rocker_scripts/install_R_packages_masoud_part_03.sh


############### part 05 masoudfaridi/rstudio-4-3-3:009
# Not in CRAN
# COPY scripts/install_R_packages_masoud_part_04.sh /rocker_scripts
RUN /rocker_scripts/install_R_packages_masoud_part_04.sh


############### part 05 masoudfaridi/rstudio-4-3-3:009
# Not in CRAN
# COPY scripts/install_R_packages_masoud_part_05.sh /rocker_scripts
RUN /rocker_scripts/install_R_packages_masoud_part_05.sh

############### part 05 masoudfaridi/rstudio-4-3-3:010
# Not in CRAN
# COPY scripts/install_R_packages_masoud_part_06.sh /rocker_scripts
RUN /rocker_scripts/install_R_packages_masoud_part_06.sh


############### part 05 masoudfaridi/rstudio-4-3-3:011
# Not in CRAN
RUN R -e "remotes::install_github('rstudio/shinyuieditor')"
RUN R -e "remotes::install_github('andrewzm/STRbook')"
RUN R -e "devtools::install_github('zac-garland/zgtools')"
RUN R -e "devtools::install_github('rstudio/gridlayout')"
RUN R -e "remotes::install_github('rstudio/shinyuieditor')"





                     
                    








# FROM rocker/rstudio
# FROM masoudfaridi/rstudio-4-3-3:001
# FROM masoudfaridi/rstudio-4-3-3:002
# FROM masoudfaridi/rstudio-4-3-3:003
# FROM masoudfaridi/rstudio-4-3-3:004
# FROM masoudfaridi/rstudio-4-3-3:005
# FROM masoudfaridi/rstudio-4-3-3:006
# FROM masoudfaridi/rstudio-4-3-3:007
# FROM masoudfaridi/rstudio-4-3-3:008
