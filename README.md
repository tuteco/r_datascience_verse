# AWS ready RStudio with shiny server for datascience
```
   _         _                 
  | |_ _   _| |_ ___  ___ ___  
  | __| | | | __/ _ \/ __/ _ \ 
  | |_| |_| | ||  __/ (_| (_) |
 (_)__|\__,_|\__\___|\___\___/ 
 
 -- data & knowledge experts --                              
```
Base for this docker image is the 
[rocker/verse](https://github.com/rocker-org/rocker-versioned2)

with the addition of 
- shiny server
- python with virtual env name = `r-reticulate`

Already installed by rocker/verse image is the [reticulate](https://rstudio.github.io/reticulate/) package,
that allows interoperability between R and python.

To be AWS ready, we installed python pip
- [boto3](https://aws.amazon.com/sdk-for-python/) - default python AWS library allowing to work with local ECS endpoints
- [botor](https://daroczig.github.io/botor/) - access AWS api via boto3

The AWS ClI is also installed.


