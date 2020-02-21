#!/bin/sh

echo "=================================================="
echo "=                                                ="
echo "=                   JAVA                         ="
echo "=                                                ="
echo "=================================================="
#java --version
echo "$JAVA_HOME"

echo "=================================================="
echo "=                                                ="
echo "=                   GRADLE                       ="
echo "=                                                ="
echo "=================================================="
#gradle -v
echo "$GRADLE_HOME"

echo "=================================================="
echo "=                                                ="
echo "=                   ANDROID                      ="
echo "=                                                ="
echo "=================================================="
echo "$ANDROID_HOME"

## file-usage
# ./scripts/print-solft-version.sh
