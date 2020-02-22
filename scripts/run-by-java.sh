#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/path_resolve.sh"
source "$THIS_FILE_PATH/common-function.sh"
source "$THIS_FILE_PATH/class-config.sh"

# ##################  config  ##################
PROJECT_PATH=$(path_resolve "$THIS_FILE_PATH" "../")
des=$(path_resolve "$PROJECT_PATH" "bin") # class file positon
class="${CLASS_NAME}.class"               # class file name and class name
package="${PACKAGE_NAME}"                 # pckage name which class belong to

# ##################  function  ##################
function main() {
  if [ "${package}" ]; then
    class=$(echo "$class" | sed "s/.class$//")
    file="${package}.${class}"
  else
    class=$(echo "$class" | sed "s/.class$//")
    file="${class}"
  fi
  echo "java -cp \"${des}\" \"${file}\""
  java -cp "${des}" "${file}"
}

# ##################  run  ##################
# main

# ##################  demo  ##################
# 无包的类
: <<note
des=$(path_resolve "$PROJECT_PATH" "bin")
main
note

# 带包的类
#: <<note
des=$(path_resolve "$PROJECT_PATH" "bin")
main

des=$(path_resolve "$PROJECT_PATH" "build")
main

des=$(path_resolve "$PROJECT_PATH" ".")
main
#note

## file-usage
# ./scripts/run-by-java.sh
#
