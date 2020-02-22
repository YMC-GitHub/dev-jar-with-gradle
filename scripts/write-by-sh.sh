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

#src=$(path_resolve "$PROJECT_PATH" "bin") # java file positon
file="${CLASS_NAME}.java"                 # java file name and class name
package="${PACKAGE_NAME}"                 # pckage name which class belong to
des=$(path_resolve "$PROJECT_PATH" "bin") # where genrate x.java file to

# ##################  function  ##################
function main() {
  local result=""

  if [ "${package}" ]; then
    file="${package}.${file}"
  else
    file="${file}"
  fi

  if [ "${package}" ]; then
    result=$(
      cat <<EOF
$result
// my package name
package $package;
EOF
    )
  fi

  result=$(
    cat <<EOF
$result
// include some package
//import org.apache.log4j.Logger;
EOF
  )

  result=$(
    cat <<EOF
$result

// create my class
public class Hello {
  // private static Logger logger = Logger.getLogger(Hello.class);

  public static void main(String[] args) {
    // logger.info("hello,world. welcome to gradle");
    System.out.println("Hello World!");
  }
}
EOF
  )
  echo "echo \"\$result\" >\"${des}/${file}\""
  echo "$result" >"${des}/${file}"

}

# ##################  run  ##################
# main

# ##################  demo  ##################
des=$(path_resolve "$PROJECT_PATH" ".") # where genrate x.java file to
main
## file-usage
# ./scripts/write-by-sh.sh
#
