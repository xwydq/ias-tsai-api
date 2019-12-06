# start from the rocker/r-ver:3.5.0 image
# FROM rocker/r-ver:3.5.0 
# r-base https://hub.docker.com/_/r-base?tab=tags
FROM r-base

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

# install plumber
RUN R -e "install.packages(c('plumber', 'dplyr', 'jsonlite', 'lubridate'))"


# copy everything from the current directory into the container
COPY / /

# open port 80 to traffic
EXPOSE 8188

# when the container starts, start the run R script
ENTRYPOINT ["Rscript", "tsAI_api_run.R"]