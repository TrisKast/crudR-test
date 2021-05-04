# get shiny serves plus tidyverse packages image as base
FROM rocker/shiny-verse:latest

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev 

# install R packages required 
RUN R -e "install.packages('shiny')"
RUN R -e "install.packages('DT')"
RUN R -e "install.packages('DBI')"
RUN R -e "install.packages('RSQLite')"
RUN R -e "install.packages('shinyjs')"
RUN R -e "install.packages('shinycssloaders')"
RUN R -e "install.packages('lubridate')"
RUN R -e "install.packages('shinyFeedback')"
RUN R -e "install.packages('dplyr')"
RUN R -e "install.packages('dblyr')"
RUN R -e "install.packages('config')"
RUN R -e "install.packages('uuid')"
#RUN R -e "install.packages('RMySQL')"

# Copy actual shiny app over into container
COPY . /srv/shiny-server/

# Default for database technology, can be changed to mysql
#ENV DB_TECH sqlite

# select port
EXPOSE 3838

# allow permission
RUN sudo chown -R shiny:shiny /srv/shiny-server

# run app
CMD ["/usr/bin/shiny-server"]