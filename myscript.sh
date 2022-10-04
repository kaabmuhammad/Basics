#!/bin/env bash

APPLICATION_VERSION="Kaab's App"

HELP_TEXT=""

while getopts ":hvr:" opt; do
  case $opt in
    v)
      echo "$APPLICATION_VERSION" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
	h)
      echo "Help text" >&2
      ;;
	r)
	  echo "Files in directory" 
	  for dir in "$OPTARG"/*; do
	     echo $dir;
		 done  >&2
  esac
done