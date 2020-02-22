#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)

source "$THIS_FILE_PATH/write-by-sh.sh"
source "$THIS_FILE_PATH/compile-by-javac.sh"
source "$THIS_FILE_PATH/run-by-java.sh"
source "$THIS_FILE_PATH/pack-by-jar.sh"

## file-usage
# ./scripts/one-by-sh.sh
