FROM rocker/verse

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends python3-pip \
    && pip3 install boto3 \
    && install2.r --error -r 'http://cran.rstudio.com' botor \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/downloaded_packages/*

WORKDIR /home/rstudio