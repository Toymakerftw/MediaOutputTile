#!/bin/sh
set -e
GRADLE_HOME=$(dirname "$0")/gradle/wrapper
exec "$GRADLE_HOME/gradle-wrapper.jar" "$@"
