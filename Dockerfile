FROM rocker/verse:4.1.2

RUN /rocker_scripts/install_python.sh

RUN /rocker_scripts/install_pandoc.sh

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends --yes \
    awscli \
    jq \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade awscli \
    && install2.r --error -r 'http://cran.rstudio.com' botor \
    markdown \
    kableExtra \
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

USER rstudio

COPY ./scripts/* /home/rstudio
RUN /home/rstudio/install_py_packages.R

user root

WORKDIR /home/rstudio