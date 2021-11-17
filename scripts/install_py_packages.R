#!/usr/bin/env Rscript

library(reticulate)

venv_name = "r-reticulate"
virtualenv_create(venv_name)
use_virtualenv(venv_name)

py_packages <- c("boto3==1.17.106",
    "botocore==1.20.106",
    "s3fs==2021.11.0",
    "pandas",
    "awswrangler",
    "psycopg2-binary==2.9.1")

py_install(py_packages, envname = venv_name, method = "virtualenv")
