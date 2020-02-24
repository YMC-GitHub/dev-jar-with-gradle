#!/bin/sh

ext.'signing.keyId' = '密钥keyId'
ext.'signing.password' = '密钥password'
ext.'signing.secretKeyRingFile' = '私钥keyRingFile路径'

ext.'sonatypeUsername'='sonatype账号'
ext.'sonatypePassword'='sonatype密码'

signing.keyId='$SECRET_ID'
signing.password='$SECRET_PASSWORD'
signing.secretKeyRingFile='$PUBLIC_KEY_FILE'

msg=$(
  cat <<EOF
ext.'signing.keyId' = '$SECRET_ID'
ext.'signing.password' = '$SECRET_PASSWORD'
ext.'signing.secretKeyRingFile' = '$PUBLIC_KEY_FILE'

ext.'sonatypeUsername'='sonatype账号'
ext.'sonatypePassword'='sonatype密码'
EOF
)
echo "$msg"

# add below to build.gradle file head
#apply from: rootDir.canonicalPath + '/.gradle/publish.gradle'

## file-usage
# ./scripts/publish-to-sona-before.sh
#
