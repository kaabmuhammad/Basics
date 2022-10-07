#!/bin/env bash

# CREATE FOLDERS
mkdir -p sorted
mkdir -p sorted/docfiles
mkdir -p sorted/txtfiles

# COPY FILES
for dir in */; do
    find . -name "*.docx" -type f -execdir cp -f '{}' "$(pwd)/sorted/docfiles/" \;
    find . -name "*.txt" -type f -execdir cp -f '{}' "$(pwd)/sorted/txtfiles/" \;
done