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
  local package_path=""
  if [ "${package}" ]; then
    class=$(echo "$class" | sed "s/.class$//")
    file="${package}.${class}"
    #package_path=$(echo "$package" | sed "s|\.|/|g")
    #des="${des}/${package_path}"
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
des=$(path_resolve "$PROJECT_PATH" "bin")
main

des=$(path_resolve "$PROJECT_PATH" "build")
main

des=$(path_resolve "$PROJECT_PATH" ".")
main

## file-usage
# ./scripts/run-by-java.sh
#
