
# gradle usage

## 创建工程
```sh
gradle init --type java-application

```

## 执行任务

```sh
# 查看
gradle tasks --all
# 删除
gradle clean

# 构建
gradle build -x test
#2 打包？
#gradle jar

# 测试
#2 单元测试
gradle test

# 运行
gradle run
#java -jar build/libs/gradle-command-line.jar

```

## 创建任务
```
https://docs.gradle.org/5.6.4/dsl/org.gradle.api.Task.html
```


## reference
```
#Gradle初始化插件init
https://www.jianshu.com/p/f3a314b852a6
#Gradle-6.x内置插件
https://www.jianshu.com/p/8fa851716020

https://blog.csdn.net/x_iya/article/details/64923419
https://www.jianshu.com/p/b605d7fe073d
#Gradle各个版本手册
https://gradle.org/releases/

https://docs.gradle.org/5.6.4/userguide/userguide.html
https://docs.gradle.org/6.1.1/userguide/userguide.html
https://docs.gradle.org/6.1.1/javadoc/index.html?overview-summary.html
# Gradle Build Language Reference
https://docs.gradle.org/current/dsl/index.html
#
https://docs.gradle.org/6.1.1/userguide/groovy_build_script_primer.html
```