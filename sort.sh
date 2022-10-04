#!/bin/env bash

for dir in */; do
    find . -name "*.docx" -type f -execdir mv '{}' docfiles/ \;
    find . -name "*.txt" -type f -execdir mv '{}' txtfiles/ \;
done