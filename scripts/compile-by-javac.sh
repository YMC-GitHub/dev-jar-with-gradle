#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/path_resolve.sh"
source "$THIS_FILE_PATH/common-function.sh"

# ##################  config  ##################
PROJECT_PATH=$(path_resolve "$THIS_FILE_PATH" "../")
src=$(path_resolve "$PROJECT_PATH" ".")
file="Hello.java"
des=$(path_resolve "$PROJECT_PATH" "build")  # class file positon
class="Hello.class" # class file name and class name
package="" # pckage name which class belong to



# ##################  function  ##################
function caculate_some_var(){
  CLASS_FILE="${des}/${class}"
  if [ "${package}" ]; then
    CLASS_FILE="${des}/${package}/${class}"
  fi
}
function test() {
  local fn=
  local expectValue=
  local ouput=
  local getOuput=
  fn=${1}
  # delete " char for fun arg
  fn=$(echo "$fn" | sed "s/ *\"/ /g" | sed "s/\" */ /g")
  ouput=$($fn)
  expectValue=${2}
  getOuput=${3}
  if [ "${getOuput}" ]; then
    ouput=$($getOuput)
  fi
  echo "test:$fn"
  if [ "$ouput" = "$expectValue" ]; then
    echo "it is ok"
  else
    echo "it is false.expect $ouput = $expectValue"
  fi
}
function getOuput() {
  if [ $(hasFile "$CLASS_FILE") = "true" ]; then
    echo "true"
  else
    echo "false"
  fi
}
function rmClassFile() {
  if [ "$des" = "$PROJECT_PATH" ]; then
    rm -rf "$CLASS_FILE"
  elif [ "$des" = "." ]; then
    rm -rf "$CLASS_FILE"
  else
    rm -rf "$des"
  fi
}

# ##################  run  ##################
# main

# ##################  demo  ##################
#: <<NOTE
src=$(path_resolve "$PROJECT_PATH" ".")
file="Hello.java"
des=$(path_resolve "$PROJECT_PATH" "bin")
package="log"
caculate_some_var
rmClassFile
test "javac -sourcepath \"$src\" \"$file\"  -d \"$des\" " "true" "getOuput"

src=$(path_resolve "$PROJECT_PATH" ".")
file="Hello.java"
package="log"
des=$(path_resolve "$PROJECT_PATH" "build")
caculate_some_var
rmClassFile
test "javac -sourcepath \"$src\" \"$file\"  -d \"$des\" " "true" "getOuput"
#NOTE


# ##################  test  ##################

: <<NOTE
# test src
rm -rf "$CLASS_FILE"

test "javac $file" "true" "getOuput"

rm -rf "$CLASS_FILE"
test "javac $src/$file" "true" "getOuput"

rm -rf "$CLASS_FILE"
test "javac \"$src/$file\"" "true" "getOuput"

rm -rf "$CLASS_FILE"
test "javac -sourcepath \"$src\" \"$file\"" "true" "getOuput"

#2 relative path
#rm -rf "$CLASS_FILE"
#test 'javac -sourcepath "." "Hello.java"' "true" "getOuput"

# test des
rmClassFile
test "javac -sourcepath \".\" \"Hello.java\"  -d \"$des\" " "true" "getOuput"
test 'javac -sourcepath "." "Hello.java"  -d "build" ' "true" "getOuput"
test "javac -sourcepath \"$src\" \"$file\"  -d \"$des\" " "true" "getOuput"
NOTE
#rm -rf "$des"

## file-usage
# ./scripts/compile-by-javac.sh
#
