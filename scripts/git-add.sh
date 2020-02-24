#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/path_resolve.sh"

PROJECT_PATH=$(path_resolve "$THIS_FILE_PATH" "..")

list=$(
  cat <<EOF
#.classpath
.gitattributes
#.gitignore
#bin/main/log/Hello.class
#note/gradle-usage.md
#note/reference.md
#src/main/java/log/Hello.java
#src/main/resources/log4j.properties
gradle/
gradlew
gradlew.bat
#note/some-lib.md
settings.gradle
#src/main/java/ymc/
#src/test/
EOF
)
#git ls-files --modified --deleted
#git ls-files --cached | sed "s/^/#/g"
#git ls-files --modified | sed "s/^/#/g"

list=$(echo "$list" | sed "s/^ *#.*//" | sed "/^$/d")
arr=(${list// / })
length=${#arr[@]}
index_end=$(($length - 1))

cd "$PROJECT_PATH"
for ((i = 0; i < length; i++)); do
  echo "git add ${arr[$i]}"
  git add "${arr[$i]}"
done

msg=$(
  cat <<EOF
build: manage lfs for .jar file
EOF
)
if [ "${msg}" ]; then
  echo "git commit -m \"$msg\""
  #git commit -m "$msg"
fi

## file-usage
# ./scripts/git-add.sh
#
