#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/path_resolve.sh"
source "$THIS_FILE_PATH/common-function.sh"

PROJECT_PATH=$(path_resolve "$THIS_FILE_PATH" "../")
src=$(path_resolve "$PROJECT_PATH" ".")
file="Hello.java"
#des=$(path_resolve "$PROJECT_PATH" "bin/main/log")
des=$(path_resolve "$PROJECT_PATH" "build")
CLASS_FILE="$des/Hello.class"

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

#NOTE

#: <<NOTE
src=$(path_resolve "$PROJECT_PATH" ".")
file="Hello.java"
des=$(path_resolve "$PROJECT_PATH" "bin/main")
CLASS_FILE="$des/Hello.class"
rmClassFile
test "javac -sourcepath \"$src\" \"$file\"  -d \"$des\" " "true" "getOuput"

src=$(path_resolve "$PROJECT_PATH" ".")
file="Hello.java"
des=$(path_resolve "$PROJECT_PATH" "build")
CLASS_FILE="$des/Hello.class"
rmClassFile
test "javac -sourcepath \"$src\" \"$file\"  -d \"$des\" " "true" "getOuput"
#NOTE
#rm -rf "$des"

## file-usage
# ./scripts/compile-by-javac.sh
#
