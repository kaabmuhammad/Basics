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

  DIR=/data

  files=$(ls $DIR | sed 's/^.*\.//' | sort -u)
  # COPY FILES
  
  cd /data
  echo `pwd`
  ls -man
  for file in $files 
  do
	  echo "mkdir $file"
	  mkdir $file				# Creates the folders based on file extensions
	  echo "*.$file $file/"
	  cp *.$file $file/		# copy specic extension files to the folder created
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
