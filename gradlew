#!/bin/sh
#
# Copyright © 2015-2021 the original authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#       https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
case "`uname`" in
  CYGWIN*) cygwin=true;;
  MSYS*) msys=true;;
  Darwin*) darwin=true;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if $cygwin ; then
    [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
fi

# Attempt to guess JAVA_HOME if not set
if [ -z "$JAVA_HOME" ]; then
    if [ -r /etc/gentoo-release ] ; then
        JAVA_HOME=`java-config --jre-home`
    fi
    if [ -z "$JAVA_HOME" ]; then
        javaExecutable="`which java`"
        if [ -n "$javaExecutable" -a ! "`expr \"$javaExecutable\" : '\([^ ]*\)'`" = "no" ]; then
            # readlink(1) is not available as standard on Solaris 10.
            readLink=`which readlink`
            if [ ! `expr "$readLink" : '\([^ ]*\)'` = "no" ]; then
                if $darwin ; then
                    javaHome=`dirname "$(dirname "$javaExecutable")"`
                    javaExecutable="$javaHome/bin/java"
                fi
                if [ -z "$JAVA_HOME" ]; then
                    JAVA_HOME=`dirname "$(dirname "$javaExecutable")"`
                fi
                JAVA_HOME=`readlink -f "$JAVA_HOME"`
            fi
        fi
    fi
fi

# For Darwin, add the default JVM options to JAVA_OPTS
if $darwin; then
    DEFAULT_JVM_OPTS="$DEFAULT_JVM_OPTS -Xdock:name=$APP_NAME -Xdock:icon=$APP_HOME/media/gradle.icns"
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    JAVA_HOME=`cygpath --path --mixed "$JAVA_HOME"`
fi

# Set the executable path for the wrapper
WRAPPER_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

# Check if the wrapper jar exists
if [ ! -f "$WRAPPER_JAR" ]; then
    echo "Error: Could not find gradle-wrapper.jar at $WRAPPER_JAR"
    exit 1
fi

# Execute the wrapper
exec "$JAVA_HOME/bin/java" $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS "-Dorg.gradle.appname=$APP_BASE_NAME" -jar "$WRAPPER_JAR" "$@"
