#!/bin/sh

: <<v1.0.0
isOK="false"
SECRET_HASH=$(gpg --list-keys | grep "^      " | sed "s/ *//g")

GPG_PUBLIC_KEY_SERVER="keyserver.ubuntu.com"
gpg --keyserver "$GPG_PUBLIC_KEY_SERVER" --send-keys "$SECRET_HASH"
if [ $? = "0" ]; then isOK="true"; fi

GPG_PUBLIC_KEY_SERVER="pool.sks-keyservers.net"
echo "send key to :$GPG_PUBLIC_KEY_SERVER"
gpg --keyserver "$GPG_PUBLIC_KEY_SERVER" --send-keys "$SECRET_HASH"
if [ $? = "0" ]; then isOK="true"; fi

GPG_PUBLIC_KEY_SERVER="keys.gnupg.net"
echo "send key to :$GPG_PUBLIC_KEY_SERVER"
gpg --keyserver "$GPG_PUBLIC_KEY_SERVER" --send-keys "$SECRET_HASH"
if [ $? = "0" ]; then isOK="true"; fi
v1.0.0

list=$(
  cat <<EOF
keys.gnupg.net
pool.sks-keyservers.net
keyserver.ubuntu.com
EOF
)

list=$(echo "$list" | sed "s/^ *#.*//" | sed "/^$/d")
arr=(${list// / })
length=${#arr[@]}
index_end=$(($length - 1))

isOK="false"
SECRET_HASH=$(gpg --list-keys | grep "^      " | sed "s/ *//g")
for ((i = 0; i < length; i++)); do
  GPG_PUBLIC_KEY_SERVER="${arr[$i]}"
  echo "send key to $GPG_PUBLIC_KEY_SERVER:"
  gpg --keyserver "$GPG_PUBLIC_KEY_SERVER" --send-keys "$SECRET_HASH"
  if [ $? = "0" ]; then
    isOK="true"
    echo "ok"
  else
    echo "no"
  fi
done

echo "$isOK"

## file-usage
# ./scripts/gpg-push-key.sh
#
