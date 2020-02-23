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

src=$(path_resolve "$PROJECT_PATH" "bin") # class file positon
class="${CLASS_NAME}.class"               # class file name and class name
package="${PACKAGE_NAME}"                 # pckage name which class belong to
des=$(path_resolve "$PROJECT_PATH" "bin") # where genrate x.jar file to
# ##################  function  ##################
function main() {
  if [ "${package}" ]; then
    class=$(echo "$class" | sed "s/.class$//")
    #file="${package}.${class}"
    file="${class}"
    package_path=$(echo "$package" | sed "s|\.|/|g")
    src="${src}/${package_path}"
  else
    class=$(echo "$class" | sed "s/.class$//")
    file="${class}"
  fi
  #rm -rf "${des}/${file}.jar"
  cd "${src}"
  echo "jar cf \"${des}/${class}.jar\" \"${file}.class\""
  #jar cf "${des}/${class}.jar" "${src}/${file}.class"
  jar cf "${des}/${class}.jar" "${file}.class"

  if [ "${package}" ]; then
    echo "java -cp \"${des}\" \"${package}.${file}\""
    java -cp "${des}" "${package}.${file}"
  else
    echo "java -cp \"${des}/${class}.jar\" \"${file}\""
    java -cp "${des}/${class}.jar" "${file}"
  fi
}

# ##################  run  ##################
# main

# ##################  demo  ##################
PROJECT_PATH=$(path_resolve "$THIS_FILE_PATH" "../")
src=$(path_resolve "$PROJECT_PATH" "bin") # class file positon
des=$(path_resolve "$PROJECT_PATH" "bin") # where genrate x.jar file to
main

src=$(path_resolve "$PROJECT_PATH" "build") # class file positon
des=$(path_resolve "$PROJECT_PATH" "build") # where genrate x.jar file to
main

src=$(path_resolve "$PROJECT_PATH" ".") # class file positon
des=$(path_resolve "$PROJECT_PATH" ".") # where genrate x.jar file to
main

src=$(path_resolve "$PROJECT_PATH" ".")     # class file positon
des=$(path_resolve "$PROJECT_PATH" "build") # where genrate x.jar file to
main

: <<NOTE
# 建包（打包）
#2 某一个类
CLASS_NAME="Hello"
file="${CLASS_NAME}.class"
file=$(echo "$file" | sed "s/.class$//")
jar cf "${file}.jar" "$file.class"
#2 某个目录
jar cf "${file}.jar" "$file"

# 看包（查看）
jar tvf "${file}.jar"
#jar tvf "${file}.jar"> "${file}.txt"

# 解包
jar xvf "${file}.jar"
#or 解压
#unzip "${file}.jar" -d "${file}"
#rm -rf "${file}"

# 改包
#2 添加文件
jar uf "${file}.jar" "${file}.java"
#2 生成索引
jar i "${file}.jar"
#jar tvf "${file}.jar" | grep "INDEX.LIST"

#2 添加清单文件
PACKAGE_NAME="ymc.java.starter"
CLASS_NAME="Hello"
MAIN_CLASS="${CLASS_NAME}"
#if [ "${PACKAGE_NAME}" ]; then
#  MAIN_CLASS="${PACKAGE_NAME}.${MAIN_CLASS}"
#fi
cat > manifest.mf <<EOF
Manifest-Version: 1.0.0
Main-Class: $MAIN_CLASS
Class-Path: $CLASS_NAME.jar
EOF
jar cfm "${file}.jar" manifest.mf "$file.class"
#2 查看清单文件
jar -xvf "${file}.jar" META-INF/MANIFEST.MF
cat META-INF/MANIFEST.MF
rm -rf META-INF
#2 更新清单文件
jar cfm "${file}.jar" manifest.mf "$file.class"
#2 运行可执行包
java -jar "${file}.jar" #需在清单文件中指定Class-Path
#java -cp "${file}.jar" "${file}"

# 运包
java -cp "${file}.jar" "${file}"
#java -jar "${file}.jar" #需在清单文件中指定Class-Path
NOTE

## file-usage
# ./scripts/pack-by-jar.sh
#
