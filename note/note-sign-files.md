# sign files

## desc

sign files with sign plugin

## content

### config

config for gradle config file `build.gradle` by hands(or run cmd):

use sign plugin?

set signing key id?

set signing key secretKeyRingFile?

set what to sign?

to sign Publications ?

set Conditional Signing?

### run some cmd
```sh
#sign a publication output
gradle signMavenJavaPublication

#sign a configuration output

#sign a task  output

#sign pom files
```

## refer
```
#Gradle 发布到本地目录

#Gradle 发布到本地仓库
https://blog.csdn.net/qq_32768743/article/details/88290606
#Gradle 发布到远程仓库
https://blog.csdn.net/xq929609968/article/details/97630679
#Gradle 发布到中央仓库
https://docs.gradle.org/current/samples/sample_java_library_publishing.html
https://docs.gradle.org/6.1.1/userguide/publishing_maven.html
#将Gradle项目发布到Maven Central库中
https://www.cnblogs.com/lovellll/p/10093894.html
#使用Gradle发布工件到Maven仓库
https://blog.csdn.net/yingaizhu/article/details/85163062
#使用Gradle发布构件(Jar)到Maven中央仓库
https://segmentfault.com/a/1190000018026290
#使用 Gradle 发布开源项目到 Maven Central
https://my.oschina.net/specialcyci/blog/371352?p=2
```