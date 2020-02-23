# gpg usage

## some cmd
```sh
#密钥密码
SECRET_PASSWORD=
#密钥指纹
SECRET_HASH=
#密钥标识
SECRET_ID=
#私钥文件
PUBLIC_KEY_FILE=secret.gpg
#公钥的服务器
GPG_PUBLIC_KEY_SERVER=


#c
#生成
gpg --generate-key

#r
#查看
#gpg -k
gpg --list-keys

#取密钥指纹
SECRET_HASH=$(gpg --list-keys|grep "^      "|sed "s/ *//g")
#获取密钥标识
SECRET_ID=$(echo ${SECRET_HASH:0-8})

#导出私钥文件
SECRET_HASH=$(gpg --list-keys|grep "^      "|sed "s/ *//g")
gpg --export-secret-keys "$SECRET_HASH" > "$PUBLIC_KEY_FILE"

#上传公钥到公钥服务器
GPG_PUBLIC_KEY_SERVER="keys.gnupg.net"
GPG_PUBLIC_KEY_SERVER="pool.sks-keyservers.net"

GPG_PUBLIC_KEY_SERVER="keyserver.ubuntu.com"
gpg --keyserver "$GPG_PUBLIC_KEY_SERVER" --send-keys "$SECRET_HASH"


#修改密钥密码
SECRET_PASSWORD=
SECRET_HASH=$(gpg --list-keys|grep "^      "|sed "s/ *//g")
gpg --edit-key "$SECRET_HASH"
# run passwd
# run save

msg=$(cat<<EOF
#密钥密码
SECRET_PASSWORD=$SECRET_PASSWORD
#密钥指纹
SECRET_HASH=$SECRET_HASH
#密钥标识
SECRET_ID=$SECRET_ID
#私钥文件
PUBLIC_KEY_FILE=$PUBLIC_KEY_FILE
#公钥的服务器
GPG_PUBLIC_KEY_SERVER=$GPG_PUBLIC_KEY_SERVER
EOF
)
echo "$msg"

msg=$(cat<<EOF
signing.keyId='$SECRET_ID'
signing.password='$SECRET_PASSWORD'
signing.secretKeyRingFile='$PUBLIC_KEY_FILE'
EOF
)
echo "$msg"
```

## reference
```
https://segmentfault.com/a/1190000018026290#item-4
```