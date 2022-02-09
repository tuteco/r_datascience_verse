#!/usr/bin/env Rscript

library(reticulate)

venv_name = "r-reticulate"
virtualenv_create(venv_name)
use_virtualenv(venv_name)

py_packages <- c("boto3",
    "botocore==1.23.24",
    "s3fs==2022.01.0",
    "pandas",
    "awswrangler",
    "psycopg2-binary==2.9.3")

py_install(py_packages, envname = venv_name, method = "virtualenv")
