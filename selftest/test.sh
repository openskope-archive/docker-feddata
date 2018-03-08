source ${SELFTEST_BASE}/openskope/rgeo/test.sh

echo -n "FedData r package version       : "; echo $(Rscript -e "cat(as.character(packageVersion('FedData')))")

