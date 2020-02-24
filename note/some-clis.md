# some clis

## content

```sh
# 查看任务
gradle tasks --all

# 运行任务
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

# 签名
#2- Signs all artifacts in the 'mavenJava' publication.
gradle signMavenJavaPublication

# 发布
#2 生成 metadata 文件
#2 - Generates the Gradle metadata file for publication 'mavenJava'.
gradle generateMetadataFileForMavenJavaPublication
#2 生成 pom 文件
#2 - Generates the Maven POM file for publication 'mavenJava'.
gradle generatePomFileForMavenJavaPublication
#2 - Publishes all Maven publications produced by this project to the maven repository.
gradle publishAllPublicationsToMavenRepository
#2 - Publishes Maven publication 'mavenJava' to the local Maven repository.
gradle publishMavenJavaPublicationToMavenLocal
#2 - Publishes Maven publication 'mavenJava' to Maven repository 'maven'.
gradle publishMavenJavaPublicationToMavenRepository
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

# 处理资源
#2 Processes main resources.
gradle processResources
#2 Processes test resources.
gradle processTestResources

# caculateConfig
# printConfig
# showRepos

# 校验
#2 - Runs all checks.
gradle check
#2 - Runs the unit tests.
gradle test
#2 - Displays all buildscript dependencies declared in root project
gradle buildEnvironment
#2 - Displays the components produced by root project
gradle components
#2 - Displays all dependencies declared in root project
gradle dependencies
#2 - Displays the configuration model of root project
gradle model
#2 - Displays the properties of root project
gradle properties
#2 - Displays the sub-projects of root project
gradle projects
#2 - Displays all dependencies declared in root project
gradle dependencies
#2 - Displays the insight into a specific dependency in root project
gradle dependencyInsight
#2 - Displays the dependent components of components in root project
gradle dependentComponents

#2 - Assembles the outputs of this project.
#2  Assembles and tests this project.
gradle build
#2  Assembles and tests this project and all projects that depend on it.
gradle buildDependents
#2  Assembles and tests this project and all projects it depends on.
gradle buildNeeded
#2  Assembles main classes.
gradle classes
#2  Deletes the build directory.
gradle clean
#2  Assembles a jar archive containing the main classes.
gradle jar
#2  Assembles a jar archive containing the main javadoc.
gradle javadocJar
#2  Assembles a jar archive containing the main sources.
gradle sourcesJar
#2  Assembles test classes.
gradle testClasses
```