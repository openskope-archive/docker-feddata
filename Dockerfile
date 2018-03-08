from openskope/rgeo:0.1.2

ARG DEBIAN_FRONTEND=noninteractive
USER root

ENV DOCKER_IMAGE_NAME openskope/feddata

RUN echo '***** install FedData *****'                                                              \
 && echo 'install.packages(c("FedData"), repos="http://cran.us.r-project.org")'                     \
    > /tmp/install_feddata.R                                                                        \
 && R --no-save < /tmp/install_feddata.R

USER skope

ENV SELFTEST_DIR ${SELFTEST_BASE}/${DOCKER_IMAGE_NAME}
COPY ./selftest/expected.txt ${SELFTEST_BASE}
COPY ./selftest/test.sh ${SELFTEST_DIR}/
RUN ${SELFTEST_BASE}/runtest.sh

CMD echo "Usage: docker run openskope/feddata Rscript <r-script-using-feddata> [r-script-arguments]"