#!/bin/sh

gradle init --type pom
gradle build
rm -rf pom.xml

# https://www.jianshu.com/p/88dd97035fed
