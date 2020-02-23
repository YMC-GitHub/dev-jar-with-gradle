#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/path_resolve.sh"
source "$THIS_FILE_PATH/common-function.sh"
source "$THIS_FILE_PATH/class-config.sh"
source "$THIS_FILE_PATH/src.construrot.config.sh"

# ##################  config  ##################
PROJECT_PATH=$(path_resolve "$THIS_FILE_PATH" "../")

#src=$(path_resolve "$PROJECT_PATH" "bin") # java file positon
file="${CLASS_NAME}"                      # java file name and class name
package="${PACKAGE_NAME}"                 # pckage name which class belong to
des=$(path_resolve "$PROJECT_PATH" "bin") # where genrate x.java file to

test_suffix=""
if [ $CODE_TYPE = "test" ]; then
  test_suffix="Test"
fi

# ##################  function  ##################
function main() {
  local result=""
  : <<note
  if [ "${package}" ]; then
    des="${des}${package}"
  fi
note

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
public class $CLASS_NAME${test_suffix} {
  // private static Logger logger = Logger.getLogger(Hello.class);

  public static void main(String[] args) {
    // logger.info("hello,world. welcome to gradle");
    System.out.println("Hello World!");
  }
}
EOF
  )

  if [[ $CODE_TYPE = "test" && "${test_path}" ]]; then
    des="${des}/${test_path}"
    file="${file}${test_suffix}"
  elif [ "${src_path}" ]; then
    des="${des}/${src_path}"
  fi

  if [ "${package}" ]; then
    package_path=$(echo "$package" | sed "s|\.|/|g")
    des="${des}/${package_path}"
  fi

  mkdir -p "${des}"
  echo "echo \"\$result\" >\"${des}/${file}.java\""
  echo "$result" >"${des}/${file}.java"

}

# ##################  run  ##################
# main

# ##################  demo  ##################
des=$(path_resolve "$PROJECT_PATH" ".") # where genrate x.java file to
main
## file-usage
# ./scripts/write-by-sh.sh
#
