#!/bin/bash

set -xeu -o pipefail

if [ -e aseq-v1.1.11-linux64.tar.gz -a -e aseq-examples.tar.gz ]; then
    echo skip download files
else
    date "+%Y%m%d-%H%M%S" > download-date.txt
    curl -o aseq-v1.1.11-linux64.tar.gz "http://demichelislab.unitn.it/lib/exe/fetch.php?media=aseq-v1.1.11-linux64.tar.gz"
    curl -o aseq-examples.tar.gz "http://demichelislab.unitn.it/lib/exe/fetch.php?media=aseq-examples.tar.gz"
fi

mkdir -p aseq
pushd aseq
tar xzf ../aseq-v1.1.11-linux64.tar.gz
tar xzf ../aseq-examples.tar.gz
popd