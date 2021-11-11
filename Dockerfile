FROM rocker/verse

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends --yes \
    python3-pip \
    awscli \
    jq \
    pandoc \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade awscli \
    && pip3 install boto3 \
    && install2.r --error -r 'http://cran.rstudio.com' botor \
    pacman \
    RJDBC \
    RODBC \
    flexdashboard \
    DT \
    xlsx \
    psych \
    bpa \
    compare \
    arsenal \
    Jmisc \
    secret \
    doBy \
    factoextra \
    fuzzyjoin \
    ggvis \
    tidymodels \
    car \
    multcomp \
    qualV \
    stringdist \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/downloaded_packages/*

WORKDIR /home/rstudio