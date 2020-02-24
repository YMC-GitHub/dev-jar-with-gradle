# dev-exe-with-gradle

## desc


## some envs

- gradle 6.1.1

## some deps

- log4j use to log
- junit use to test

## some cmds
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

## author

yemiancheng <ymc.github@gmail.com>

## license

MIT