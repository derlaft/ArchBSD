#!/bin/sh

PROJECT_DIR=.

for FILE in ${PROJECT_DIR}/*
do
    git add ${FILE}
    git commit
done
