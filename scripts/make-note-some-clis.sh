#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/path_resolve.sh"

PROJECT_PATH=$(path_resolve "$THIS_FILE_PATH" "..")

list=$(
  cat <<EOF
build - Assembles and tests this project.
buildDependents - Assembles and tests this project and all projects that depend on it.
buildNeeded - Assembles and tests this project and all projects it depends on.
classes - Assembles main classes.
clean - Deletes the build directory.
jar - Assembles a jar archive containing the main classes.
javadocJar - Assembles a jar archive containing the main javadoc.
sourcesJar - Assembles a jar archive containing the main sources.
testClasses - Assembles test classes.
EOF
)

OLD_CHAR=" "
NEW_CHAR=$(echo -n "$OLD_CHAR" | md5sum | cut -d ' ' -f1)
NEW_CHAR=${NEW_CHAR:0:8}
#echo "$NEW_CHAR"

list=$(echo "$list" | sed "s/^ *#.*//" | sed "/^$/d")
list=$(echo "$list" | sed "s/$OLD_CHAR/$NEW_CHAR/g")
#echo "$list"

arr=(${list// / })
length=${#arr[@]}
index_end=$(($length - 1))

cd "$PROJECT_PATH"
for ((i = 0; i < length; i++)); do
  #echo "git add ${arr[$i]}"
  title=$(echo "${arr[$i]}" | sed "s/\-.*$//g")
  title=$(echo "$title" | sed "s/$NEW_CHAR/$OLD_CHAR/g")
  title="gradle $title"
  cmds=$(echo "${arr[$i]}" | sed "s/^.*\-//g")
  cmds=$(echo "$cmds" | sed "s/$NEW_CHAR/$OLD_CHAR/g")
  cmds="#2 $cmds"
  echo "$cmds"
  echo "$title"
done

## file-usage
# ./scripts/make-note-some-clis.sh
#
