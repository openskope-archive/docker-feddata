from openskope/rgeo:0.1.0

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN echo '***** install curl and ssl development libraries needed by devtools ***** '               \
 && apt-get -y install libcurl4-openssl-dev libssl-dev                                              \
                                                                                                    \
 && echo "***** install libxml development package *****"                                           \
 && apt-get -y install libxml2-dev                                                                  \
                                                                                                    \
 && echo '***** install FedData *****'                                                              \
 && echo 'install.packages(c("FedData"), repos="http://cran.us.r-project.org")'                     \
    > /tmp/install_feddata.R                                                                        \
 && R --no-save < /tmp/install_feddata.R

USER skope

CMD echo "Usage: docker run openskope/feddata Rscript <r-script-using-feddata> [r-script-arguments]"