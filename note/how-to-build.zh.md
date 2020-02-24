
# gradle usage

## 创建工程
```sh
gradle init --type java-application
gradle init --type java-library
```

## 执行任务

```sh
# 查看任务
gradle tasks --all

# 运行任务
# 删除
gradle clean

# 构建
gradle build -x test
#2  Assembles a jar archive containing the main classes.
gradle jar
#2  Assembles a jar archive containing the main javadoc.
gradle javadocJar
#2  Assembles a jar archive containing the main sources.
gradle sourcesJar

# 测试
#2 单元测试
gradle test

# 运行
#gradle run
#java -jar build/libs/gradle-command-line.jar

# 签名
#2- Signs all artifacts in the 'mavenJava' publication.
gradle signMavenJavaPublication

# 发布
#2  - Publishes all Maven publications produced by this project to the local Maven cache.
gradle publishToMavenLocal
#2 - Publishes all publications produced by this project.
gradle publish

# 文档
#2 - Generates Javadoc API documentation for the main source code.
gradle javadoc

# 编译
#2 Compiles main Java source
gradle compileJava
#2 Compiles test Java source.
gradle compileTestJava

# 校验
#2 - Runs all checks.
gradle check

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