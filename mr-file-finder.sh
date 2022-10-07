#!/bin/env bash

APPLICATION_VERSION="Kaab's App v1"
SCRIPT_NAME=$0

function print_help() {
  echo "Help text - ${SCRIPT_NAME}" >&2
  echo "${SCRIPT_NAME} -r <dir> = read and sort files into sorted folder" >&2
  echo "${SCRIPT_NAME} -h = print help" >&2
  echo "${SCRIPT_NAME} -v = print version" >&2
  echo "" >&2
  exit 1
}

function print_version() {
  echo "version is : ${APPLICATION_VERSION}" >&2
  exit 1
}

function sort() {
  SORT_DIRECTORY=$1
  echo "Files in directory: ${SORT_DIRECTORY}"
  # CREATE FOLDERS
  mkdir -p sorted
  mkdir -p sorted/docfiles
  mkdir -p sorted/txtfiles

  # COPY FILES
  for dir in "${SORT_DIRECTORY}"/*; do
      find . -name "*.docx" -type f -execdir cp -f '{}' "$(pwd)/sorted/docfiles/" \;
      find . -name "*.txt" -type f -execdir cp -f '{}' "$(pwd)/sorted/txtfiles/" \;
  done
}

while getopts ":hvr:" opt; do
  case $opt in
    v)
      print_version
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
    h)
      print_help
      ;;
    r)
      sort "$OPTARG"
      ;;
  esac
done