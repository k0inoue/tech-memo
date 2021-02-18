#!/bin/bash

mkdir -p ./outputs/html
mkdir -p ./outputs/html/docker
mkdir -p ./outputs/html/github-actions

CURRENT_PATH=`pwd`
ASCIIDOCTOR_PDF_DIR=`gem contents asciidoctor-pdf --show-install-dir`

# -a, --attribute=ATTRIBUTE
# -B, --base-dir=DIR
# -D, --destination-dir=DIR
# -o, --out-file=OUT_FILE
# -R, --source-dir=DIR
# -b, --backend=BACKEND
# -d, --doctype=DOCTYPE
# -r, --require=LIBRARY

asciidoctor ./*.adoc
asciidoctor ./docker/*.adoc
asciidoctor ./github-actions/*.adoc

mv *.html ./outputs/html/
mv ./docker/*.html ./outputs/html/docker/
mv ./github-actions/*.html ./outputs/html/github-actions/
